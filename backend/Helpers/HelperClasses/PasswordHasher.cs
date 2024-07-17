using System.Security.Cryptography;

namespace Helpers.HelperClasses
{
    public class PasswordHasher
    {
        public static string HashPassword(string password)
        {
            byte[] salt = GenerateSalt();
            byte[] hash = GenerateHash(password, salt);

            string saltBase64 = Convert.ToBase64String(salt);
            string hashBase64 = Convert.ToBase64String(hash);

            return $"{saltBase64}:{hashBase64}";
        }

        public static bool VerifyPassword(string password, string hashedPassword)
        {
            string[] parts = hashedPassword.Split(':');
            byte[] salt = Convert.FromBase64String(parts[0]);
            byte[] hash = Convert.FromBase64String(parts[1]);

            byte[] computedHash = GenerateHash(password, salt);

            return SlowEquals(hash, computedHash);
        }

        private static byte[] GenerateSalt()
        {
            byte[] salt = new byte[16];
#pragma warning disable SYSLIB0023 // Type or member is obsolete
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(salt);
            }
#pragma warning restore SYSLIB0023 // Type or member is obsolete
            return salt;
        }

        private static byte[] GenerateHash(string password, byte[] salt)
        {
#pragma warning disable IDE0063 // Use simple 'using' statement
            using (var hasher = new Rfc2898DeriveBytes(password, salt, 10000))
            {
                return hasher.GetBytes(32);
            }
#pragma warning restore IDE0063 // Use simple 'using' statement
        }

        private static bool SlowEquals(byte[] a, byte[] b)
        {
            uint diff = (uint)a.Length ^ (uint)b.Length;
            for (int i = 0; i < a.Length && i < b.Length; i++)
            {
                diff |= (uint)(a[i] ^ b[i]);
            }
            return diff == 0;
        }
    }
}
