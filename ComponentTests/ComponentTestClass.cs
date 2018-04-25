﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HashFunction;
using SaltFunction;
using FormValidator;

namespace ComponentTests
{
    class ComponentTestClass
    {
        static void Main(string[] args)
        {
            HasherOfPasswords testHash = new HasherOfPasswords();
            SaltGenerator testSalt = new SaltGenerator();
            FormValidatorClass testFV = new FormValidatorClass();

            // 1. Test Hash Function, same passwords
            // Expected Result: Hashes Match
            string passwordEx1 = "TerrorBladeTheDemonMarauder";
            string passwordEx2 = "TerrorBladeTheDemonMarauder";
            string fromHasher1;
            string fromHasher2;
            fromHasher1 = testHash.HashPassword(passwordEx1);
            fromHasher2 = testHash.HashPassword(passwordEx2);
            Console.WriteLine("Test 1");
            if (0 == string.Compare(fromHasher1, fromHasher2, false))
            {
                Console.WriteLine("Hashes Match");
            }
            else
            {
                Console.WriteLine("Hashes Do Not Match");
            }
            Console.WriteLine(" ");

            // 2. Different Passwords, uncapitalize a single letter
            // Expected result: Hashes Do Not Match
            string passwordEx3 = "terrorBladeTheDemonMarauder";
            string fromHasher3 = testHash.HashPassword(passwordEx3);
            Console.WriteLine("Test 2");
            if (0 == string.Compare(fromHasher1, fromHasher3, false))
            {
                Console.WriteLine("Hashes Match");
            }
            else
            {
                Console.WriteLine("Hashes Do Not Match");
            }
            Console.WriteLine(" ");

            // Salt test
            // 3. Same person generates same salts
            // Expected result: Salts Match
            string firstName1 = "Tom";
            string lastName1 = "Riddle";
            string firstName2 = "Tom";
            string lastName2 = "Riddle";
            string fromSalt1 = testSalt.SaltMe(firstName1, lastName1);
            string fromSalt2 = testSalt.SaltMe(firstName2, lastName2);
            Console.WriteLine("Test 3");
            if (0 == string.Compare(fromSalt1, fromSalt2, false))
            {
                Console.WriteLine("Salts Match");
            }
            else
            {
                Console.WriteLine("Salts Do Not Match");
            }
            Console.WriteLine(" ");

            // 4. Different people generates different salts
            // Expected result: Salt Do Not Match
            string firstName3 = "Albus";
            string lastName3 = "Dumbledore";
            string fromSalt3 = testSalt.SaltMe(firstName3, lastName3);
            Console.WriteLine("Test 4");
            if (0 == string.Compare(fromSalt1, fromSalt3, false))
            {
                Console.WriteLine("Salts Match");
            }
            else
            {
                Console.WriteLine("Salts Do Not Match");
            }
            Console.WriteLine(" ");

            // Test the form validators

            // Zip Code Test
            // 5. Valid Zip Code
            // Expected result: Valid Zip Code
            bool validZip = testFV.IsValidZip("91325");
            Console.WriteLine("Test 5");
            if (!validZip)
            {
                Console.WriteLine("Invalid Zip");
            }
            else
            {
                Console.WriteLine("Valid Zip");
            }
            Console.WriteLine(" ");

            // 6. Invalid Zip
            // Expected result: Invalid Zip
            validZip = testFV.IsValidZip("12");
            Console.WriteLine("Test 6");
            if (!validZip)
            {
                Console.WriteLine("Invalid Zip");
            }
            else
            {
                Console.WriteLine("Valid Zip");
            }
            Console.WriteLine(" ");

            // 7. Zip Code is a name
            // Expected result: Invalid zip
            validZip = testFV.IsValidZip("Queen Of Pain");
            Console.WriteLine("Test 7");
            if(!validZip)
            {
                Console.WriteLine("Invalid Zip");
            }
            else
            {
                Console.WriteLine("Valid Zip");
            }
            Console.WriteLine(" ");
        }
    }
}