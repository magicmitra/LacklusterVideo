using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Management
{
    public partial class ManageCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/EditCustomer.aspx");
        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/AddCustomer.aspx");
        }
    }
}