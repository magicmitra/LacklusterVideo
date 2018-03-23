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

namespace AddEmployee
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            textBox2.UseSystemPasswordChar = true;
            textBox3.UseSystemPasswordChar = true;
        }

        // load the form
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        // clicking the submit button
        private void button1_Click(object sender, EventArgs e)
        {
            // Connect to DB
            // query if username already exists
            // create SQL adapter
            // create data table, then fill it according to query requirements
            SqlConnection conn = new SqlConnection("path to DB in here");
            string query = "Select * from [USERS] Where username= '" + textBox1.Text + "'";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            DataTable dtable = new DataTable();
            adapter.Fill(dtable);

            // if username already exists
            if (dtable.Rows.Count > 0)
            {
                MessageBox.Show("Username is already taken:");
                textBox1.Text = String.Empty;
            }
            else if (textBox2.Text != textBox3.Text)
            {
                // if password and confirm password does not match
                MessageBox.Show("The passwords did not match");
                textBox2.Text = String.Empty;
                textBox3.Text = String.Empty;
            }
            else
            {
                try
                {
                    // write the query and the DB path on strings
                    string queryInsert = "INSERT INTO [USERS](username, password) VALUES (@val1, @val2)";
                    string dbPath = "path to DB in here";

                    // connect to DB
                    using (SqlConnection conn2 = new SqlConnection(dbPath))
                    {
                        // creat SQL command
                        // filter inputs tp prevent SQL injections into the string
                        // add parameters to SqlCommand
                        // open the connection
                        // then execute the query
                        using (SqlCommand command = new SqlCommand())
                        {
                            command.Connection = conn2;
                            command.CommandText = queryInsert;
                            command.Parameters.AddWithValue("@val1", textBox1.Text); // username
                            command.Parameters.AddWithValue("@val2", textBox2.Text); // password
                            conn2.Open();
                            command.ExecuteNonQuery();
                            // NOTE: passwords are stored in plaintext, which would probably be good enough
                            // for demonstration purposes, for final implementation, passwords will be salted 
                            // and hashed before placing it in the database.
                        }
                    }

                    MessageBox.Show("Successfully Registered");
                }
                catch
                {
                    MessageBox.Show("Error with Registration, Contact, Null and Void LLC");
                }
            }
        }
    }
}

