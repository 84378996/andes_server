using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Tool;

namespace MCSService.DAL
{
    public class DALLog : BaseDAL
    {

        public void Add(Log log)
        {
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();
                HelperDBEntity.InsertEntity(con, log);
                con.Close();
            }
        }

        public void Add(List<Log> list)
        {
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                //自动生成工单
                SqlCommand sql = new SqlCommand("select Top(1) * from [Log]", con);
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(sql);
                adapter.Fill(dt);
                dt.Rows.Clear();

                DataRow dr;
                foreach (Log data in list)
                {
                    dr = dt.NewRow();
                    dr["Type"] = data.Type;
                    dr["Module"] = data.Module;
                    dr["Identifier"] = data.Identifier;
                    dr["Title"] = data.Title;
                    dr["OperID"] = data.OperID;
                    dr["AddTime"] = DateTime.Now;
                    dr["Remark"] = data.Remark;
                    dr["Param1"] = data.Param1;
                    dr["Param2"] = data.Param2;


                    dt.Rows.Add(dr);
                }

                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(con))
                {
                    bulkCopy.DestinationTableName = "[dbo].[Log]";
                    bulkCopy.WriteToServer(dt);
                }
            }
        }

        public string QuerySql(JObject param, bool matchExact)
        {
            string condition;

            if (HelperJObject.IsPositiveLong(param, "ID"))
            {
                condition = string.Format("[ID]={0} ", param["ID"].ToString());
                return condition;
            }

            StringBuilder sb = new StringBuilder();

 
            if (HelperJObject.IsString(param, "Title"))
            {
                if (matchExact)
                    sb.AppendFormat("[Title]='{0}' AND ", param["Title"].ToString());
                else
                    sb.AppendFormat("[Title] like '%{0}%' AND ", param["Title"].ToString());
            }

            if (HelperJObject.IsDataTime(param, "StartTime"))
                sb.AppendFormat("[AddTime]>='{0}' AND ", DateTime.Parse(param["StartTime"].ToString()).ToString("yyyy-MM-dd 00:00:00"));

            if (HelperJObject.IsDataTime(param, "EndTime"))
                sb.AppendFormat("[AddTime]<'{0}' AND ", DateTime.Parse(param["EndTime"].ToString()).AddDays(1).ToString("yyyy-MM-dd 00:00:00"));

            if (HelperJObject.IsInt(param, "Type"))
                sb.AppendFormat("[Type]={0} AND ", param["Type"].ToString());

            if (HelperJObject.IsInt(param, "Module"))
                sb.AppendFormat("[Module]={0} AND ", param["Module"].ToString());

            if (HelperJObject.IsString(param, "Identifier"))
                sb.AppendFormat("[Identifier]='{0}' AND ", param["Identifier"].ToString());

             condition = sb.ToString();
            if (string.IsNullOrWhiteSpace(condition))
                condition = string.Format(" [ID]>=0 AND ");
            condition = condition.Substring(0, condition.Length - 4);
            return condition;
        }

        public void Gets(JObject param, bool matchExact, out List<Log> list, out int total)
        {
            total = 0;
            list = new List<Log>();
            string condition = QuerySql(param, matchExact);

            string sqlcount = string.Format("SELECT COUNT(ID) FROM [Log] where {0}", condition);

            string sql = string.Format("select top {1} * from(select row_number() over(order by ID desc) as rownumber, * from [Log] where {2}) temp_row where rownumber > (({0} - 1) * {1})",
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
                list = HelperDBEntity.GetObjectList<Log>(con, sql);
            }
        }

        public List<Log> GetAll(JObject param, bool match)
        {
            string condition = QuerySql(param, match);

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select * from [Log] where {0} order by ID desc", condition);
                List<Log> list = HelperDBEntity.GetObjectList<Log>(con, sql);
                return list;
            }
        }

        public Log Get(long? id)
        {
            if (id == null)
                return null;
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select * from [Log] where ID={0}", id);
                Log item = HelperDBEntity.GetObject<Log>(con, sql);

                if (item.ID > 0)
                    return item;

                throw new Exception("找不到指定客户信息");

            }
        }








    }
}
