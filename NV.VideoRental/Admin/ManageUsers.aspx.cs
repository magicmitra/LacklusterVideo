using System;
using System.Collections.Generic;
using System.Linq;

using Microsoft.AspNet.Membership.OpenAuth;

namespace NV.VideoRental.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected void Page_Load()
        {
            if (!IsPostBack)
            {
                using (LacklusterEntities entity = new LacklusterEntities())
                {
                    List<employee> emps = entity.employees.ToList();
                    gvEmployees.DataSource = emps;
                    gvEmployees.DataBind();
                }
            }
        }

        protected void btnGetUser_Click(object sender, EventArgs e)
        {

        }
    }
}