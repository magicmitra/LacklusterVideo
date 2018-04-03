/* SaltFunction - Creates a salt based on the person's 1st and last name.
 * Salt will be a string which is 4 chars long. Individuals with short names
 * will be given a generic salt. This function will be called the first 
 * time a person is registered as an employee.
 * Sequence of events: 
 * 1. Person's 1st and last name will be passed on to this function
 * 2. Salt is generated
 * 3. Salt is returned , preferably stored to the Users table under the
 * field name 'salt' store in plaintext
 * 4. Salt will be appended to the entered password, resulting string will be
 * called 'SaltedPassword'.
 * 5. SaltedPassword will be hashed by hashing function (FILE is called 'HashFunction').
 * 6. The hashed value is hashed based on the password and salt
 * 7. This hashed password+salt is now stored at the field called 
 * 'llv_password' at the users table.
 * . Done
 * 
 * Once a person logs in:
 * 1. Salt from the 'salt' field in the users table will be retrieved by a 
 * query to the database.
 * 2. Salt will be appended to the entered password, resulting string will be 
 * hashed and compared wil the llv_password field at the users table. 
 * 
 * IMPORTANT: Create an object from the class called SaltFunction.
 * Then call the function called SaltMe(param1, param2).
 * 
 * By: Erv
 */

using System;
using System.IO;
using System.Text;

namespace SaltFunction
{
    public class SaltGenerator
    {
        public SaltGenerator()
        {
            // default constructor will be used
        }

        // call this class method/function after creating SaltGenerator
        // parameters:
        // @first -> first name of person
        // @last -> last name of person
        // returns generated salt
        // algorithm for salting is b2, a3, b1, a2
        // if you prefer            b1, a2, b0, a1
        public string SaltMe(string first, string last)
        {
            char[] saltChar = new char[4];

            if((first.Length < 3) || (last.Length < 2))
            {
                // flood with ZYXW for salt for short names
                saltChar[0] = 'Z';
                saltChar[1] = 'Y';
                saltChar[2] = 'X';
                saltChar[3] = 'W';
            }
            else
            {
                // proceed with normal salt generation
                saltChar[0] = last[1];
                saltChar[1] = first[2];
                saltChar[2] = last[0];
                saltChar[3] = first[1];
            }

            string output = new string(saltChar);

            return output;
        }
    }
}
