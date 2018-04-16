using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Management
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.UserData.ToLower() == "false")
                Response.Redirect("~/Default.aspx");
        }

        protected void btnEditEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/EditEmployee.aspx");
        }

        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management/AddEmployee.aspx");
        }
    }
}