using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Management
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        private int custID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]) && Int32.TryParse(Request.QueryString["ID"], out custID))
                {
                    try
                    {
                        using (LacklusterEntities entity = new LacklusterEntities())
                        {
                            reloadMovies();

                            customer cust = entity.customers.Where(c => c.custID == custID).Single();
                            lblCustomerID.Text = cust.custID.ToString();
                            lblCustomerName.Text = cust.firstName + " " + cust.lastName;
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                        //Response.Redirect("Rent.aspx");
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

        private void reloadMovies()
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                custID = Int32.Parse(Request.QueryString["ID"]);
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

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                custID = Int32.Parse(Request.QueryString["ID"]);
                customer cust = entity.customers.Where(c => c.custID == custID).Single();
                cust.firstName = cFirstName.Text;
                cust.lastName = cLastName.Text;
                cust.streetAddress = cAddress.Text;
                cust.city = cCity.Text;
                cust.state = cState.Text;
                int zipFromString = 0;
                int.TryParse(cZipCode.Text, out zipFromString);

                if (zipFromString != 0)
                {
                    cust.zip = zipFromString;
                }

                entity.SaveChanges();
            }
            Response.Redirect("EditCustomer.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                custID = Int32.Parse(Request.QueryString["ID"]);
                //Determine the RowIndex of the Row whose Button was clicked.
                int vID = Int32.Parse(e.CommandArgument.ToString());

                reloadMovies();
            }
        }
    }
}