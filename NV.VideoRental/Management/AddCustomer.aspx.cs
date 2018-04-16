using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Management
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cAddCustomer_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                customer c = new customer();
                c.firstName = cFirstName.Text.ToString();
                c.lastName = cLastName.Text.ToString();
                c.streetAddress = cAddress.Text.ToString();
                c.city = cCity.Text.ToString();
                c.state = cState.Text.ToString();
                c.phone = cPhoneNumber.Text.ToString();
                int zipFromString = 0;
                int.TryParse(cZipCode.Text, out zipFromString);

                if (zipFromString != 0)
                {
                    c.zip = zipFromString;
                }
                else
                {
                    c.zip = 99999;
                }

                c.active = true;

                entity.customers.Add(c);
                entity.SaveChanges();
            }

            Response.Redirect("~/Management/ManageCustomer.aspx");
        }
    }
}