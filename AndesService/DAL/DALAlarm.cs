using Entity;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool;

namespace MCSService.DAL
{
    public class DALAlarm : BaseDAL
    {
        public string QuerySql(JObject param, bool matchExact)
        {
            string condition;

            if (HelperJObject.IsPositiveLong(param, "ID"))
            {
                condition = string.Format("[ID]={0} ", param["ID"].ToString());
                return condition;
            }

            StringBuilder sb = new StringBuilder();

  
            if (HelperJObject.IsDataTime(param, "StartTime"))
                sb.AppendFormat("[StartTime]>='{0}' AND ", DateTime.Parse(param["StartTime"].ToString()).ToString("yyyy-MM-dd 00:00:00"));

            if (HelperJObject.IsDataTime(param, "EndTime"))
                sb.AppendFormat("[StartTime]<'{0}' AND ", DateTime.Parse(param["EndTime"].ToString()).AddDays(1).ToString("yyyy-MM-dd 00:00:00"));


            condition = sb.ToString();
            if (string.IsNullOrWhiteSpace(condition))
                condition = string.Format(" [ID]>=0 AND ");
            condition = condition.Substring(0, condition.Length - 4);
            return condition;
        }

        public void Gets(JObject param, bool matchExact, out List<AlarmData> list, out int total)
        {
            total = 0;
            list = new List<AlarmData>();
            string condition = QuerySql(param, matchExact);

            string sqlcount = string.Format("SELECT COUNT(ID) FROM [AlarmData] where {0}", condition);

            string sql = string.Format("select top {1} * from(select row_number() over(order by ID desc) as rownumber, * from [AlarmData] where {2}) temp_row where rownumber > (({0} - 1) * {1})",
                param["PageIndex"], param["PageSize"], condition);

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlcount, con);
                object ret = cmd.ExecuteScalar();
                if (ret != null)
                    total = int.Parse(ret.ToString());

                if (total == 0)
                {
                    return;
                }
                list = HelperDBEntity.GetObjectList<AlarmData>(con, sql);
            }
        }

    }
}
