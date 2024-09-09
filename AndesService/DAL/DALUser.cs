using Entity;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool;
using DB;

namespace MCSService.DAL
{
    public class DALUser : BaseDAL
    {

        public List<UserInfo> GetAll()
        {
            List<UserInfo> list = new List<UserInfo>();
            list.AddRange(EntityHelp.GetObjectList<UserInfo>());
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
            var u = EntityHelp.GetObject<UserInfo>($"select * from \"public\".\"User\" where  1=1  {condition} limit 1");
            if (u.ID > 0) return u;
            return null;
        }

        private string ModifySql(JObject param)
        {
            StringBuilder sb = new StringBuilder();

            if (param.ContainsKey("UserName"))
                sb.AppendFormat("\"Name\"='{0}',", param["UserName"].ToString());

            if (param.ContainsKey("Phone"))
                sb.AppendFormat("\"Phone\"='{0}',", param["Phone"].ToString());

            if (param.ContainsKey("Email"))
                sb.AppendFormat("\"Email\"='{0}',", param["Email"].ToString());

            if (HelperJObject.IsInt(param, "RoleID"))
                sb.AppendFormat("\"RoleID\"={0},", long.Parse(param["RoleID"].ToString()));

            if (HelperJObject.IsInt(param, "Enabled"))
                sb.AppendFormat("\"Enabled\"={0},", int.Parse(param["Enabled"].ToString()));


            if (param.ContainsKey("Pwd"))
                sb.AppendFormat("\"Password\"='{0}',", param["Pwd"].ToString());

            if (string.IsNullOrWhiteSpace(sb.ToString()))
                throw new Exception("没有需要修改的数据");

            string sql = string.Format("UPDATE  \"public\".\"User\"  SET {0} WHERE \"ID\" ={1}", sb.ToString().Substring(0, sb.Length - 1), param["ID"].ToString());

            return sql;

        }

        public void Modify(JObject param)
        {
            if (DbHelper.ExecuteNonQuery(ModifySql(param)) != 1) throw new Exception("修改失败");
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


            using (var db = DbHelper.Connection)
            {
                db.Open();
                foreach (string sql in list)
                {
                    DbHelper.ExecuteNonQuery(db, sql, null);
                }
            }
        }

        public string QuerySql(JObject param, bool matchExact)
        {
            string condition;
            if (HelperJObject.IsPositiveLong(param, "ID"))
            {
                condition = string.Format(" AND \"ID\"={0} ", param["ID"].ToString());
                return condition;
            }

            if (matchExact && HelperJObject.IsString(param, "LoginName"))
            {
                condition = string.Format(" AND \"LoginName\"='{0}' ", param["LoginName"].ToString());
                return condition;
            }


            StringBuilder sb = new StringBuilder();
            if (HelperJObject.IsLong(param, "RoleID"))
                sb.AppendFormat(" AND \"RoleID\"={0} AND ", param["RoleID"].ToString());
            if (HelperJObject.IsString(param, "LoginName"))
            {
                sb.AppendFormat(" AND \"LoginName\"='{0}' AND ", param["LoginName"].ToString());
            }

            if (HelperJObject.IsString(param, "UserName"))
            {
                sb.AppendFormat(" AND \"Name\" like '%{0}%' AND ", param["UserName"].ToString());
            }

            return sb.ToString();
        }

        public void Gets(JObject param, bool matchExact, out List<UserInfo> users, out int total)
        {
            total = 0;
            users = new List<UserInfo>();
            string condition = QuerySql(param, matchExact);

            string sqlcount = string.Format("SELECT COUNT(\"ID\") FROM \"public\".\"User\" WHERE 1=1 {0}", condition);

            string sql = $"SELECT * FROM \"public\".\"User\" WHERE 1=1  {condition} ORDER BY \"CreateTime\" DESC LIMIT {param["PageSize"]} OFFSET {(int.Parse(param["PageIndex"].ToString()) -1) * int.Parse(param["PageSize"].ToString())}";

            total = (int)(long)DbHelper.ExecuteScalar(sqlcount);
            users = EntityHelp.GetObjectList<UserInfo>(sql);
        }

        public void Add(UserInfo data)
        {
            int count = (int)(long)DbHelper.ExecuteScalar($"SELECT COUNT(*) FROM \"public\".\"User\" WHERE \"LoginName\"='{data.LoginName}'");
            if (count > 0)
            {
                throw new Exception("相同的用户已存在");
            }

            count= EntityHelp.InsertEntity(data);
            if (count <= 0)
            {
                throw new Exception("添加用户失败");
            }
        }

        public void Delete(long? id)
        {
            if (id == null)
                return;
            if (id <= 0)
                return;

            if (id == 999)
            {
                throw new Exception("测试用户不可删除");
            }

            UserInfo u = new UserInfo { ID = (int)id.GetValueOrDefault() };
            if (EntityHelp.DeleteEntity(u) != 1) throw new Exception("删除用户异常");
        }

        public void Delete(List<long> list)
        {
            using (var db = DbHelper.Connection)
            {
                foreach(var id in list)
                {
                    if (id == 999) continue;
                    UserInfo u = new UserInfo { ID = (int)id };
                    EntityHelp.DeleteEntity(u);
                }
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
