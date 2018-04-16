using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Reports
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnActiveCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/ActiveCustomers.aspx");
        }

        protected void btnLateMovies_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/LateMovies.aspx");
        }

        protected void btnPopularMovies_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/PopularMovies.aspx");
        }
    }
}