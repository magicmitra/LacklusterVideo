using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SaltFunction;
using HashFunction;
using FormValidator;
using DuplicateChecker;

namespace NV.VideoRental.Management
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        private int empID;
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;

            if (ticket.UserData.ToLower() == "false")
                Response.Redirect("~/Default.aspx");

            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]) && Int32.TryParse(Request.QueryString["ID"], out empID))
                {
                    try
                    {
                        using (LacklusterEntities entity = new LacklusterEntities())
                        {
                            employee emp = entity.employees.Where(c => c.empID == empID).Single();
                            lblEmployeeID.Text = emp.empID.ToString();
                            lblEmployeeName.Text = emp.firstName + " " + emp.lastName;
                            eFirstName.Text = emp.firstName;
                            eLastName.Text = emp.lastName;
                            eAddress.Text = emp.streetAddress;
                            eCity.Text = emp.city;
                            eState.Text = emp.state;

                            int zipFromString = 0;
                            int.TryParse(eZipCode.Text, out zipFromString);

                            if (zipFromString != 0)
                            {
                                emp.zip = zipFromString;
                            }
                            else
                            {
                                emp.zip = 99999;
                            }

                            ePhoneNumber.Text = emp.phone;
                            eIsManager.Checked = emp.manager.HasValue ? emp.manager.Value : false;
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                        //Response.Redirect("Rent.aspx");
                    }

                    pnlSelectEmployee.Visible = false;
                    pnlEdit.Visible = true;
                }
                else
                {
                    reloadEmployees();

                    pnlSelectEmployee.Visible = true;
                    pnlEdit.Visible = false;
                }
            }
        }

        private void reloadEmployees()
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<employee> Employees = entity.employees.Where(e => e.active == true).ToList();
                gvEmployees.DataSource = Employees;
                gvEmployees.DataBind();
            }
        }


        protected void btnGetEmployee_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                List<employee> employees = entity.employees.Where(em => (em.empID.ToString() == txtEmployeeInfo.Text || em.lastName == txtEmployeeInfo.Text) && em.active == true).ToList();
                gvEmployees.DataSource = employees;
                gvEmployees.DataBind();
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string lookupSalt = null;
            string passwordPlusSalt = null;
            string passwordString = ePassword.Text.ToString();
            
            // TODO: Form validator code
            SaltGenerator salt = new SaltGenerator();
            HasherOfPasswords hash = new HasherOfPasswords();
            FormValidatorClass fv = new FormValidatorClass();
            DuplicateCheckerClass dc = new DuplicateCheckerClass();

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
                emp.llv_password = ePassword.Text;
                emp.manager = eIsManager.Checked;
                entity.SaveChanges();
            }

            Response.Redirect("EditEmployee.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                empID = Int32.Parse(Request.QueryString["ID"]);
                employee emp = entity.employees.Where(em => em.empID == empID).Single();

                emp.active = false;

                entity.SaveChanges();
            }

            Response.Redirect("EditEmployee.aspx");
        }
    }
}