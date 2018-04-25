/* FormValidator - This class was created to serve the purpose of
 * validating forms. This will have methods to validate:
 * 1. phone number
 * 2. valid State un the US
 * 3. valid Zip Code in US
 * 
 * How to Use:
 * 1. Create FormValidatorClass() object
 * 2. Call IsValidPhone(number)
 * 3. Call IsValidState(state_initials)
 * 4. Call IsValidZip(zipcode)
 * 
 * All methods return TRUE if entries are valid
 * FALSE otherwise. 
 */

using System;
using System.Text.RegularExpressions;
using StateHashTable;

namespace FormValidator
{
    public class FormValidatorClass
    { 

        public FormValidatorClass()
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
        // Right now, this this Hash table will be built everytime 
        // a validation is about to occur. 
        public bool IsValidState(string state)
        {
            bool returnedValue = false;
            state = state.ToUpper();
            try
            {

                StateHashTableClass table = new StateHashTableClass();
                if (table.states.ContainsKey(state))
                {
                    returnedValue = true;
                    return returnedValue;
                }
            }
            catch(Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Exception: " + ex.Message);
            }

            return returnedValue;
        }

        // checks for a valid Zip Code
        public bool IsValidZip(string zip)
        {
            bool returnedValue = false;
            string USZipRegex = @"^\d{5}(?:[-\s]\d{4})?$";

            try
            {
                if(Regex.Match(zip, USZipRegex).Success)
                {
                    returnedValue = true;
                }
            }
            catch(Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Exception: " + ex.Message);
            }

            return returnedValue;
        }
    }
}