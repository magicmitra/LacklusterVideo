using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using HashFunction;
using SaltFunction;
using FormValidator;
using DuplicateChecker;


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
            /* Edited 4/16/18:
             * passwordPlusSalt is input to Hash algorithm and the output
             * is saved to the DB
             */
            string lookupSalt = null;
            string passwordPlusSalt = null;
            string passwordString = ePassword.Text.ToString();
            SaltGenerator salt = new SaltGenerator();
            HasherOfPasswords hash = new HasherOfPasswords();
            FormValidatorClass fv = new FormValidatorClass();
            DuplicateCheckerClass dc = new DuplicateCheckerClass();

            /* TODO
             * These variables will be used to check for validation.
             * inputs will be stored in here and checked for validation
             * before being stored as a DB entry.
             * 
             */
            string firstNameStr = eFirstName.Text.ToString();
            string lastNameStr = eLastName.Text.ToString();
            string stAddressStr = eAddress.Text.ToString();
            string stateStr = eState.Text.ToString();
            string phoneStr = ePhoneNumber.Text.ToString();
            string zipStr = eZipCode.Text.ToString();
            string userNameStr = eUsername.Text.ToString();
            
            // validate if person already exists
            bool duplicatePerson = dc.AlreadyExists(firstNameStr, lastNameStr, stAddressStr, userNameStr);
            if(duplicatePerson)
            {
                // then this person already exists in the records
                // TODO: write code in here that alerts the AddEmployee.aspx page of a dulpicate 
                // entry attempt. For now, NULL the values so they will not be passed to the DB
                firstNameStr = null;
                lastNameStr = null;
                stAddressStr = null;
                userNameStr = null;
            }
            // No need for else, keep validating... If entry does not exist in DB, values 
            // won't be nulled.

            // validate state intial
            bool validState = fv.IsValidState(stateStr);
            if(!validState)
            {
                // State is not valid. 
                // TODO: write code in here that alerts the AddEmployee.aspx page of an invalid
                // state. For now, NULL the values so they will not be passed to the DB
                stateStr = null;
            }
            // No need for else, keep validating... 

            // validate phone number
            bool validPhone = fv.IsValidPhone(phoneStr);
            if(!validPhone)
            {
                // Phone number is not valid.
                // TODO: write code that alerts AddEmployee.aspx page of an invalid phone.
                // NULL the value so it will not be passed to the DB.
                phoneStr = null;
            }

            // validate zip
            bool validZip = fv.IsValidZip(zipStr);
            if(!validZip)
            {

                // Zip Code is not valid.
                // TODO: write code that alerts AddEmployee.aspx page of an invalid zip.
                // NULL the value so it will not be passed to the DB.
                zipStr = null;
            }

            using (LacklusterEntities entity = new LacklusterEntities())
            {
                employee em = new employee();
                em.firstName = firstNameStr;
                em.lastName = lastNameStr;
                em.streetAddress = stAddressStr;
                em.city = eCity.Text.ToString();
                em.state = stateStr;
                em.phone = phoneStr;
                em.userName = userNameStr;

                lookupSalt = salt.SaltMe(em.firstName, em.lastName);
                passwordPlusSalt = passwordString + lookupSalt;
                em.llv_password = hash.HashPassword(passwordPlusSalt);
                em.salt = lookupSalt;

                //em.llv_password = ePassword.Text;
                //eUsername.Text = passwordPlusSalt;

                em.manager = eIsManager.Checked;
                em.active = true;

                
                int zipFromString = 0;
                int.TryParse(zipStr, out zipFromString);

                em.zip = zipFromString;

                /*
                if (zipFromString != 0)
                {
                    em.zip = zipFromString;
                }
                else
                {
                    em.zip = 99999;
                }
                */
                entity.employees.Add(em);
                entity.SaveChanges();
            }

            Response.Redirect("~/Management/ManageEmployee.aspx");
        }
    }
}