using System;
using System.Collections.Generic;
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
            String fName = cFirstName.Text.ToString();
            System.Diagnostics.Debug.WriteLine(fName);

            String lName = cLastName.Text.ToString();
            String address = cAddress.Text.ToString();
            String city = cCity.Text.ToString();
            String state = cState.Text.ToString();
            String zip = cZipCode.Text.ToString();
            String phone = cPhoneNumber.Text.ToString();

            var db = Database.Open("database location...");
            var insertCommand = "some query stuff...";
            db.Execute(insertCommand, lName, address, city, state, zip, phone);
        }
    }
}