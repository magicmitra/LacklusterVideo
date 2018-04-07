using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                employee em = new employee();
                em.firstName = eFirstName.Text.ToString();
                em.lastName = eLastName.Text.ToString();
                em.streetAddress = eAddress.Text.ToString();
                em.city = eCity.Text.ToString();
                em.state = eState.Text.ToString();
                em.phone = ePhoneNumber.Text.ToString();
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