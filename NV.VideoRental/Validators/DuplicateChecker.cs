/*
 * Duplicate Checker - This file will check duplicate instances of 
 * an entity can be used by both Employees and Customers. 
 * Duplicate definition for this program:
 * A duplicate is true if an instance's 1st name, last name,
 * street address and username are the same. (Employee Version).
 * Same for customers except no userName for them.
 * We can add more fields to participate in the criteria
 * if necessary.
 * HOW TO USE:
 * 1. Create a DuplicateCheckerClass instance
 * 2. Invoke member function/method called 'AlreadyExists' 
 *    -> AlreadyExists is OVERLOADED:
 *    -> 1st version is for employees and takes 4 arguments in order:
 *    -> (firstname, lastname, address, username)
 *    -> 2nd version is for customers and takes 3 arguments in order:
 *    -> (firstname, lastname, address)
 * 3. Call arguments accordingly: Employee vs Customer
 * 4. Returns TRUE if instance of employee or customer already exists, FALSE if not
 * 5. Use TRUE/FALSE returned value accordingly to safeguard against duplicate entries
 * 
 * Created in response to bug found by HEX:
 * 6d. Was able to add two employees, Brock Muster .............
 * 4d. Does not appear to reject customers that already exist .............
 */

using System;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DuplicateChecker
{
    public class DuplicateCheckerClass
    {
        // protected variable, value will 
        // be populated through Database
        protected string usernameDB = null;
        protected string addressDB = null;

        public DuplicateCheckerClass()
        {
            // default constructor
        }

        // method to check for duplicate Employee version, 
        // return true if instanace alreadt exists
        // false if instance doesnt exist yet
        // 4 parameters in order: 1. first name 2. last name 3. address 4. username
        public bool AlreadyExists(string first, string last, string address, string username)
        {
            SqlConnection conn;
            SqlCommand cmd;
            bool returnedValue;

            try
            {
                // Consult your SQL Server Admin for appropriate connection
                // string to use for local server
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn = new SqlConnection();

                // Create sql commands that are parameterized
                // DB transaction: select username for a person with
                // particular 1st name, last name and address
                // NOTE: might have to change 'users' to 'employees' depending on table name
                cmd = new SqlCommand("Select userName from users where firstName=@first AND lastName=@last AND streetAddress=@address", conn);
                cmd.Parameters.Add("@first", SqlDbType.VarChar, 25);
                cmd.Parameters.Add("@last", SqlDbType.VarChar, 25);
                cmd.Parameters.Add("@address", SqlDbType.VarChar, 25);
                cmd.Parameters["@first"].Value = first;
                cmd.Parameters["@last"].Value = last;
                cmd.Parameters["@address"].Value = address;
                usernameDB = (string)cmd.ExecuteScalar();

                // clean up and dispose DB connections
                conn.Dispose();
                cmd.Dispose();
            }
            catch(Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Exception: " + ex.Message);
            }

            if(0 == string.Compare(usernameDB, username, false))
            {
                // instance already exists
                returnedValue = true;
            }
            else
            {
                returnedValue = false;
            }

            return returnedValue;
        }

        // overload AlreadyExists method for customers
        // overloaded version only has 1st name, last name 
        // and address. Customers do not have usernames 
        // returns true if instance already exists
        // false if not. 
        // 3 parameters in order: 1. first name 2. last name 3. address
        public bool AlreadyExists(string first, string last, string address)
        {
            SqlConnection conn;
            SqlCommand cmd;
            bool returnedValue;

            try
            {
                // consult DB admin in here for appropriate connection string
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn = new SqlConnection();

                // same as the employee version except there is no username
                // important to parameterize these 
                cmd = new SqlCommand("Select streetAddress from customer where firstName=@first AND lastName=@last", conn);
                cmd.Parameters.Add("@first", SqlDbType.VarChar, 25);
                cmd.Parameters.Add("@last", SqlDbType.VarChar, 25);
                cmd.Parameters["@first"].Value = first;
                cmd.Parameters["last"].Value = last;
                addressDB = (string)cmd.ExecuteScalar();

                // dispose Sql connection and command
                conn.Dispose();
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Exception: " + ex.Message);
            }

            if(0 == string.Compare(addressDB, address, false))
            {
                returnedValue = true;
            }
            else
            {
                returnedValue = true;
            }


            return returnedValue;
        }
    }
}
