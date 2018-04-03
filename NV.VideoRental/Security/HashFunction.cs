/* HashFunction: Hashes a string and outputs the hash.
 * Will be called with password and salt combination.
 * The output will be stored at the users table in the
 * field called 'llv_password'.
 * When a user logs on: 
 * 1. User's input password will have salt appended to it 
 * if user is valid.
 * 2. Password and salt combo will then be hashed by 
 * this program.
 * 3. Output will be compared to llv_password field
 * in users table. 
 * 
 * IMPORTANT: Create a HasherOfPasswords class then 
 * use the method/function HashPassword(param), the password 
 * will then be hashed
 * By: Erv
 */

// pretty sure need some using stuff in here
using System;
using System.IO;
using System.Text;
using System.Security.Cryptography;


 namespace HashFunction
{
    public class HasherOfPasswords
    {
        // default constructor will suffice for this
        public HasherOfPasswords()
        {
            // empty since default constructor used
        }

        // this method will take an input string, hash it and produce 
        // output string which is hashed
        // parameters:
        // @input -> this is the input AKA salted password or password
        // plus salt combination.
        public string HashPassword(string input)
        {
            string output = null;
            MemoryStream stream = new MemoryStream(Encoding.Unicode.GetBytes(input));

            // hash happens here
            HashAlgorithm hash = new SHA1CryptoServiceProvider();
            byte[] hashResult = hash.ComputeHash(stream);

            // turn hash bytes into readable string
            // then store in Database in password field or 
            // use to comapre for user authentication
            output = System.Text.Encoding.UTF8.GetString(hashResult);

            return output;
        }

    }
}
