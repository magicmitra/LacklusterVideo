/* Hash function to be used by passwords before being stored at the data base
 * Will also be invoked when comparing a password that the user has inputed to
 * match the stored password in the database.
 * More Details to follow.....
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
        protected string HashPassword(string input)
        {
            string output = null;
            MemoryStream stream = new MemoryStream(Encoding.Unicode.GetBytes(input));

            // some hashing in here
            HashAlgorithm hash = new SHA1CryptoServiceProvider();
            byte[] hashResult = hash.ComputeHash(stream);

            // should be a hash in here now (theoretically)
            output = hashResult.ToString();

            return output;
        }

    }
}
