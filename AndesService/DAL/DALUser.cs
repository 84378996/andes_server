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
    public class DALUser : BaseDAL
    {

        public List<UserInfo> GetAll()
        {
            List<UserInfo> list = new List<UserInfo>();
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = "select [ID],[LoginName] ,[UserName],[RoleID],[Enabled] from [UserInfo]";

                list = HelperDBEntity.GetObjectList<UserInfo>(con, sql);

                con.Close();
            }

            return list;
        }

        public UserInfo Get(long? id)
        {
            if (id == null)
                return null;

            JObject param = new JObject
            {
                { "ID", id }
            };
            return Get(param);
        }

        public UserInfo Get(string loginname)
        {
            if (string.IsNullOrWhiteSpace(loginname))
                return null;

            JObject param = new JObject
            {
                { "LoginName", loginname }
            };
            return Get(param);
        }

        public UserInfo Get(JObject param)
        {

            string condition = QuerySql(param, true);

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select  top(1) * from [UserInfo] where {0} ", condition);

                UserInfo entity = HelperDBEntity.GetObject<UserInfo>(con, sql);

                if (entity.ID > 0)
                {
                    return entity;
                }
            }
            return null;
        }

        private string ModifySql(JObject param)
        {
            StringBuilder sb = new StringBuilder();

            if (param.ContainsKey("UserName"))
                sb.AppendFormat("[UserName]='{0}',", param["UserName"].ToString());

            if (param.ContainsKey("Phone"))
                sb.AppendFormat("[Phone]='{0}',", param["Phone"].ToString());

            if (param.ContainsKey("Email"))
                sb.AppendFormat("[Email]='{0}',", param["Email"].ToString());

            if (HelperJObject.IsInt(param, "RoleID"))
                sb.AppendFormat("[RoleID]={0},", long.Parse(param["RoleID"].ToString()));

            if (HelperJObject.IsInt(param, "Enabled"))
                sb.AppendFormat("[Enabled]={0},", int.Parse(param["Enabled"].ToString()));

            if (param.ContainsKey("Remark"))
                sb.AppendFormat("[Remark]='{0}',", param["Remark"].ToString());

            if (param.ContainsKey("Department"))
                sb.AppendFormat("[Department]='{0}',", param["Department"].ToString());

            if (param.ContainsKey("DevUser"))
                sb.AppendFormat("[DevUser]='{0}',", param["DevUser"].ToString());

            if (param.ContainsKey("JobNumber"))
                sb.AppendFormat("[JobNumber]='{0}',", param["JobNumber"].ToString());

            if (param.ContainsKey("Pwd"))
                sb.AppendFormat("[Pwd]='{0}',", param["Pwd"].ToString());

            if (param.ContainsKey("AvatarName"))
                sb.AppendFormat("[AvatarName]='{0}',", param["AvatarName"].ToString());

            if (string.IsNullOrWhiteSpace(sb.ToString()))
                throw new Exception("没有需要修改的数据");

            string sql = string.Format("UPDATE  [UserInfo] SET {0} WHERE ID ={1}", sb.ToString().Substring(0, sb.Length - 1), param["ID"].ToString());

            return sql;

        }

        public void Modify(JObject param)
        {
            string sql = ModifySql(param);
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
        }

        public void Modify(JArray array)
        {
            if (array == null)
                return;
            List<string> list = new List<string>();
            foreach (JObject obj in array)
            {
                list.Add(ModifySql(obj));
            }

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                SqlTransaction trans = con.BeginTransaction();

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.Transaction = trans;
                    foreach (string sql in list)
                    {
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                    trans.Commit();
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    throw ex;
                }
                finally
                {
                    trans.Dispose();

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

            if (matchExact && HelperJObject.IsString(param, "LoginName"))
            {
                condition = string.Format("[LoginName]='{0}' ", param["LoginName"].ToString());
                return condition;
            }


            StringBuilder sb = new StringBuilder();
            if (HelperJObject.IsLong(param, "RoleID"))
                sb.AppendFormat("[RoleID]={0} AND ", param["RoleID"].ToString());
            if (HelperJObject.IsString(param, "LoginName"))
            {
                if (matchExact)
                    sb.AppendFormat("[LoginName]='{0}' AND ", param["LoginName"].ToString());
                else
                    sb.AppendFormat("[LoginName] like '%{0}%' AND ", param["LoginName"].ToString());
            }

            if (HelperJObject.IsString(param, "UserName"))
            {
                if (matchExact)
                    sb.AppendFormat("[UserName]='{0}' AND ", param["UserName"].ToString());
                else
                    sb.AppendFormat("[UserName] like '%{0}%' AND ", param["UserName"].ToString());
            }

            if (HelperJObject.IsInt(param, "Enabled"))
                sb.AppendFormat("[Enabled]={0} AND ", param["Enabled"].ToString());

            condition = sb.ToString();
            if (string.IsNullOrWhiteSpace(condition))
                condition = string.Format(" [ID]>=0 AND ");

            condition = condition.Substring(0, condition.Length - 4);
            return condition;
        }

        public void Gets(JObject param, bool matchExact, out List<UserInfo> users, out int total)
        {
            total = 0;
            users = new List<UserInfo>();
            string condition = QuerySql(param, matchExact);


            string sqlcount = string.Format("SELECT COUNT(ID) FROM [UserInfo] where {0}", condition);

            string sql = string.Format("select top {1} * from(select row_number() over(order by [LoginName] asc) as rownumber, * from UserInfo where {2}) temp_row where rownumber > (({0} - 1) * {1})",
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

                users = HelperDBEntity.GetObjectList<UserInfo>(con, sql);

            }
        }

        public void Add(UserInfo data)
        {
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select Top(1) ID  from UserInfo where LoginName='{0}'", data.LoginName);
                SqlCommand cmd = new SqlCommand(sql, con);

                object ret = cmd.ExecuteScalar();
                if (ret != null)
                {
                    throw new Exception("相同的登录名已存在");
                }

                HelperDBEntity.InsertEntity(con, data);



            }


        }

        public void Delete(long? id)
        {
            if (id == null)
                return;
            if (id <= 0)
                return;
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("DELETE FROM [UserInfo] WHERE ID={0}", id);

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();

            }

        }

        public void Delete(List<long> list)
        {
            if (list == null)
                return;
            if (list.Count == 0)
                return;

            StringBuilder sb = new StringBuilder();
            foreach (long id in list)
            {
                sb.Append(id.ToString());
                sb.Append(",");
            }


            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("DELETE FROM [UserInfo] WHERE ID in ({0}0)", sb.ToString());

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();

            }
        }

        public List<UserInfo> GetAll(JObject param, bool match)
        {
            string condition = QuerySql(param, match);

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select * from [UserInfo] where {0} order by [LoginName] asc", condition);
                List<UserInfo> list = HelperDBEntity.GetObjectList<UserInfo>(con, sql);
                return list;
            }
        }

    }
}
