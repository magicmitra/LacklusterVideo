using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LoginPrototype
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponentCustom();
            textBox2.UseSystemPasswordChar = true;
        }

        // load form 
        private void Form1_Load(object sender, EventArgs e)
        {
            // hide password
            textBox2.UseSystemPasswordChar = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Establish SQL connection on login click
            // Create query
            // Create SQL Data Adapter
            // Create Data Table, then fill Data Table if query was satisfied.
            SqlConnection conn = new SqlConnection("path to the database in here");
            string query = "Select * from [users] Where username= '" + textBox1.Text + "' and password= '" + textBox2.Text + "'";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            DataTable dtable = new DataTable();
            adapter.Fill(dtable);

            // allow access if there has been 1 element in Data Table, means the query was satisfied
            if(dtable.Rows.Count == 1)
            {
                // Grant Access here
                // mainui.html 
            }
            else
            {
                // show incorrect username/password combo 
                // give 3 more tries
                textBox2.Text = String.Empty;
            }
        }
    }
}
