using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Rental/Rent.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Rental/Return.aspx");
        }

        protected void btnManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/Main.aspx");
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/Main.aspx");
        }
    }
}