/* FormValidator - This class was created to serve the purpose of
 * validating forms. This will have methods to validate:
 * 1. phone number
 * 2. valid State un the US
 * 
 * There will be more
 * 
 */

using System;
using System.Text.RegularExpressions;

namespace FormValidator
{
    public class FormValidator
    {
        public FormValidator()
        {
            // default constructor
        }

        // This method checks for a valid phone number
        // Returns true if the entered phone number is valid
        // false if not
        // parameter: number is the phone number to be checked
        public bool IsValidPhone(string number)
        {
            bool returnedValue = false;
            try
            {
                // if phone number field is empty
                if(string.IsNullOrEmpty(number))
                {
                    returnedValue = false;
                }
                // might have to change Regex Value. 
                var regex = new Regex(@"\(?\d{3}\)?-? *\d{3}-? *-?\d{4}");
                returnedValue = regex.IsMatch(number);
                
            }
            catch(Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Exception: " + ex.Message);
            }

            return returnedValue;
        }

        // checks if state is valid 
        public bool IsValidState(string state)
        {
            bool returnedValue = false;

            // code in here TODO 

            return returnedValue;
        }
    }
}