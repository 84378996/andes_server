using IniParser;
using IniParser.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace Tool
{
    public class HelperDevConfig
    {
        private string _filename;

        private static HelperDevConfig uniqueInstance;
        public static HelperDevConfig Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new HelperDevConfig();
                }
                return uniqueInstance;
            }
        }
        private HelperDevConfig()
        {
            _filename = System.AppDomain.CurrentDomain.BaseDirectory + "config.ini";
        }
    }

}
