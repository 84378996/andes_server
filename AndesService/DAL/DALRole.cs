using Entity;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using Tool;
using MCSService.Global;

namespace MCSService.DAL
{
    internal class DALRole : BaseDAL
    {

        public List<RoleInfo> GetAll()
        {
            List<RoleInfo> list;
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();
                string sql = "select * from RoleInfo";
                list = HelperDBEntity.GetObjectList<RoleInfo>(con, sql);
            }

            return list;

        }

        public void Add(RoleInfo data)
        {
            string sql;
            using (SqlConnection con = new SqlConnection(DataConnString))
            {

                con.Open();
                sql = string.Format("select Top(1) ID  from RoleInfo where RoleName='{0}' ", data.RoleName);
                SqlCommand cmd = new SqlCommand(sql, con);

                object ret = cmd.ExecuteScalar();
                if (ret != null)
                {
                    throw new Exception("相同的角色名已存在");
                }

                HelperDBEntity.InsertEntity(con, data);

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
            if (param.ContainsKey("RoleName"))
            {
                if (matchExact)
                    sb.AppendFormat("[RoleName]='{0}' AND ", param["RoleName"].ToString());
                else
                    sb.AppendFormat("[RoleName] like '%{0}%' AND ", param["RoleName"].ToString());
            }

            if (HelperJObject.IsInt(param, "Enabled"))
                sb.AppendFormat("[Enabled]={0} AND ", param["Enabled"].ToString());

            condition = sb.ToString(); 
            if (string.IsNullOrWhiteSpace(condition))
                condition = string.Format(" [ID]>=0 AND ");

            condition = condition.Substring(0, condition.Length - 4);
            return condition;
        }

        private string ModifySql(JObject param)
        {

            StringBuilder sb = new StringBuilder();
            if (param.ContainsKey("RoleName"))
                sb.AppendFormat("[RoleName] ='{0}',", param["RoleName"].ToString());

            if (HelperJObject.IsInt(param, "Enabled"))
                sb.AppendFormat("[Enabled] ={0},", param["Enabled"].ToString());

            if (param.ContainsKey("Remark"))
                sb.AppendFormat("[Remark] ='{0}',", param["Remark"].ToString());

            if (param.ContainsKey("Purview"))
                sb.AppendFormat("[Purview] ='{0}',", param["Purview"].ToString());


            if (string.IsNullOrWhiteSpace(sb.ToString()))
                throw new Exception("没有需要修改的数据");

            string sql = string.Format("UPDATE  [RoleInfo] SET {0} WHERE ID ={1}", sb.ToString().Substring(0, sb.Length - 1), param["ID"].ToString());

            return sql;
        }

        public void Modify(JObject param)
        {
            if (param == null)
                return;
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


        public void Delete(long id)
        {

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = "DELETE FROM [RoleInfo] where ID=" + id.ToString();
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
            for(int i=0;i<list.Count;++i)
            {
                sb.Append(list[i].ToString());
                if(i<list.Count-1)
                    sb.Append(",");
            }


            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("DELETE FROM [RoleInfo] WHERE ID in ({0})", sb.ToString());

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
            }
        }

        public RoleInfo Get(JObject param)
        {
            string condition = QuerySql(param, true);
            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select top(1) * from [RoleInfo] where {0} ", condition);

                RoleInfo entity = HelperDBEntity.GetObject<RoleInfo>(con, sql);

                if (entity.ID > 0)
                {
                    return entity;
                }
                con.Close();
            }
            return null;
        }


        public void Gets(JObject param, bool matchExact, out List<RoleInfo> roles, out int total)
        {

            total = 0;
            roles = new List<RoleInfo>();
            string condition = QuerySql(param, matchExact);
            string sqlcount = string.Format("SELECT COUNT(ID) FROM [RoleInfo] where {0}", condition);

            string sql = string.Format("select top {1} * from(select row_number() over(order by ID asc) as rownumber, * from RoleInfo where {2}) temp_row where rownumber > (({0} - 1) * {1})",
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

                roles = HelperDBEntity.GetObjectList<RoleInfo>(con, sql);

            }
        }


        public List<RoleInfo> GetAll(JObject param, bool match)
        {
            string condition = QuerySql(param, match);

            using (SqlConnection con = new SqlConnection(DataConnString))
            {
                con.Open();

                string sql = string.Format("select * from [RoleInfo] where {0} order by ID desc", condition);
                List<RoleInfo> list = HelperDBEntity.GetObjectList<RoleInfo>(con, sql);
                return list;
            }
        }


    }
}
