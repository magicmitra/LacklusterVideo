using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FormValidator;

namespace NV.VideoRental.Management
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        private int custID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]) && Int32.TryParse(Request.QueryString["ID"], out custID))
                {
                    try
                    {
                        using (LacklusterEntities entity = new LacklusterEntities())
                        {
                            customer cust = entity.customers.Where(c => c.custID == custID).Single();
                            lblCustomerID.Text = cust.custID.ToString();
                            lblCustomerName.Text = cust.firstName + " " + cust.lastName;
                            cFirstName.Text = cust.firstName;
                            cLastName.Text = cust.lastName;
                            cAddress.Text = cust.streetAddress;
                            cCity.Text = cust.city;
                            cState.Text = cust.state;

                            int zipFromString = 0;
                            int.TryParse(cZipCode.Text, out zipFromString);

                            if (zipFromString != 0)
                            {
                                cust.zip = zipFromString;
                            }
                            else
                            {
                                cust.zip = 99999;
                            }

                            cPhoneNumber.Text = cust.phone;

                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                        //Response.Redirect("Rent.aspx");
                    }

                    pnlSelectCustomer.Visible = false;
                    pnlMovies.Visible = true;
                }
                else
                {
                    reloadCust();

                    pnlSelectCustomer.Visible = true;
                    pnlMovies.Visible = false;
                }
            }
        }

        private void reloadCust()
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<customer> customers = entity.customers.Where(c => c.active == true).ToList();
                gvCustomers.DataSource = customers;
                gvCustomers.DataBind();
            }
        }


        protected void btnGetCustomer_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<customer> customers = entity.customers.Where(c => (c.custID.ToString() == txtCustomerInfo.Text || c.lastName == txtCustomerInfo.Text) && c.active == true).ToList();
                gvCustomers.DataSource = customers;
                gvCustomers.DataBind();
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string stateStr = cState.Text.ToString();
            string zipStr = cZipCode.Text.ToString();
            string phoneStr = cPhoneNumber.Text.ToString();
            bool pageValid = true;
            FormValidatorClass fv = new FormValidatorClass();

            // validate state, zip, phone
            bool validState = fv.IsValidState(stateStr);
            if(!validState)
            {
                stateStr = null;
                rfvState.ErrorMessage = "Required, enter valid US state initial (CA, IL, GA)";
                rfvState.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }

            bool validZip = fv.IsValidZip(zipStr);
            if(!validZip)
            {
                zipStr = null;
                rfvZip.ErrorMessage = "Required, enter a valid Zip Code";
                rfvZip.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }

            bool validPhone = fv.IsValidPhone(phoneStr);
            if(!validPhone)
            {
                phoneStr = null;
                rfvPhone.ErrorMessage = "Required, enter a valid phone number";
                rfvPhone.ForeColor = System.Drawing.Color.Red;
                pageValid = false;
            }

            // save to DB only once entries are validated
            if(pageValid == true)
            {
                using (LacklusterEntities entity = new LacklusterEntities())
                {
                    custID = Int32.Parse(Request.QueryString["ID"]);
                    customer cust = entity.customers.Where(c => c.custID == custID).Single();
                    cust.firstName = cFirstName.Text;
                    cust.lastName = cLastName.Text;
                    cust.phone = phoneStr;
                    cust.streetAddress = cAddress.Text;
                    cust.city = cCity.Text;
                    cust.state = stateStr;
                    int zipFromString = 0;
                    int.TryParse(zipStr, out zipFromString);
                    cust.zip = zipFromString;

                    /*
                    if (zipFromString != 0)
                    {
                        cust.zip = zipFromString;
                    }
                    */

                    entity.SaveChanges();
                }
            }
            else
            {
                // redirect
            }
           
            Response.Redirect("EditCustomer.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                custID = Int32.Parse(Request.QueryString["ID"]);
                customer cust = entity.customers.Where(c => c.custID == custID).Single();

                cust.active = false;

                entity.SaveChanges();
            }

            Response.Redirect("EditCustomer.aspx");
        }
    }
}