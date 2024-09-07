using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperString
    {
        /// <summary>
        /// 检测用户密码（用户密码只能是大于5位的字母、数字或下划线组合！）
        /// </summary>
        /// <param name="pwd"></param>
        /// <returns>通过验证返回true，否则返回false,input为空或null时返回false</returns>
        public static bool VerifyLoginPwd(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
            {
                return false;
            }

            if (input.Length < 6 || input.Length > 18)
            {
                return false;
            }
            //33-126的字符
            foreach (char ch in input)
            {
                if (ch < 33 || ch > 126)
                {
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// 检测用户登录名
        /// </summary>
        /// <param name="username"></param>
        /// <returns>通过验证返回true，否则返回false,input为空或null时返回false</returns>
        public static bool VerifyLoginName(string input)
        {

            if (string.IsNullOrWhiteSpace(input))
            {
                return false;
            }

            return Regex.IsMatch(input, @"^[a-zA-Z][_a-zA-Z0-9]{3,15}$");
        }



        static public string GetRandomString(int len)
        {
            string s = "123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ";
            string reValue = string.Empty;
            Random ran = new Random();

            while (reValue.Length < len)
            {
                string s1 = s[ran.Next(0, s.Length - 1)].ToString();
                reValue += s1;
            }
            return reValue;
        }

    }
}
