using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.Configuration;

namespace NV.VideoRental.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void cmdLogin_ServerClick(object sender, System.EventArgs e)
        {
            if (ValidateUser(txtUserName.Value, txtUserPass.Value))
            {
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, txtUserName.Value, DateTime.Now, DateTime.Now.AddMinutes(120), chkPersistCookie.Checked, txtIsManager.Value);
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                if (chkPersistCookie.Checked)
                    ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);

                string strRedirect;
                strRedirect = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
                if (strRedirect == null)
                    strRedirect = "~/default.aspx";
                Response.Redirect(strRedirect, true);
            }
            else
                Response.Redirect("login.aspx", true);
        }

        private bool ValidateUser(string userName, string passWord)
        {

            // Try this code for now. If it works, everything below it should be ignored
            // because of the return clause
            if((0 == string.Compare(userName, "Admin", true)) && (0 == string.Compare(passWord, "Admin", true)))
            {
                return true;
                // should allow login now.  
            }

            // 4/3/18: Added variables cmd2(SqlCommand), lookupSalt(string)
            // and passwordPlusSalt(string)

            SqlConnection conn;
            SqlCommand cmd;
            SqlCommand cmd2; // salt look up
            string lookupPassword = null;
            string lookupSalt = null;
            string passwordPlusSalt = null;

            // Check for invalid userName.
            // userName must not be null and must be between 1 and 15 characters.
            if ((null == userName) || (0 == userName.Length) || (userName.Length > 15))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.");
                return false;
            }

            // Check for invalid passWord.
            // passWord must not be null and must be between 1 and 25 characters.
            if ((null == passWord) || (0 == passWord.Length) || (passWord.Length > 25))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.");
                return false;
            }

            try
            {
                // Consult with your SQL Server administrator for an appropriate connection
                // string to use to connect to your local SQL Server.
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn = new SqlConnection();
                conn.Open();

                // Create SqlCommand to select pwd field from users table given supplied userName.
                cmd = new SqlCommand("Select llv_password from users where userName=@userName", conn);
                cmd.Parameters.Add("@userName", SqlDbType.VarChar, 25);
                cmd.Parameters["@userName"].Value = userName;

                // Execute command and fetch pwd field into lookupPassword string.
                lookupPassword = (string)cmd.ExecuteScalar();

                // Create SqlCommand to select salt field from users table given supplied username.
                // Execute command and fect salt field into lookupSalt string.
                cmd2 = new SqlCommand("Select salt from users where userName=@userName", conn);
                cmd2.Parameters.Add("@userName", SqlDbType.VarChar, 25);
                cmd2.Parameters["@username"].Value = userName;
                lookupSalt = (string)cmd.ExecuteScalar();

                // Cleanup command and connection objects.
                cmd.Dispose();
                conn.Dispose();
                cmd2.Dispose();
            }
            catch (Exception ex)
            {
                // Add error handling here for debugging.
                // This error message should not be sent back to the caller.
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " + ex.Message);
            }

            // If no password found, return false.
            if (null == lookupPassword)
            {
                // You could write failed login attempts here to event log for additional security.
                return false;
            }
            else
            {
                // Consult with your SQL Server administrator for an appropriate connection
                // string to use to connect to your local SQL Server.
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn = new SqlConnection();
                conn.Open();

                // Create SqlCommand to select pwd field from users table given supplied userName.
                cmd = new SqlCommand("Select manager from users where userName=@userName", conn);
                cmd.Parameters.Add("@userName", SqlDbType.VarChar, 25);
                cmd.Parameters["@userName"].Value = userName;

                // Execute command and fetch pwd field into lookupPassword string.
                txtIsManager.Value = (string)cmd.ExecuteScalar();
            }

            /* Hash input password ('passWord' + 'lookupSalt') in here
             * Use a variable to store the output of the hash. Can use the same parameter
             * 'passWord' passed into this method. Contents will be replaced with new hash value.
             * can hardcode it in here or code a function that takes an input, hashes it, then returns
             * the output. 
             * Input------->Hash Function-------->Output(returned)
             */
            passwordPlusSalt = passWord + lookupSalt;

            /* Whenever the connection to Security folder has been established
             * HasherOfPasswords hasher = new HasherOfPAsswords();
             * passWord = hasher.HashPassword(passWordPlusSalt);
             * NOTE: UNCOMMENT THIS PART ONCE CONNECTIONS HAVE BEEN MADE
             */
            

            // Compare lookupPassword and input passWord, using a case-sensitive comparison.
            // Note about this atrocious segment of code: 
            // For the demo, Sidener can just enter "Admin" for both usernames and password, not case sensitive.
            // Reminder to delete the code that allows "Admin" to login 
            return ((0 == string.Compare(userName, "Admin", true) && 
                    (0 == string.Compare(passWord, "Admin", true))) ||
                    (0 == string.Compare(lookupPassword, passWord, false)));

        }

        /* TODO: 
         * 1. Figure out regirstration forms and DB
         * 2. Add salt to password, store salt into table (Progressed)
         * 3. Hash password with salt combo using BCrypt or PDK2(Progressed)
         * 4. Limit login attempts to 4 times
         */
    }
}