using System;
using System.Security.Cryptography;
using System.Text;

namespace VisualAccess.Utils
{
    public static class PasswordGenerator
    {
        private static readonly string LowerCase = "abcdefghijklmnopqrstuvwxyz";
        private static readonly string UpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        private static readonly string Digits = "0123456789";
        private static readonly string SpecialChars = "!@#$%^&*";
        private static readonly string AllChars = LowerCase + UpperCase + Digits + SpecialChars;
        private static readonly int length = 12;

        public static string Create()
        {
            var password = new StringBuilder();

            password.Append(GetRandomChar(LowerCase));
            password.Append(GetRandomChar(UpperCase));
            password.Append(GetRandomChar(Digits));
            password.Append(GetRandomChar(SpecialChars));

            for (int i = 4; i < length; i++)
            {
                password.Append(GetRandomChar(AllChars));
            }

            return Shuffle(password.ToString());
        }

        private static char GetRandomChar(string possibleChars)
        {
            int index = RandomNumberGenerator.GetInt32(possibleChars.Length);
            return possibleChars[index];
        }

        private static string Shuffle(string password)
        {
            var array = password.ToCharArray();
            int n = array.Length;
            for (int i = 0; i < n; i++)
            {
                int rnd = RandomNumberGenerator.GetInt32(i, n);
                (array[i], array[rnd]) = (array[rnd], array[i]);
            }
            return new string(array);
        }
    }
}

