using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using HashFunction;
using SaltFunction;


namespace NV.VideoRental.Management
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.UserData.ToLower() == "false")
                Response.Redirect("~/Default.aspx");

        }

        protected void eAddEmployee_Click(object sender, EventArgs e)
        {
            // Edited 4/16/18:
            // passwordPlusSalt is input to Hash algorithm and the output
            // is saved to the DB
            string lookupSalt = null;
            string passwordPlusSalt = null;
            string passwordString = ePassword.Text;

            using (LacklusterEntities entity = new LacklusterEntities())
            {
                SaltGenerator salt = new SaltGenerator();
                HasherOfPasswords hash = new HasherOfPasswords();
                employee em = new employee();
                em.firstName = eFirstName.Text.ToString();
                em.lastName = eLastName.Text.ToString();
                em.streetAddress = eAddress.Text.ToString();
                em.city = eCity.Text.ToString();
                em.state = eState.Text.ToString();
                em.phone = ePhoneNumber.Text.ToString();
                em.userName = eUsername.Text.ToString();

                lookupSalt = salt.SaltMe(em.firstName, em.lastName);
                passwordPlusSalt = passwordString + lookupSalt;
                em.llv_password = hash.HashPassword(passwordPlusSalt);
                em.salt = lookupSalt;

                //em.llv_password = ePassword.Text;
                //eUsername.Text = passwordPlusSalt;

                em.manager = eIsManager.Checked;
                em.active = true;

                int zipFromString = 0;
                int.TryParse(eZipCode.Text, out zipFromString);

                if (zipFromString != 0)
                {
                    em.zip = zipFromString;
                }
                else
                {
                    em.zip = 99999;
                }

                entity.employees.Add(em);
                entity.SaveChanges();
            }

            Response.Redirect("~/Management/ManageEmployee.aspx");
        }
    }
}