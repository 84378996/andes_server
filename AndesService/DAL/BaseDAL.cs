using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tool;

namespace MCSService.DAL
{
    public class BaseDAL
    {
        private static string _dataconnstring;

        public static string DataConnString
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dataconnstring))
                {
                    _dataconnstring = string.Format("server={0};database=db_mcs_data;uid=sa;pwd={1};",
               HelperConfig.Instance.DB_Server, HelperConfig.Instance.DB_Pwd);
                }
                return _dataconnstring;
            }

        }

        public static string DataCommandConnString
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dataconnstring))
                {
                    _dataconnstring = System.Configuration.ConfigurationManager.ConnectionStrings["DataInterface"].ConnectionString;
                }
                return _dataconnstring;
            }

        }


        public static string _datarealconnstring;

        public static string DataRealConnString
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_datarealconnstring))
                {
                    _datarealconnstring = string.Format("server={0};database=db_mcs_devreal;uid=sa;pwd={1};",
               HelperConfig.Instance.DB_Server, HelperConfig.Instance.DB_Pwd);
                }
                return _datarealconnstring;
            }
        }


        public static string _datafileconnstring;

        public static string DataFileConnString
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_datafileconnstring))
                {
                    _datafileconnstring = System.Configuration.ConfigurationManager.ConnectionStrings["DataFileServices"].ConnectionString;
                }
                return _datafileconnstring;
            }
        }

    }
}