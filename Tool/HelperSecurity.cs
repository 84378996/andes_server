using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperSecurity
    {

       


        public static string SHAEncrypt(string input)
        {
            string result = "";
            using (SHA256 sha256 = SHA256.Create())
            {
                int tmpStrLen = input.Length;

                byte[] tmpByte = new byte[tmpStrLen - 1];
                tmpByte = Encoding.UTF8.GetBytes(input);

                byte[] keys = sha256.ComputeHash(tmpByte);

                result = BitConverter.ToString(keys);
                result = result.Replace("-", "");
            }

            return result;
        }

        private static byte[] getPwdKey(string logname)
        {
            //注意长度必须是16位
             string encryptionKey = "hgtechfarley1234";
        
            byte[] key = Encoding.UTF8.GetBytes(encryptionKey);

            int size = 16;

            if (logname.Length <= size)
            {
                byte[] specifiedKey = Encoding.UTF8.GetBytes(logname);
                for (int i = 0; i < specifiedKey.Length; i++)
                {
                    key[i] = specifiedKey[i];
                }

            }
            else
            {
                byte[] specifiedKey = Encoding.UTF8.GetBytes(logname);
                for (int i = 0; i < key.Length; i++)
                {
                    key[i] = specifiedKey[i];
                }
            }

            return key;

        }

        private static byte[] getPwdIV(string logname)
        {
            //注意长度必须是16位
            string fixedIV = "1234567890123456";

            byte[] iv = Encoding.UTF8.GetBytes(fixedIV);
            return iv;
        }

            
        public  static string EncryptPwd(string logname, string pwd)
        {

            byte[] key = getPwdKey(logname);
            byte[] iv = getPwdIV(logname);


            return EncryptString(pwd, key,iv);

        }

        public static string DecryptPwd(string logname, string pwd)
        {

            byte[] key = getPwdKey(logname);
            byte[] iv = getPwdIV(logname);

            return DecryptString(pwd, key, iv);

        }


        public static string EncryptPurview( string purview)
        {

            byte[] key = getPwdKey("purview");
            byte[] iv = getPwdIV("purview");

            return EncryptString(purview, key, iv);

        }

        public static string DecryptPurview(string purview)
        {

            byte[] key = getPwdKey("purview");
            byte[] iv = getPwdIV("purview");

            return DecryptString(purview, key, iv);

        }


        public static string EncryptString(string plainText, byte[] key, byte[] iv)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = key;
                aesAlg.IV = iv;

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(plainText);
                        }
                    }
                    return Convert.ToBase64String(msEncrypt.ToArray());
                }
            }
        }

        public static string DecryptString(string cipherText, byte[] key, byte[] iv)
        {

            using (Aes aesAlg = Aes.Create())
            {
                try
                {
                    aesAlg.Key = key;
                    aesAlg.IV = iv;

                    ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                    using (MemoryStream msDecrypt = new MemoryStream(Convert.FromBase64String(cipherText)))
                    {
                        using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                        {
                            using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                            {
                                return srDecrypt.ReadToEnd();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
        }
    }
}
