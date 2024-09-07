using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Tool;

namespace MCSService.DAL
{
    public class DALDatabase : BaseDAL
    {

        public void CreateTable(string name)
        {

            string sqlcreate = string.Format(@"
                            CREATE TABLE [dbo].[{0}](
	                            [ID] [bigint] IDENTITY(1,1) NOT NULL,
	                            [Command] [varchar](50) NULL,
	                            [DevName] [varchar](50) NULL,
	                            [DevID] [bigint] NULL,
	                            [Value1] [nvarchar](max) NULL,
	                            [Value2] [nvarchar](max) NULL,
	                            [CreateTime] [datetime] NULL,
	                            [AddTime] [datetime] NULL,
                             CONSTRAINT [PK_{0}] PRIMARY KEY CLUSTERED 
                            (
	                            [ID] ASC
                            )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
                            ) ON [PRIMARY]", name);

            using (SqlConnection con = new SqlConnection(DataRealConnString))
            {
                con.Open();
                string sql = string.Format("SELECT count(*) FROM information_schema.TABLES WHERE table_name ='{0}'", name);
                SqlCommand cmd = new SqlCommand(sql, con);
                object ret = cmd.ExecuteScalar();
                if (ret.ToString() == "1")
                {
                    con.Close();
                    return;
                }

                cmd.CommandText = sqlcreate;
                cmd.ExecuteNonQuery();

            }

        }


        public void DeleteTable()
        {
            string sql = "select name from sysobjects where xtype = 'U'";

            using (SqlConnection con = new SqlConnection(DataRealConnString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader dr = cmd.ExecuteReader();

                List<string> tablenames = new List<string>();
                while (dr.Read())
                {
                    tablenames.Add(dr["name"].ToString());
                }
                dr.Close();
                foreach (string name in tablenames)
                {
                    if (name == DateTime.Now.ToString("yyyyMM")
                        || name == DateTime.Now.AddMonths(-1).ToString("yyyyMM")
                        || name == DateTime.Now.AddMonths(-2).ToString("yyyyMM")
                        || name == DateTime.Now.AddMonths(1).ToString("yyyyMM"))
                    {
                        continue;
                    }

                    //删除表
                    sql = "drop table [" + name + "]";
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                    break;
                }
            }
        }

    }
}
