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
using HashFunction;

namespace NV.VideoRental.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void cmdLogin_ServerClick(object sender, System.EventArgs e)
        {
            if (ValidateUser(txtUser.Text, txtPass.Text))
            {
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, txtUser.Text, DateTime.Now, DateTime.Now.AddMinutes(120), chkPersistCookie.Checked, txtIsManager.Value);
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
            //else
                //Response.Redirect("login.aspx", true);
        }

        private bool ValidateUser(string userName, string passWord)
        {

            // Try this code for now. If it works, everything below it should be ignored
            // because of the return clause
            if ((0 == string.Compare(userName, "Admin", true)) && (0 == string.Compare(passWord, "Admin", true)))
            {
                return true;
                // should allow login now.  
            }

            // 4/3/18: Added variables cmd2(SqlCommand), lookupSalt(string)
            // and passwordPlusSalt(string)
            string lookupSalt = null;
            string passwordPlusSalt = null;
            HasherOfPasswords hash = new HasherOfPasswords();

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

            using (LacklusterEntities entity = new LacklusterEntities())
            {
                try
                {
                    employee emp = entity.employees.Where(e => e.userName == userName).SingleOrDefault();

                    if (emp == null)
                        return false;
                    else
                    {
                        txtIsManager.Value = emp.manager.ToString();
                        lookupSalt = emp.salt;
                        passwordPlusSalt = passWord + lookupSalt;
                        passWord = hash.HashPassword(passwordPlusSalt);
                        return (emp.llv_password == passWord);
                    }
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
    }
}