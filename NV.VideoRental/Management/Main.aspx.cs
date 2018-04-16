using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Management
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/ManageCustomer.aspx");
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/ManageEmployee.aspx");
        }

        protected void btnUploadMovies_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/Movies.aspx");
        }
    }
}