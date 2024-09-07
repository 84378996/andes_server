using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperDBEntity
    {
        static Dictionary<string, string> typeMapsEx = null;

        static HelperDBEntity()
        {
            typeMapsEx = new Dictionary<string, string>();
            typeMapsEx.Add("System.Int64", "BigInt");
            typeMapsEx.Add("System.Byte[]", "Binary");
            typeMapsEx.Add("System.Boolean", "Bit");
            typeMapsEx.Add("System.DateTime", "DateTime");
            typeMapsEx.Add("System.Decimal", "Decimal");
            typeMapsEx.Add("System.Double", "Float");
            typeMapsEx.Add("System.Int32", "Int");
            typeMapsEx.Add("System.String", "NVarChar");
            typeMapsEx.Add("System.Single", "Real");
            typeMapsEx.Add("System.Guid", "UniqueIdentifier");
            typeMapsEx.Add("System.Int16", "SmallInt");
            typeMapsEx.Add("System.Byte", "TinyInt");
            typeMapsEx.Add("System.Object", "Variant");
        }

        /// <summary>
        /// 执行一个查询语句
        /// </summary>
        /// <remarks>如果查询的结果集中有多条记录，只实例化最后一条记录</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="strSQL">查询语句</param>
        /// <returns>返回一个实体对象</returns>
        public static T GetObject<T>(DbConnection conn, string strSQL) where T : class, new()
        {

            return GetObject<T>(HelperDb.ExecuteReader(conn, strSQL, null));
        }

        /// <summary>
        /// 执行一个带事务的查询语句
        /// </summary>
        /// <remarks>如果查询的结果集中有多条记录，只实例化最后一条记录</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="tans">事务对象</param>
        /// <param name="strSQL">查询语句</param>
        /// <returns>返回一个实体对象</returns>
        public static T GetObject<T>(DbTransaction tans, string strSQL) where T : class, new()
        {
            return GetObject<T>(HelperDb.ExecuteReader(tans, strSQL, null));
        }

        /// <summary>
        /// 执行一个查询语句
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="strSQL">查询语句</param>
        /// <returns>返回一个实体集</returns>
        public static List<T> GetObjectList<T>(DbConnection conn, string strSQL) where T : class, new()
        {
            return GetObjectList<T>(HelperDb.ExecuteReader(conn, strSQL, null));
        }

        /// <summary>
        /// 执行一个带事务的查询语句
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="strSQL">查询语句</param>
        /// <param name="trans">事务对象</param>
        /// <returns>返回一个实体集</returns>
        public static List<T> GetObjectList<T>(DbTransaction trans, string strSQL) where T : class, new()
        {
            return GetObjectList<T>(HelperDb.ExecuteReader(trans, strSQL, null));
        }

        /// <summary>
        /// 从数据读取器中获取实体对象
        /// </summary>
        /// <remarks>如果数据读取器中有多条记录，只实例化最后一条记录</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="dr">查询语句</param>
        /// <returns>返回一个实体对象</returns>
        public static T GetObject<T>(System.Data.IDataReader dr) where T : class, new()
        {
            T t = new T();
            Type type = typeof(T);
            string[] Feilds = new string[dr.FieldCount];
            for (int i = 0; i < Feilds.Length; i++)
            {
                Feilds[i] = dr.GetName(i);
            }
            while (dr.Read())
            {
                System.Reflection.PropertyInfo[] pi = type.GetProperties();
                foreach (var item in pi)
                {
                    foreach (var f in Feilds)
                    {
                        if (f.ToLower() == item.Name.ToLower())
                        {
                            if (dr[f] != DBNull.Value)
                                item.SetValue(t, dr[item.Name], null);
                            break;
                        }
                    }
                }
            }
            dr.Close();
            return t;
        }

        /// <summary>
        /// 从数据读取器中获取实体对象
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="dr">数据读取器</param>
        /// <returns>返回一个实体集</returns>
        public static List<T> GetObjectList<T>(System.Data.IDataReader dr) where T : class, new()
        {
            List<T> objList = new List<T>();
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pi = type.GetProperties();

            string[] Feilds = new string[dr.FieldCount];
            for (int i = 0; i < Feilds.Length; i++)
            {
                Feilds[i] = dr.GetName(i);
            }

            try
            {
                while (dr.Read())
                {
                    T t = new T();
                    foreach (var item in pi)
                    {
                        if (Feilds.Contains(item.Name) && dr[item.Name] != DBNull.Value)
                        {
                            item.SetValue(t, dr[item.Name], null);
                        }
                    }
                    objList.Add(t);
                }
                dr.Close();
            }
            catch
            {
                dr.Close();
                throw;
            }
            return objList;
        }

        /// <summary>
        /// 从DataTable中读取对象
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="dt">数据读取器</param>
        /// <returns>返回一个实体集</returns>
        public static List<T> GetObjectList<T>(System.Data.DataTable dt) where T : class, new()
        {
            List<T> objList = new List<T>();
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pi = type.GetProperties();
            foreach (System.Data.DataRow dr in dt.Rows)
            {
                T t = new T();
                foreach (var item in pi)
                {
                    if (dt.Columns.Contains(item.Name) && dr[item.Name] != DBNull.Value)
                        item.SetValue(t, dr[item.Name], null);
                }
                objList.Add(t);
            }
            return objList;
        }

        /// <summary>
        /// 从DataTable中读取对象
        /// </summary>
        /// <remarks>如果DataTable中有多体记录，只实例化最后一条记录</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="dt">数据读取器</param>
        /// <returns>返回一个实体对象</returns>
        public static T GetObject<T>(System.Data.DataTable dt) where T : class, new()
        {
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pi = type.GetProperties();
            System.Data.DataRow dr = dt.Rows[0];

            T t = new T();
            foreach (var item in pi)
            {
                if (dt.Columns.Contains(item.Name) && dr[item.Name] != DBNull.Value)
                    item.SetValue(t, dr[item.Name], null);
            }

            return t;
        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int InsertEntity<T>(DbConnection conn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO [{0}] (", type.Name);
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                if (item.Name == "ID") continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("[{0}],", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    SqlParameter pa = new SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(");");
            return HelperDb.ExecuteNonQuery(conn, sbSQL.ToString(), paramsList);
        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int InsertEntityWithID<T>(DbConnection conn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO [{0}] (", type.Name);
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                //if (item.Name == "ID") continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("[{0}],", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    System.Data.SqlClient.SqlParameter pa = new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(");");
            return HelperDb.ExecuteNonQuery(conn, sbSQL.ToString(), paramsList);
        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int InsertEntity<T>(DbTransaction tonn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO [{0}] (", type.Name);
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (item.Name == "ID") continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("[{0}],", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    SqlParameter pa = new SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(");");


            return HelperDb.ExecuteNonQuery(tonn, sbSQL.ToString(), paramsList);

        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回插入行的ID</returns>
        public static long InsertEntityGetID<T>(DbConnection conn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO [{0}] (", type.Name);
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (item.Name == "ID") continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("[{0}],", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    System.Data.SqlClient.SqlParameter pa = new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append("); SELECT @@IDENTITY");

            return long.Parse(HelperDb.ExecuteScalar(conn, sbSQL.ToString(), paramsList).ToString());
        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回插入行的ID</returns>
        public static int InsertEntityGetID<T>(DbTransaction tonn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO [{0}] (", type.Name);
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (item.Name == "ID") continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("[{0}],", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    System.Data.SqlClient.SqlParameter pa = new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append("); SELECT @@IDENTITY");

            return int.Parse(HelperDb.ExecuteScalar(tonn, sbSQL.ToString(), paramsList).ToString());
        }

        /// <summary>
        /// 从实体更新数据表中对应的记录
        /// </summary>
        /// <remarks>该表必须以ID为主键，只更新实体中有值的字段</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int UpdateEntity<T>(DbConnection conn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }

            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            sbSQL.AppendFormat("UPDATE [{0}] SET ", type.Name);
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    if (item.Name != "ID")
                    {
                        sbSQL.AppendFormat("[{0}]=@pa_{1},", item.Name, item.Name.ToLower());
                    }
                    System.Data.SqlClient.SqlParameter pa = new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }
            sbSQL.Remove(sbSQL.Length - 1, 1).Append(" WHERE ID= @pa_id ");
            return HelperDb.ExecuteNonQuery(conn, sbSQL.ToString(), paramsList);
        }

        /// <summary>
        /// 从实体更新数据表中对应的记录
        /// </summary>
        /// <remarks>该表必须以ID为主键，只更新实体中有值的字段</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事物对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int UpdateEntity<T>(DbTransaction tonn, T t) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }

            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            List<System.Data.Common.DbParameter> paramsList = new List<System.Data.Common.DbParameter>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            sbSQL.AppendFormat("UPDATE [{0}] SET ", type.Name);
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    if (item.Name != "ID")
                    {
                        sbSQL.AppendFormat("[{0}]=@pa_{1},", item.Name, item.Name.ToLower());
                    }
                    System.Data.SqlClient.SqlParameter pa = new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), GetSqlDbType(item.PropertyType));
                    pa.Value = val;
                    paramsList.Add(pa);
                }
            }
            sbSQL.Remove(sbSQL.Length - 1, 1).Append(" WHERE ID= @pa_id ");

            return HelperDb.ExecuteNonQuery(tonn, sbSQL.ToString(), paramsList);
        }

        /// <summary>
        /// 从实体删除数据表中的对应记录
        /// </summary>
        /// <remarks>该表必须以ID为主键,并且须对实体的ID字段赋值</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int DeleteEntity<T>(DbConnection conn, T t) where T : class, new()
        {
            string sID = typeof(T).GetProperty("ID").GetValue(t, null).ToString();
            return HelperDb.ExecuteNonQuery(conn, string.Format("DELETE FROM [{0}] WHERE ID={1}", typeof(T).Name, sID), null);
        }

        /// <summary>
        /// 从实体删除数据表中的对应记录
        /// </summary>
        /// <remarks>该表必须以ID为主键,并且须对实体的ID字段赋值</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int DeleteEntity<T>(DbTransaction tonn, T t) where T : class, new()
        {
            long nID = (long)typeof(T).GetProperty("ID").GetValue(t, null);

            return HelperDb.ExecuteNonQuery(tonn, string.Format("DELETE FROM [{0}] WHERE ID={1}", typeof(T).Name, nID), null);
        }

        public static System.Data.SqlDbType GetSqlDbType(Type t)
        {
            if (t.IsGenericType)
            {
                if (t.GetGenericTypeDefinition() == typeof(Nullable<>))
                {
                    t = t.GetGenericArguments()[0];
                }
            }

            string val;
            if (typeMapsEx.TryGetValue(t.ToString(), out val))
            {
                return (System.Data.SqlDbType)Enum.Parse(typeof(System.Data.SqlDbType), val);
            }
            throw new Exception("unknow basic type");
        }
    }

    /// <summary>
    /// 数据库的操作类
    /// </summary>
    public abstract class HelperDb
    {
        static HelperDb()
        {
            //从配置文件读取数据库类型
            string DbType = System.Configuration.ConfigurationManager.AppSettings["DbType"];
            if (string.IsNullOrWhiteSpace(DbType))
            {
                DbType = "System.Data.SqlClient";
            }
            factory = DbProviderFactories.GetFactory(DbType);
        }


        private static DbProviderFactory factory = null;
        private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());


        /// <summary>
        /// 以指定的DbConnection对象执行一个Command命令
        /// </summary>
        /// <param name="connection">DbConnection对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>返Commad对象执行后数据库受影响的行数</returns>
        public static int ExecuteNonQuery(DbConnection connection, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            DbCommand cmd = factory.CreateCommand();
            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }



        /// <summary>
        /// 执行一个带事务的Command命令
        /// </summary>
        /// <param name="trans">DbTransaction对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>返Commad对象执行后数据库受影响的行数</returns>
        public static int ExecuteNonQuery(DbTransaction trans, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            DbCommand cmd = factory.CreateCommand();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }



        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="connection">连接对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>一个只向前的数据读取器</returns>
        public static DbDataReader ExecuteReader(DbConnection connection, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            DbCommand cmd = factory.CreateCommand();

            try
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                DbDataReader rdr = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                return rdr;
            }
            catch
            {
                connection.Close();
                throw;
            }
        }

        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="trans">事务对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>一个只向前的数据读取器</returns>
        public static DbDataReader ExecuteReader(DbTransaction trans, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            DbCommand cmd = factory.CreateCommand();

            try
            {
                PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
                DbDataReader rdr = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                return rdr;
            }
            catch
            {
                trans.Rollback();
                throw;
            }
        }


        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="connection">连接对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>查询结果的第一行第一列</returns>
        public static object ExecuteScalar(DbConnection connection, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {

            DbCommand cmd = factory.CreateCommand();
            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            return val;
        }

        /// <summary>
        /// 执行一个带事务对象的Command命令
        /// </summary>
        /// <param name="trans">连接对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>查询结果的第一行第一列</returns>
        public static object ExecuteScalar(DbTransaction trans, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {

            DbCommand cmd = factory.CreateCommand();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            return val;
        }


        /// <summary>
        /// 执行一个查询，返回一个DataSet
        /// </summary>
        /// <param name="connection"></param>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters"></param>
        /// <param name="cmdType"></param>
        /// <returns></returns>
        public static System.Data.DataSet ExecuteDataSet(DbConnection connection, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            DbCommand cmd = factory.CreateCommand();
            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            DbDataAdapter da = factory.CreateDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }


        /// <summary>
        /// 缓存查询参数
        /// </summary>
        /// <param name="cacheKey"></param>
        /// <param name="commandParameters"></param>
        public static void CacheParameters(string cacheKey, IList<DbParameter> commandParameters)
        {
            parmCache[cacheKey] = commandParameters;
        }

        /// <summary>
        /// 从缓存中读取参数的副本
        /// </summary>
        /// <param name="cacheKey"></param>
        /// <returns></returns>
        public static IList<DbParameter> GetCachedParameters(string cacheKey)
        {
            IList<DbParameter> cachedParms = (IList<DbParameter>)parmCache[cacheKey];

            if (cachedParms == null)
                return null;
            Type generalType = typeof(IList<>).MakeGenericType(new Type[] { typeof(DbParameter) });
            IList<DbParameter> clonedParms = Activator.CreateInstance(generalType) as IList<DbParameter>;

            for (int i = 0, j = cachedParms.Count; i < j; i++)
                clonedParms[i] = (DbParameter)((ICloneable)cachedParms[i]).Clone();

            return clonedParms;
        }

        /// <summary>
        /// 预处理命令对象
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        /// <param name="cmdType"></param>
        /// <param name="cmdText"></param>
        /// <param name="cmdParms"></param>
        private static void PrepareCommand(DbCommand cmd, DbConnection conn, DbTransaction trans, CommandType cmdType, string cmdText, IList<DbParameter> cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (DbParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }
    }
}
