using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NV.VideoRental.Management
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        private int empID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]) && Int32.TryParse(Request.QueryString["ID"], out empID))
                {
                    try
                    {
                        using (LacklusterEntities entity = new LacklusterEntities())
                        {
                            reloadMovies();

                            employee emp = entity.employees.Where(c => c.empID == empID).Single();
                            lblEmployeeID.Text = emp.empID.ToString();
                            lblEmployeeName.Text = emp.firstName + " " + emp.lastName;
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                        //Response.Redirect("Rent.aspx");
                    }

                    pnlSelectEmployee.Visible = false;
                    pnlMovies.Visible = true;
                }
                else
                {
                    using (LacklusterEntities entity = new LacklusterEntities())
                    {
                        List<employee> Employees = entity.employees.ToList();
                        gvEmployees.DataSource = Employees;
                        gvEmployees.DataBind();
                    }

                    pnlSelectEmployee.Visible = true;
                    pnlMovies.Visible = false;
                }
            }
        }

        private void reloadMovies()
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                empID = Int32.Parse(Request.QueryString["ID"]);
            }
        }


        protected void btnGetEmployee_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<employee> employees = entity.employees.Where(em => em.empID.ToString() == txtEmployeeInfo.Text || em.lastName == txtEmployeeInfo.Text).ToList();
                gvEmployees.DataSource = employees;
                gvEmployees.DataBind();
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                empID = Int32.Parse(Request.QueryString["ID"]);
                employee emp = entity.employees.Where(em => em.empID == empID).Single();
                emp.firstName = eFirstName.Text;
                emp.lastName = eLastName.Text;
                emp.streetAddress = eAddress.Text;
                emp.city = eCity.Text;
                emp.state = eState.Text;
                int zipFromString = 0;
                int.TryParse(eZipCode.Text, out zipFromString);

                if (zipFromString != 0)
                {
                    emp.zip = zipFromString;
                }
                emp.phone = ePhoneNumber.Text;
                emp.userName = eUsername.Text;
                emp.llv_password = ePassword.Text;
                emp.manager = eIsManager.Checked;
                entity.SaveChanges();
            }
            Response.Redirect("EditEmployee.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                empID = Int32.Parse(Request.QueryString["ID"]);
                //Determine the RowIndex of the Row whose Button was clicked.
                int vID = Int32.Parse(e.CommandArgument.ToString());

                reloadMovies();
            }
        }
    }
}