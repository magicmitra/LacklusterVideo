﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FormValidator;
using DuplicateChecker;

namespace NV.VideoRental.Management
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cAddCustomer_Click(object sender, EventArgs e)
        {
            string firstNameStr = cFirstName.Text.ToString();
            string lastNameStr = cLastName.Text.ToString();
            string stAddressStr = cAddress.Text.ToString();
            string stateStr = cState.Text.ToString();
            string zipStr = cZipCode.Text.ToString();
            string phoneStr = cPhoneNumber.Text.ToString();
            bool pageValid = true;

            // TODO:
            // Add some code validation, WORK IN PROGRESS 
            FormValidatorClass fv = new FormValidatorClass();
            DuplicateCheckerClass dc = new DuplicateCheckerClass();

            // validate if customer already exists
            bool duplicatePerson = dc.AlreadyExists(firstNameStr, lastNameStr, stAddressStr);
            if(duplicatePerson)
            {
                // Customer already exists. 
                // TODO: ccreate code to notify AddCustomer.aspx of duplicate entry
                // null the values now so none will be passed to DB
                firstNameStr = null;
                lastNameStr = null;
                stAddressStr = null;
                rfvFirst.ErrorMessage = "Required, person you entered already exists";
                rfvLast.ErrorMessage = "Required, person you entered already exists";
                rfvFirst.ForeColor = System.Drawing.Color.Red;
                rfvLast.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }
            // No need for else, keep validating....

            // validate valid state initials
            bool validState = fv.IsValidState(stateStr);
            if(!validState)
            {
                // invalid state.
                // TODO: create code to notify AddCustomer.aspx of invalid state
                stateStr = null;
                rfvState.ErrorMessage = "Required, enter a valid US state intial (CA, IL. GA)";
                rfvState.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }
            // keep validating

            // validate phone
            bool validPhone = fv.IsValidPhone(phoneStr);
            if(!validPhone)
            {
                // invalid phone
                // TODO: notify AddCustomer.aspx of invalid phone
                phoneStr = null;
                rfvPhone.ErrorMessage = "Required, enter a valid phone number";
                rfvPhone.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }

            // validate zip code
            bool validZip = fv.IsValidZip(zipStr);
            if(!validZip)
            {
                // invalid zip
                // TODO: notify AddCustomer.aspx of invalid zip
                zipStr = null;
                rfvZip.ErrorMessage = "Required, enter a valid Zip Code";
                rfvZip.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }

            // save to DB only if entries are validated
            if(pageValid == true)
            {
                using (LacklusterEntities entity = new LacklusterEntities())
                {
                    customer c = new customer();
                    c.firstName = firstNameStr;
                    c.lastName = lastNameStr;
                    c.streetAddress = stAddressStr;
                    c.city = cCity.Text.ToString();
                    c.state = stateStr;
                    c.phone = phoneStr;


                    int zipFromString = 0;
                    int.TryParse(zipStr, out zipFromString);

                    c.zip = zipFromString;
                    /*
                    if (zipFromString != 0)
                    {
                        c.zip = zipFromString;
                    }
                    else
                    {
                        c.zip = 99999;
                    }
                    */

                    c.active = true;

                    entity.customers.Add(c);
                    entity.SaveChanges();
                }
            }
            else
            {
                // redirect?
            }

            Response.Redirect("~/Management/ManageCustomer.aspx");
        }
    }
}
