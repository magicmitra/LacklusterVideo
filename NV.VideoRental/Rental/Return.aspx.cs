using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Rental
{
    public partial class Return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                reloadMovies();
            }
        }

        private void reloadMovies()
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                var rented = entity.rentals
                    .Join(entity.videos, r => r.videoID, v => v.videoID, (r, v) => new { r, v })
                    .Where(vi => vi.r.returned == false && vi.v.rented == true)
                    .Select(vi => new { vi.v.videoID, vi.r.custID, vi.v.UPC, vi.v.title, vi.r.dayDue }).ToList();

                gvMovies.DataSource = rented;
                gvMovies.DataBind();
            }
        }

        protected void gvMovies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int vID = Int32.Parse(e.CommandArgument.ToString());

                using (LacklusterEntities entity = new LacklusterEntities())
                {
                    video selectedVid = entity.videos.Where(v => v.videoID == vID && v.rented == true).SingleOrDefault();
                    if (selectedVid != null)
                        selectedVid.rented = false;

                    rental selectedRental = entity.rentals.Where(r => r.videoID == vID && r.returned == false).SingleOrDefault();
                    if (selectedRental != null)
                    {
                        selectedRental.returned = true;

                        if (selectedRental.dayDue.Value.CompareTo(DateTime.Today) < 0)
                        {
                            customer cust = entity.customers.Where(c => c.custID == selectedRental.custID).SingleOrDefault();

                            if(cust != null)
                            {
                                cust.balance = cust.balance + 3;
                            }
                        }
                    }

                    entity.SaveChanges();

                    lblMessage.Text = selectedVid.title + " has been returned";
                }

                reloadMovies();
            }
        }

        protected void btnFindMovie_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                var rented = entity.rentals
                    .Join(entity.videos, r => r.videoID, v => v.videoID, (r, v) => new { r, v })
                    .Where(vi => vi.r.returned == false && vi.v.rented == true && (vi.v.videoID.ToString() == txtMovieID.Text || vi.v.title.Contains(txtMovieID.Text)))
                    .Select(vi => new { vi.v.videoID, vi.r.custID, vi.v.UPC, vi.v.title, vi.r.dayDue }).ToList();

                gvMovies.DataSource = rented;
                gvMovies.DataBind();
            }
        }
    }
}