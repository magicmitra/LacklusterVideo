using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SaltFunction;


namespace NV.VideoRental.Management
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void eAddEmployee_Click(object sender, EventArgs e)
        {
            using (LacklusterEntities entity = new LacklusterEntities())
            {
                SaltGenerator salt = new SaltGenerator();
                employee em = new employee();
                em.firstName = eFirstName.Text.ToString();
                em.lastName = eLastName.Text.ToString();
                em.streetAddress = eAddress.Text.ToString();
                em.city = eCity.Text.ToString();
                em.state = eState.Text.ToString();
                em.phone = ePhoneNumber.Text.ToString();
                em.userName = eUsername.Text.ToString();
                em.llv_password = ePassword.Text.ToString();
                em.salt = salt.SaltMe(em.firstName, em.lastName);
                em.manager = eIsManager.Checked;
                em.active = true;

                int zipFromString = 0;
                int.TryParse(eZipCode.Text, out zipFromString);

                if (zipFromString != 0)
                {
                    em.zip = zipFromString;
                }
                else
                {
                    em.zip = 99999;
                }

                entity.employees.Add(em);
                entity.SaveChanges();
            }
        }
    }
}