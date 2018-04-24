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
            string stateStr = eState.Text.ToString();
            string zipStr = eZipCode.Text.ToString();
            string phoneStr = ePhoneNumber.Text.ToString();
            
            // TODO: Form validator code
            SaltGenerator salt = new SaltGenerator();
            HasherOfPasswords hash = new HasherOfPasswords();
            FormValidatorClass fv = new FormValidatorClass();

            // validate state, zip and phone
            bool validState = fv.IsValidState(stateStr);
            if(!validState)
            {
                // invalid state
                // TODO: notify EditEmployee.aspx of invalid state
                stateStr = null;
                rfvState.ErrorMessage = "Required, enter a valid US state initial(CA, IL, GA)";
                rfvState.ForeColor = System.Drawing.Color.Red;
            }

            bool validZip = fv.IsValidZip(zipStr);
            if(!validZip)
            {
                // invalid zip
                // TODO: notify EditEmployee.aspx of invalid zip
                zipStr = null;
                rfvZip.ErrorMessage = "Required, enter a valid Zip Code";
                rfvZip.ForeColor = System.Drawing.Color.Red;
            }

            bool validPhone = fv.IsValidPhone(phoneStr);
            if(!validPhone)
            {
                // invalid phone
                // TODO: notify EditEmployee.aspx of invalid phone
                phoneStr = null;
                rfvPhone.ErrorMessage = "Required, enter a valid phone number";
                rfvPhone.ForeColor = System.Drawing.Color.Red;
            }
            

            using (LacklusterEntities entity = new LacklusterEntities())
            {
                empID = Int32.Parse(Request.QueryString["ID"]);
                employee emp = entity.employees.Where(em => em.empID == empID).Single();
                emp.firstName = eFirstName.Text;
                emp.lastName = eLastName.Text;
                emp.streetAddress = eAddress.Text;
                emp.city = eCity.Text;
                emp.state = stateStr;
                int zipFromString = 0;
                int.TryParse(zipStr, out zipFromString);
                emp.zip = zipFromString;
                /*
                if (zipFromString != 0)
                {
                    emp.zip = zipFromString;
                }
                */
                emp.phone = phoneStr;

                // generate new salt and take new password
                lookupSalt = salt.SaltMe(emp.firstName, emp.lastName);
                passwordPlusSalt = passwordString + lookupSalt;
                emp.llv_password = hash.HashPassword(passwordPlusSalt);
                emp.salt = lookupSalt;

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