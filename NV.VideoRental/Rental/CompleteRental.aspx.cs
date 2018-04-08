using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Rental
{
    public partial class CompleteRental : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int total;
            if (!String.IsNullOrEmpty(Request.QueryString["Total"]) && Int32.TryParse(Request.QueryString["Total"], out total))
                lblTotalDue.Text = String.Format("{0:C}", total);
            else
                Response.Redirect("../Default.aspx");
        }

        protected void btnReturnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    }
}