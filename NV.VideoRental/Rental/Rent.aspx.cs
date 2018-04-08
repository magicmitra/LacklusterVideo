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
        private int custID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
<<<<<<< HEAD
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
                            lblBalance.Text = String.Format("{0:C}", cust.balance);
                        }
                    }
                    catch(Exception ex)
                    {
                        throw ex;
                        //Response.Redirect("Rent.aspx");
=======
                int custID;
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]) && Int32.TryParse(Request.QueryString["ID"], out custID))
                {
                    using (LacklusterEntities entity = new LacklusterEntities())
                    {
                        List<video> videos = entity.videos.ToList();
                        gvMovies.DataSource = videos;
                        gvMovies.DataBind();
>>>>>>> 09f44574a441a377f57292ab13b587dd8171e463
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
<<<<<<< HEAD
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<video> videos = entity.videos.Where(v => v.rented == false && (v.videoID.ToString() == txtMovieID.Text || v.title.Contains(txtMovieID.Text))).Take(20).ToList();
                gvMovies.DataSource = videos;
                gvMovies.DataBind();
            }
        }

        private void reloadMovies()
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<video> videos = entity.videos.Where(v => v.rented == false).Take(20).ToList();
                gvMovies.DataSource = videos;
                gvMovies.DataBind();
=======
>>>>>>> 09f44574a441a377f57292ab13b587dd8171e463

                custID = Int32.Parse(Request.QueryString["ID"]);

                var rented = entity.rentals
                    .Join(entity.videos, r => r.videoID, v => v.videoID, (r, v) => new { r, v })
                    .Where(vi => vi.r.custID == custID && vi.r.returned == false && vi.v.rented == true)
                    .Select(vi => new { vi.v.videoID, vi.v.UPC, vi.v.title, vi.r.dayDue}).ToList();
                //List<int> vids = entity.rentals.Where(r => r.custID == custID && r.returned == false).Select(r => r.videoID).ToList();
                //List<video> rented = entity.videos.Where(v => v.rented == true && vids.Contains(v.videoID)).ToList();
                gvRented.DataSource = rented;
                gvRented.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                custID = Int32.Parse(Request.QueryString["ID"]);
                //Determine the RowIndex of the Row whose Button was clicked.
                int vID = Int32.Parse(e.CommandArgument.ToString());

                using (LacklusterEntities entity = new LacklusterEntities())
                {
                    video selectedVid = entity.videos.Where(v => v.videoID == vID).SingleOrDefault();
                    if (selectedVid != null)
                    {
                        selectedVid.rented = true;
                        entity.SaveChanges();
                    }

                    rental r = new rental();
                    r.custID = custID;
                    r.dayRented = DateTime.Today;
                    r.dayDue = DateTime.Today.AddDays(3);
                    r.empID = 0; //Need to add later from logged in user
                    r.videoID = vID;
                    r.returned = false;

                    entity.rentals.Add(r);

                    entity.SaveChanges();
                }

                hfTotal.Value = (Int32.Parse(hfTotal.Value) + 3).ToString();
                lblTotal.Text = String.Format("{0:C}", Int32.Parse(hfTotal.Value));

                reloadMovies();
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompleteRental.aspx?Total=" + hfTotal.Value);
        }
    }
}