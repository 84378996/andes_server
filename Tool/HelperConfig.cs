using IniParser;
using IniParser.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Tool
{
    public class HelperConfig
    {
        private string _filename;

        private static HelperConfig uniqueInstance;
        public static HelperConfig Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new HelperConfig();
                }
                return uniqueInstance;
            }
        }
        private HelperConfig()
        {
            _filename = System.AppDomain.CurrentDomain.BaseDirectory + "config.ini";
        }

        public string AppServer_Host { get; private set; }
        public string AppServer_Domain { get; private set; }
        public int AppServer_Port { get; private set; }
        public string AppServer_SiteDir { get; private set; }

        public string DB_Server { get; private set; }
        public string DB_Pwd { get; private set; }

        //默认文件路径，数据库中只保存相对路径
        public string File_BasePath { get; private set; }

        public void ReadConfig(string filename)
        {
            if (File.Exists(filename) == false)
            {
                File.Create(filename).Close();
                var parser1 = new FileIniDataParser();
                IniData data1 = parser1.ReadFile(filename);
                data1.Sections.AddSection("appserver");
                data1.Sections.AddSection("database");
                data1.Sections.AddSection("fileserver");
                data1["appserver"].AddKey("host", "http://localhost:44306");
                data1["appserver"].AddKey("domain", "*");
                data1["appserver"].AddKey("port", "9000");
                data1["appserver"].AddKey("sitedir", ".");
                data1["database"].AddKey("server", "127.0.0.1");
                data1["database"].AddKey("pwd", "123456");
                data1["fileserver"].AddKey("basePath", "C:\\farley\\mcs file manage");
                parser1.WriteFile(filename, data1);
            }


            var parser = new FileIniDataParser();
            IniData data = parser.ReadFile(filename);

            string str;

            AppServer_Host = data["appserver"]["host"];
            AppServer_Domain = data["appserver"]["domain"];

            str = data["appserver"]["port"];
            if (int.TryParse(str, out int ntemp))
                AppServer_Port = ntemp;
            else
                AppServer_Port = 9000;
            AppServer_SiteDir = data["appserver"]["sitedir"];

            DB_Server = data["database"]["server"];
            DB_Pwd = data["database"]["pwd"]; //后期需要加密

            File_BasePath = data["fileserver"]["basePath"];
        }
        public string GetValue(string filename, string section, string key)
        {
            try
            {
                filename = System.AppDomain.CurrentDomain.BaseDirectory + filename;
                if (File.Exists(filename) == false)
                    File.Create(filename).Close();
                var parser = new FileIniDataParser();
                IniData data = parser.ReadFile(filename);
                if (data[section][key] == null)
                {
                    data.Sections.AddSection(section);
                    data[section].AddKey(key, "0");
                    parser.WriteFile(filename, data);
                }
                    return data[section][key];
            }
            catch (Exception e)
            {
                HelperLog.Error(e.Message);
                return null;
            }
        }
        public void SetValue(string filename, string section, string key, string value)
        {
            try
            {
                filename = System.AppDomain.CurrentDomain.BaseDirectory + filename;
                if (File.Exists(filename) == false)
                    File.Create(filename).Close();
                var parser = new FileIniDataParser();
                IniData data = parser.ReadFile(filename);
                if (data[section][key] == null)
                {
                    data.Sections.AddSection(section);
                    data[section].AddKey(key, value);
                    parser.WriteFile(filename, data);
                }
                else
                {
                    data[section][key] = value;
                    parser.WriteFile(filename, data);
                }
            }
            catch (Exception e)
            {
                HelperLog.Error(e.Message);
            }

        }
    }
}
