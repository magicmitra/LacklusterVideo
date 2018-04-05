using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NV.VideoRental;

namespace NV.VideoRental.Rental
{
    public partial class Rent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int custID;
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]) && Int32.TryParse(Request.QueryString["ID"], out custID))
                {
                    using (LacklusterEntities entity = new LacklusterEntities())
                    {
                        List<video> videos = entity.videos.ToList();
                        gvMovies.DataSource = videos;
                        gvMovies.DataBind();
                    }

                    pnlSelectCustomer.Visible = false;
                    pnlMovies.Visible = true;
                }
                else
                {
                    using (LacklusterEntities entity = new LacklusterEntities())
                    {
                        List<customer> customers = entity.customers.ToList();
                        gvCustomers.DataSource = customers;
                        gvCustomers.DataBind();
                    }

                    pnlSelectCustomer.Visible = true;
                    pnlMovies.Visible = false;
                }
            }
        }

        protected void btnGetCustomer_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<customer> customers = entity.customers.Where(c => c.custID.ToString() == txtCustomerInfo.Text || c.lastName == txtCustomerInfo.Text).ToList();
                gvCustomers.DataSource = customers;
                gvCustomers.DataBind();

            }
        }

        protected void btnFindMovie_Click(object sender, EventArgs e)
        {

        }
    }
}