using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DB
{
    /// <summary>
    /// 指示属性为数据库字段
    /// </summary>
    [AttributeUsage(AttributeTargets.Property)]
    public class DbFieldAttribute : Attribute
    {
        public DbFieldAttribute(bool _isKey, bool _autoInc)
        {
            IsAutoIncrase = _autoInc;
            IsKey = _isKey;
        }
        public DbFieldAttribute(bool _isKey)
        {
            IsAutoIncrase = false;
            IsKey = _isKey;
        }

        public DbFieldAttribute()
        {
            IsAutoIncrase = false;
            IsKey = false;
        }
        public bool IsAutoIncrase { get; private set; }
        public bool IsKey { get; private set; }
    }

    /// <summary>
    /// 类对应的表名所性的Schema
    /// </summary>
    [AttributeUsage(AttributeTargets.Class)]
    public class DbSchemaAttribute : Attribute
    {
        public DbSchemaAttribute(string schemaName, string tableName)
        {
            SchemaName = schemaName;
            TableName = tableName;
        }

        public DbSchemaAttribute(string tableName)
        {
            TableName = tableName;
        }

        public string SchemaName { get; private set; }
        public string TableName { get; private set; }
    }

    /// <summary>
    /// 通用数据库操作类
    /// </summary>
    public abstract class DbHelper
    {
        static DbHelper()
        {
            //DbProviderFactories.RegisterFactory("System.Data.SQLite", System.Data.SQLite.SQLiteFactory.Instance);

            ////从配置文件读取数据库类型
            //string DbType = ConfigurationManager.AppSettings["DbType"];
            //if (string.IsNullOrWhiteSpace(DbType))
            //{
            //    DbType = "System.Data.SqlClient";
            //}
            //factory = DbProviderFactories.GetFactory(DbType);
            //factory = System.Data.SqlClient.SqlClientFactory.Instance;
            factory = Npgsql.NpgsqlFactory.Instance;
#if DEBUG
            Console.WriteLine(factory);
#endif
        }


        private static DbProviderFactory factory = null;
        private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());
        private static string m_connectionstring = null;

        /// <summary>
        /// 创建一个新的连接对象并返回
        /// </summary>
        public static DbConnection Connection
        {
            get { return getCon(); }
        }

        /// <summary>
        /// 以默认的连接字符串创建Connection实例
        /// </summary>
        /// <returns></returns>
        private static DbConnection getCon()
        {
            DbConnection con = factory.CreateConnection();
            //string dbName = ConfigurationManager.AppSettings["DbFile"];
            //string connStr = string.Format("Data Source=" + System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, dbName));
            //string connStr = string.Format("Server={0};Port={1};Database={2};User Id={3};Password={4};",
            //    ConfigurationManager.AppSettings["pg_IP"],
            //    ConfigurationManager.AppSettings["pg_Port"],
            //    ConfigurationManager.AppSettings["pg_Database"],
            //    ConfigurationManager.AppSettings["pg_User"],
            //    ConfigurationManager.AppSettings["pg_Password"]);
            //con.ConnectionString = $"Server=118.24.10.227;Database=db_dyxy;user=sa;pwd=#n123456a;";
            //con.ConnectionString = "Server=118.24.10.227;Port=5433;Database=db_dyxy;User Id=postgres;Password=#n123456a";
            con.ConnectionString = "Server=127.0.0.1;Port=5433;Database=db_andes;User Id=postgres;Password=#n123456a";
            con.ConnectionString = "Server=111.229.182.125;Port=5433;Database=db_andes_new;User Id=postgres;Password=#n123456a";
            return con;
        }

        /// <summary>
        /// 设置全局连接字符串
        /// </summary>
        public static string ConnectionString
        {
            set
            {
                m_connectionstring = value;
            }
        }

        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>返Commad对象执行后数据库受影响的行数</returns>
        public static int ExecuteNonQuery(string connectionString, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            using (DbCommand cmd = factory.CreateCommand())
            using (DbConnection conn = factory.CreateConnection())
            {
                conn.ConnectionString = connectionString;
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 以指定的DbConnection对象执行一个Command命令
        /// </summary>
        /// <param name="connection">DbConnection对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>返Commad对象执行后数据库受影响的行数</returns>
        public static int ExecuteNonQuery(DbConnection connection, string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var item in commandParameters)
                {
                    DbParameter p = factory.CreateParameter();
                    p.ParameterName = item.Key;
                    p.Value = item.Value;
                    pas.Add(p);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, pas);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 以默认的连接字串执行一个Command命令
        /// </summary>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>返Commad对象执行后数据库受影响的行数</returns>
        public static int ExecuteNonQuery(string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var kv in commandParameters)
                {
                    var dp = factory.CreateParameter();
                    dp.ParameterName = kv.Key;
                    dp.Value = kv.Value;
                    pas.Add(dp);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            using (DbConnection connection = getCon())
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, pas);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 执行一个SQL语句
        /// </summary>
        /// <param name="cmdText">SQL语句</param>
        /// <returns>执行命令影响的行数</returns>
        public static int ExecuteNonQuery(string cmdText)
        {
            return ExecuteNonQuery(cmdText, null, CommandType.Text);
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
            using (DbCommand cmd = factory.CreateCommand())
            {
                PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 执行一个带事务的Command命令
        /// </summary>
        /// <param name="trans">DbTransaction对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>返Commad对象执行后数据库受影响的行数</returns>
        public static int ExecuteNonQuery(DbTransaction trans, string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            List<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var o in commandParameters)
                {
                    var p = factory.CreateParameter();
                    p.Value = o.Value;
                    p.ParameterName = o.Key;
                    pas.Add(p);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            {
                PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, pas);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }


        /// <summary>
        /// 执行一个SQL语句
        /// </summary>
        /// <param name="commandParameters">参数值</param>
        /// <param name="cmdText">SQL语句</param>
        /// <returns>执行命令影响的行数</returns>
        public static int ExecuteNonQuery(string cmdText, IDictionary<string, object> commandParameters)
        {
            return ExecuteNonQuery(cmdText, commandParameters, CommandType.Text);
        }

        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>一个只向前的数据读取器</returns>
        public static DbDataReader ExecuteReader(string connectionString, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            using (DbCommand cmd = factory.CreateCommand())
            {
                DbConnection conn = factory.CreateConnection();
                conn.ConnectionString = connectionString;

                try
                {
                    PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                    DbDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    cmd.Parameters.Clear();
                    return rdr;
                }
                catch
                {
                    conn.Close();
                    throw;
                }
            }
        }

        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="connection">连接对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>一个只向前的数据读取器</returns>
        public static DbDataReader ExecuteReader(DbConnection connection, string cmdText, IDictionary<string, object> pas, CommandType cmdType = CommandType.Text)
        {
            List<DbParameter> commandParameters = null;
            if (pas != null)
            {
                commandParameters = new List<DbParameter>();
                foreach (var pa in pas)
                {
                    var p = factory.CreateParameter();
                    p.ParameterName = pa.Key;
                    p.Value = pa.Value;
                    commandParameters.Add(p);
                }
            }

            using (DbCommand cmd = factory.CreateCommand())
            {
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
        }

        /// <summary>
        /// 执行一个SQL语句
        /// </summary>
        /// <param name="cmdText">命令文本</param>
        /// <returns>一个只向前的数据读取器</returns>
        public static DbDataReader ExecuteReader(string cmdText)
        {
            return ExecuteReader(cmdText, null, CommandType.Text);
        }

        /// <summary>
        /// 以默认的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>一个只向前的数据读取器</returns>
        public static DbDataReader ExecuteReader(string cmdText, IDictionary<string, object> pas, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> commandParameters = null;
            if (pas != null)
            {
                commandParameters = new List<DbParameter>();
                foreach (var kv in pas)
                {
                    var p = factory.CreateParameter();
                    p.ParameterName = kv.Key;
                    p.Value = kv.Value;
                    commandParameters.Add(p);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            {
                DbConnection conn = getCon();

                try
                {
                    PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                    DbDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    cmd.Parameters.Clear();
                    return rdr;
                }
                catch
                {
                    conn.Close();
                    throw;
                }
            }
        }

        /// <summary>
        /// 以指定的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>查询结果的第一行第一列</returns>
        public static object ExecuteScalar(string connectionString, string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var pa in commandParameters)
                {
                    var p = factory.CreateParameter();
                    p.ParameterName = pa.Key;
                    p.Value = pa.Value;
                    pas.Add(p);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            using (DbConnection connection = factory.CreateConnection())
            {
                connection.ConnectionString = connectionString;

                PrepareCommand(cmd, connection, null, cmdType, cmdText, pas);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
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
        public static object ExecuteScalar(DbConnection connection, string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var pa in commandParameters)
                {
                    var p = factory.CreateParameter();
                    p.ParameterName = pa.Key;
                    p.Value = pa.Value;
                    pas.Add(p);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, pas);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 执行一个带事务对象的Command命令
        /// </summary>
        /// <param name="trans">连接对象</param>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>查询结果的第一行第一列</returns>
        public static object ExecuteScalar(DbTransaction trans, string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var pa in commandParameters)
                {
                    var p = factory.CreateParameter();
                    p.ParameterName = pa.Key;
                    p.Value = pa.Value;
                    pas.Add(p);
                }
            }
            using (DbCommand cmd = factory.CreateCommand())
            {
                PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, pas);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 以默认的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="cmdType">命令类型</param>
        /// <param name="cmdText">命令文本</param>
        /// <param name="commandParameters">Command对象中的参数</param>
        /// <returns>查询结果的第一行第一列</returns>
        public static object ExecuteScalar(string cmdText, IDictionary<string, object> commandParameters, CommandType cmdType = CommandType.Text)
        {
            IList<DbParameter> pas = null;
            if (commandParameters != null)
            {
                pas = new List<DbParameter>();
                foreach (var pa in commandParameters)
                {
                    var p = factory.CreateParameter();
                    p.ParameterName = pa.Key;
                    p.Value = pa.Value;
                    pas.Add(p);
                }
            }
            using (DbConnection conn = getCon())
            {
                using (DbCommand cmd = conn.CreateCommand())
                {
                    PrepareCommand(cmd, conn, null, cmdType, cmdText, pas);
                    object val = cmd.ExecuteScalar();
                    cmd.Parameters.Clear();
                    return val;
                }
            }
        }

        /// <summary>
        /// 以默认的连接字符串执行一个Command命令
        /// </summary>
        /// <param name="cmdText">要执行的SQL语句</param>
        /// <returns>查询结果的第一行第一列</returns>
        public static object ExecuteScalar(string cmdText)
        {
            return ExecuteScalar(cmdText, null, CommandType.Text);
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
            using (DbCommand cmd = factory.CreateCommand())
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                DbDataAdapter da = factory.CreateDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        /// <summary>
        /// 执行一个查询，返回一个DataSet
        /// </summary>
        /// <param name="connectionString"></param>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters"></param>
        /// <param name="cmdType"></param>
        /// <returns></returns>
        public static System.Data.DataSet ExecuteDataSet(string connectionString, string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            using (DbConnection connection = factory.CreateConnection())
            {
                connection.ConnectionString = connectionString;
                using (DbCommand cmd = factory.CreateCommand())
                {
                    PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                    DbDataAdapter da = factory.CreateDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }

        /// <summary>
        /// 执行一个查询，返回一个DataSet
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters"></param>
        /// <param name="cmdType"></param>
        /// <returns></returns>
        public static System.Data.DataSet ExecuteDataSet(string cmdText, IList<DbParameter> commandParameters, CommandType cmdType = CommandType.Text)
        {
            using (DbConnection connection = getCon())
            {
                using (DbCommand cmd = factory.CreateCommand())
                {
                    PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                    DbDataAdapter da = factory.CreateDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }

        /// <summary>
        /// 执行一个查询，返回一个DataSet
        /// </summary>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static System.Data.DataSet ExecuteDataSet(string cmdText)
        {
            return ExecuteDataSet(cmdText, null, CommandType.Text);
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

    /// <summary>
    /// 辅助实体操作类
    /// </summary>
    public abstract class EntityHelp
    {
        static Dictionary<Type, DbType> typeMap = null;

        static EntityHelp()
        {
            typeMap = new Dictionary<Type, DbType>();
            typeMap[typeof(byte)] = DbType.Byte;
            typeMap[typeof(sbyte)] = DbType.SByte;
            typeMap[typeof(short)] = DbType.Int16;
            typeMap[typeof(ushort)] = DbType.UInt16;
            typeMap[typeof(int)] = DbType.Int32;
            typeMap[typeof(uint)] = DbType.UInt32;
            typeMap[typeof(long)] = DbType.Int64;
            typeMap[typeof(ulong)] = DbType.UInt64;
            typeMap[typeof(float)] = DbType.Single;
            typeMap[typeof(double)] = DbType.Double;
            typeMap[typeof(decimal)] = DbType.Decimal;
            typeMap[typeof(bool)] = DbType.Boolean;
            typeMap[typeof(string)] = DbType.String;
            typeMap[typeof(char)] = DbType.StringFixedLength;
            typeMap[typeof(Guid)] = DbType.Guid;
            typeMap[typeof(DateTime)] = DbType.DateTime;
            typeMap[typeof(DateTimeOffset)] = DbType.DateTimeOffset;
            typeMap[typeof(byte[])] = DbType.Binary;
            typeMap[typeof(byte?)] = DbType.Byte;
            typeMap[typeof(sbyte?)] = DbType.SByte;
            typeMap[typeof(short?)] = DbType.Int16;
            typeMap[typeof(ushort?)] = DbType.UInt16;
            typeMap[typeof(int?)] = DbType.Int32;
            typeMap[typeof(uint?)] = DbType.UInt32;
            typeMap[typeof(long?)] = DbType.Int64;
            typeMap[typeof(ulong?)] = DbType.UInt64;
            typeMap[typeof(float?)] = DbType.Single;
            typeMap[typeof(double?)] = DbType.Double;
            typeMap[typeof(decimal?)] = DbType.Decimal;
            typeMap[typeof(bool?)] = DbType.Boolean;
            typeMap[typeof(char?)] = DbType.StringFixedLength;
            typeMap[typeof(Guid?)] = DbType.Guid;
            typeMap[typeof(DateTime?)] = DbType.DateTime;
            typeMap[typeof(DateTimeOffset?)] = DbType.DateTimeOffset;
        }

        /// <summary>
        /// 执行一个查询语句
        /// </summary>
        /// <remarks>如果查询的结果集中有多条记录，只实例化最后一条记录</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="strSQL">查询语句</param>
        /// <returns>返回一个实体对象</returns>
        public static T GetObject<T>(string strSQL, System.Data.Common.DbConnection conn = null) where T : class, new()
        {
            if (conn == null)
                return GetObject<T>(DbHelper.ExecuteReader(strSQL));
            else
                return GetObject<T>(DbHelper.ExecuteReader(conn, strSQL, null));
        }

        public static void GetObject<T>(ref T t) where T : class, new()
        {
            string keyName = null;
            object keyValue = null;
            foreach (var item in t.GetType().GetProperties())
            {
                if (IsKey(item))
                {
                    keyName = item.Name;
                    keyValue = item.GetValue(t, null);
                    break;
                }
            }

            if (string.IsNullOrEmpty(keyName))
            {
                t = default;
                return;
            }

            string sc = GetSchema(typeof(T));
            if (sc == null) throw new Exception("实体未有schema");
            string sql = $"select * from {sc}.{typeof(T).Name} where {keyName}=@pa";
            IDictionary<string, object> pas = new Dictionary<string, object>();
            pas.Add("@pa", keyValue);
            t = GetObject<T>(DbHelper.ExecuteReader(sql, pas));
        }

        /// <summary>
        /// 执行一个查询语句
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="strSQL">查询语句</param>
        /// <returns>返回一个实体集</returns>
        public static List<T> GetObjectList<T>(string strSQL, System.Data.Common.DbConnection conn = null) where T : class, new()
        {
            if (conn == null)
                return GetObjectList<T>(DbHelper.ExecuteReader(strSQL));
            else
                return GetObjectList<T>(DbHelper.ExecuteReader(conn, strSQL, null));
        }

        /// <summary>
        /// 查询指定表所有数据
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <returns>返回一个实体集</returns>
        public static List<T> GetObjectList<T>(DbConnection conn = null) where T : class, new()
        {
            string strSQL = string.Format("select * from \"{0}\".\"{1}\"", GetSchema(typeof(T)), GetTableNema(typeof(T)));
            Console.WriteLine(strSQL);
            if (conn == null)
                return GetObjectList<T>(DbHelper.ExecuteReader(strSQL));
            else
                return GetObjectList<T>(DbHelper.ExecuteReader(conn, strSQL, null));
        }

        public static object GetObjectList(Type T)
        {
            string strSQL = string.Format("select * from \"{0}\".\"{1}\"", GetSchema(T.GetType()), GetTableNema(T));
            return DbHelper.ExecuteDataSet(strSQL).Tables[0];
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
                            if (dr[f] != DBNull.Value && item.CanWrite)
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
                Feilds[i] = dr.GetName(i).ToLower();
            }

            try
            {
                while (dr.Read())
                {
                    T t = new T();
                    foreach (var item in pi)
                    {
                        if (Feilds.Contains(item.Name.ToLower()) && dr[item.Name] != DBNull.Value && item.CanWrite)
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
                    if (dt.Columns.Contains(item.Name) && dr[item.Name] != DBNull.Value && item.CanWrite)
                    {
                        if (dr[item.Name].GetType() != typeof(DateTime))
                            item.SetValue(t, dr[item.Name], null);
                        else
                            item.SetValue(t, dr[item.Name].ToString(), null);
                    }
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
                if (dt.Columns.Contains(item.Name) && dr[item.Name] != DBNull.Value && item.CanWrite)
                {
                    if (dr[item.Name].GetType() != typeof(DateTime))
                        item.SetValue(t, dr[item.Name], null);
                    else
                        item.SetValue(t, dr[item.Name].ToString(), null);
                }
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
        public static int InsertEntity<T>(T t, System.Data.Common.DbConnection conn) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            IDictionary<string, object> paramsList = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO {0}.{1} (", GetSchema(type), GetTableNema(type));
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                if (IsKeyAndAutoInc(item)) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("{0},", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    paramsList.Add("@pa_" + item.Name.ToLower(), val);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(");");
            return DbHelper.ExecuteNonQuery(conn, sbSQL.ToString(), paramsList);

        }


        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int InsertEntity<T>(T t, System.Data.Common.DbTransaction tonn = null) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            IDictionary<string, object> objpas = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO {0}.{1} (", GetSchema(type), GetTableNema(type));
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                //插入时跳过主键自增的列
                if (IsKeyAndAutoInc(item)) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("{0},", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    //System.Data.Common.DbParameter pa = 
                    //    new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), EntityHelp.GetDbType(item.PropertyType));
                    //pa.Value = val;
                    //paramsList.Add(pa);
                    objpas.Add("@pa_" + item.Name.ToLower(), val);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(");");
            if (tonn == null)
            {
                //return DbHelper.ExecuteNonQuery(sbSQL.ToString(), paramsList);
                return DbHelper.ExecuteNonQuery(sbSQL.ToString(), objpas);
            }
            else
            {
                //return DbHelper.ExecuteNonQuery(tonn, sbSQL.ToString(), paramsList);
                return DbHelper.ExecuteNonQuery(tonn, sbSQL.ToString(), objpas);
            }

        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <param name="o">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int InsertObject(object t)
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", t.GetType().ToString()));
            }
            Type type = t.GetType();
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            IDictionary<string, object> objpas = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO {0}.{1} (", GetSchema(type), GetTableNema(type));
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                //插入时跳过主键自增的列
                if (IsKeyAndAutoInc(item)) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("{0},", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    //System.Data.Common.DbParameter pa = 
                    //    new System.Data.SqlClient.SqlParameter(string.Format("@pa_{0}", item.Name.ToLower()), EntityHelp.GetDbType(item.PropertyType));
                    //pa.Value = val;
                    //paramsList.Add(pa);
                    objpas.Add("@pa_" + item.Name.ToLower(), val);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(");");
            return DbHelper.ExecuteNonQuery(sbSQL.ToString(), objpas);

        }

        /// <summary>
        /// 插入一批实体对象到数据库
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entityList"></param>
        /// <param name="trans"></param>
        /// <returns></returns>
        public static int InsertEntityList<T>(IEnumerable<T> entityList) where T : class, new()
        {
            int retval = 0;
            System.Data.Common.DbTransaction trans = null;
            using (var con = DbHelper.Connection)
            {
                try
                {
                    con.Open();
                    trans = con.BeginTransaction();
                    foreach (var item in entityList)
                    {
                        retval += InsertEntity(item, trans);
                    }
                    trans.Commit();
                }
                catch
                {
                    if (con != null)
                        con.Close();
                    if (trans != null)
                        trans.Rollback();
                    throw;
                }
            }
            return retval;

        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回插入行的ID</returns>
        public static int InsertEntityGetID<T>(T t, System.Data.Common.DbConnection conn) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            IDictionary<string, object> paramsList = new Dictionary<string, object>();
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO {0}.{1} (", GetSchema(type), GetTableNema(type));
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (IsKeyAndAutoInc(item)) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("{0},", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    paramsList.Add("@pa_" + item.Name.ToLower(), val);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append(") RETURNING id");
            if (conn == null)
                return int.Parse(DbHelper.ExecuteScalar(sbSQL.ToString(), paramsList).ToString());
            else
                return int.Parse(DbHelper.ExecuteScalar(conn, sbSQL.ToString(), paramsList).ToString());

        }

        /// <summary>
        /// 将实体对象写入数据库
        /// </summary>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回插入行的ID</returns>
        public static int InsertEntityGetID<T>(T t, System.Data.Common.DbTransaction tonn = null) where T : class, new()
        {

            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();

            IDictionary<string, object> paramsList = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            System.Text.StringBuilder sbParam = new System.Text.StringBuilder();
            sbSQL.AppendFormat("INSERT INTO {0}.{1} (", GetSchema(type), GetTableNema(type));
            sbParam.AppendFormat(") VALUES (");
            foreach (var item in pl)
            {
                if (IsKeyAndAutoInc(item)) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val != null)
                {
                    sbSQL.AppendFormat("{0},", item.Name);
                    sbParam.AppendFormat("@pa_{0},", item.Name.ToLower());
                    paramsList.Add("@pa_" + item.Name.ToLower(), val);
                }
            }

            sbSQL.Remove(sbSQL.Length - 1, 1).Append(sbParam.Remove(sbParam.Length - 1, 1)).Append("); SELECT last_insert_rowid()");
            if (tonn == null)
                return int.Parse(DbHelper.ExecuteScalar(sbSQL.ToString(), paramsList).ToString());
            else
                return int.Parse(DbHelper.ExecuteScalar(tonn, sbSQL.ToString(), paramsList).ToString());

        }

        /// <summary>
        /// 从实体更新数据表中对应的记录
        /// </summary>
        /// <remarks>该表必须以ID为主键，只更新实体中有值的字段</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int UpdateEntity<T>(T t, System.Data.Common.DbConnection conn) where T : class, new()
        {
            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            string strCondition = string.Empty;
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            IDictionary<string, object> paramtersDictonary = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            sbSQL.AppendFormat("UPDATE {0}.{1} SET ", GetSchema(type), GetTableNema(type));
            bool bHasKey = false;
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val == null) continue;
                if (IsKey(item))
                {
                    strCondition = string.Format("AND {0}=@pa_{1}", item.Name, item.Name.ToLower());
                    bHasKey = true;
                    paramtersDictonary.Add("@pa_" + item.Name.ToLower(), val);
                }
                else
                {
                    sbSQL.AppendFormat("{0}=@pa_{1},", item.Name, item.Name.ToLower());
                    paramtersDictonary.Add("@pa_" + item.Name.ToLower(), val);
                }
            }
            if (!bHasKey) throw new Exception(string.Format("对象{0}未设备主键", GetTableNema(typeof(T))));
            if (string.IsNullOrWhiteSpace(strCondition)) throw new Exception("主键未赋值");
            sbSQL.Remove(sbSQL.Length - 1, 1).Append(" WHERE 1=1  ").Append(strCondition);
            return DbHelper.ExecuteNonQuery(sbSQL.ToString(), paramtersDictonary);

        }

        /// <summary>
        /// 从实体更新数据表中对应的记录
        /// </summary>
        /// <remarks>该表必须以ID为主键，只更新实体中有值的字段</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事物对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int UpdateEntity<T>(T t, System.Data.Common.DbTransaction tonn = null) where T : class, new()
        {
            if (tonn != null) return UpdateEntity(t, tonn.Connection);

            if (t == null)
            {
                throw new ArgumentNullException(string.Format("{0}对像为空", typeof(T).ToString()));
            }
            string strCondition = string.Empty;
            Type type = typeof(T);
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            IDictionary<string, object> paramtersDictonary = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            sbSQL.AppendFormat("UPDATE {0}.{1} SET ", GetSchema(type), GetTableNema(type));
            bool bHasKey = false;
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(t, null);
                if (val == null) continue;
                if (IsKey(item))
                {
                    strCondition = string.Format("AND {0}=@pa_{1}", item.Name, item.Name.ToLower());
                    bHasKey = true;
                    paramtersDictonary.Add("@pa_" + item.Name.ToLower(), val);
                }
                else
                {
                    sbSQL.AppendFormat("{0}=@pa_{1},", item.Name, item.Name.ToLower());
                    paramtersDictonary.Add("@pa_" + item.Name.ToLower(), val);
                }
            }
            if (!bHasKey) throw new Exception(string.Format("对象{0}未设备主键", GetTableNema(typeof(T))));
            if (string.IsNullOrWhiteSpace(strCondition)) throw new Exception("主键未赋值");
            sbSQL.Remove(sbSQL.Length - 1, 1).Append(" WHERE 1=1  ").Append(strCondition);
            return DbHelper.ExecuteNonQuery(sbSQL.ToString(), paramtersDictonary);

        }


        public static int UpdateObject(object o)
        {
            if (o == null)
            {
                throw new ArgumentNullException("o");
            }
            string strCondition = string.Empty;
            Type type = o.GetType();
            System.Reflection.PropertyInfo[] pl = type.GetProperties();
            IDictionary<string, object> paramtersDictonary = new Dictionary<string, object>();
            System.Text.StringBuilder sbSQL = new System.Text.StringBuilder();
            sbSQL.AppendFormat("UPDATE {0}.{1} SET ", GetSchema(type), GetTableNema(type));
            bool bHasKey = false;
            foreach (var item in pl)
            {
                if (!item.CanWrite) continue;
                if (!IsDbFile(item)) continue;
                object val = item.GetValue(o, null);
                if (val == null) continue;
                if (IsKey(item))
                {
                    strCondition = string.Format("AND {0}=@pa_{1}", item.Name, item.Name.ToLower());
                    bHasKey = true;
                    paramtersDictonary.Add("@pa_" + item.Name.ToLower(), val);
                }
                else
                {
                    sbSQL.AppendFormat("{0}=@pa_{1},", item.Name, item.Name.ToLower());
                    paramtersDictonary.Add("@pa_" + item.Name.ToLower(), val);
                }
            }
            if (!bHasKey) throw new Exception(string.Format("对象{0}未设置主键", GetTableNema(o.GetType())));
            if (string.IsNullOrWhiteSpace(strCondition)) throw new Exception("主键未赋值");
            sbSQL.Remove(sbSQL.Length - 1, 1).Append(" WHERE 1=1  ").Append(strCondition);
            return DbHelper.ExecuteNonQuery(sbSQL.ToString(), paramtersDictonary);

        }

        /// <summary>
        /// 从实体删除数据表中的对应记录
        /// </summary>
        /// <remarks>该表必须以ID为主键,并且须对实体的ID字段赋值</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="conn">连接对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int DeleteEntity<T>(T t, System.Data.Common.DbConnection conn) where T : class, new()
        {
            string keyName = null;
            object keyValue = null;
            foreach (var p in typeof(T).GetProperties())
            {
                if (IsKey(p))
                {
                    keyName = p.Name;
                    keyValue = p.GetValue(t, null);
                    break;
                }
            }

            if (string.IsNullOrWhiteSpace(keyName)) throw new Exception("未找到对象主键");
            if (keyValue == null) throw new Exception("主键未赋值");
            IDictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("@_pa" + keyName.ToLower(), keyValue);
            return DbHelper.ExecuteNonQuery(conn, string.Format("DELETE FROM {0}.{1} WHERE {2}=@pa_{2}", GetSchema(typeof(T)), GetTableNema(typeof(T)), keyName, keyName.ToLower()), dic);

        }

        /// <summary>
        /// 从实体删除数据表中的对应记录
        /// </summary>
        /// <remarks>该表必须以ID为主键,并且须对实体的ID字段赋值</remarks>
        /// <typeparam name="T">数据库实体类</typeparam>
        /// <param name="t">待写入的实体</param>
        /// <param name="tonn">事务对象</param>
        /// <returns>返回数据库受影响的行数</returns>
        public static int DeleteEntity<T>(T t, System.Data.Common.DbTransaction tonn = null) where T : class, new()
        {
            string keyName = null;
            object keyValue = null;
            foreach (var p in t.GetType().GetProperties())
            {
                if (IsKey(p))
                {
                    keyName = p.Name;
                    keyValue = p.GetValue(t, null);
                    break;
                }
            }
            if (string.IsNullOrWhiteSpace(keyName)) throw new Exception("未找到对象主键");
            if (keyValue == null) throw new Exception("主键未赋值");
            IDictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("@pa_" + keyName.ToLower(), keyValue);
            if (tonn != null)
                return DbHelper.ExecuteNonQuery(tonn, string.Format("DELETE FROM {0}.{1} WHERE {2}=@pa_{2}", GetSchema(t.GetType()), GetTableNema(t.GetType()), keyName, keyName.ToLower()), dic);
            else
                return DbHelper.ExecuteNonQuery(string.Format("DELETE FROM {0}.{1} WHERE {2}=@pa_{2}", GetSchema(t.GetType()), GetTableNema(t.GetType()), keyName, keyName.ToLower()), dic);
        }

        public static int DeleteObject(object o)
        {
            string keyName = null;
            object keyValue = null;
            foreach (var p in o.GetType().GetProperties())
            {
                if (IsKey(p))
                {
                    keyName = p.Name;
                    keyValue = p.GetValue(o, null);
                    break;
                }
            }

            if (string.IsNullOrWhiteSpace(keyName)) throw new Exception("未找到对象主键");
            if (keyValue == null) throw new Exception("主键未赋值");
            IDictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("@pa_" + keyName.ToLower(), keyValue);
            return DbHelper.ExecuteNonQuery(string.Format("DELETE FROM {0}.{1} WHERE {2}=@pa_{2}", GetSchema(o.GetType()), GetTableNema(o.GetType()), keyName, keyName.ToLower()), dic);

        }

        public static int ExecNonQuery(string sql)
        {

            return DbHelper.ExecuteNonQuery(sql);

        }

        public static System.Data.DbType GetDbType(Type t)
        {
            if (t.IsGenericType)
            {
                if (t.GetGenericTypeDefinition() == typeof(Nullable<>))
                {
                    t = t.GetGenericArguments()[0];
                }
            }

            DbType val;
            if (typeMap.TryGetValue(t, out val))
            {
                return val;
            }
            throw new Exception("unknow basic type");
        }

        /// <summary>
        /// 测试属性是否为自增长主键
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        private static bool IsKeyAndAutoInc(System.Reflection.PropertyInfo p)
        {
            var attr = p.GetCustomAttributes(true);
            foreach (Attribute item in attr)
            {
                if (item is DbFieldAttribute)
                {
                    if (((DbFieldAttribute)item).IsAutoIncrase)
                        return true;
                }
            }
            return false;
        }

        private static bool IsKey(System.Reflection.PropertyInfo p)
        {
            var attr = p.GetCustomAttributes(true);
            foreach (Attribute item in attr)
            {
                if (item is DbFieldAttribute)
                {
                    if (((DbFieldAttribute)item).IsKey)
                        return true;
                }
            }
            return false;
        }

        private static string GetSchema(Type t)
        {
            var attrs = t.GetCustomAttributes(typeof(DbSchemaAttribute), true);
            if (attrs == null || attrs.Length <= 0) return "public";
            var sc = attrs[0] as DbSchemaAttribute;
            if (sc == null) return "public";
            return sc.SchemaName;
        }

        private static string GetTableNema(Type t)
        {
            var attrs = t.GetCustomAttributes(typeof(DbSchemaAttribute), true);
            if (attrs == null || attrs.Length <= 0) return "";
            var sc = attrs[0] as DbSchemaAttribute;
            if (sc == null) return "";
            return sc.TableName;
        }

        private static bool IsDbFile(System.Reflection.PropertyInfo p)
        {
            var attr = p.GetCustomAttributes(true);
            foreach (Attribute item in attr)
            {
                if (item is DbFieldAttribute)
                    return true;
            }
            return false;
        }
    }
}