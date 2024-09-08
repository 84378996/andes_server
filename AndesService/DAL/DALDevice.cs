using DB;
using Entity;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCSService.DAL
{
    internal class DALDevice
    {
        internal bool Get(JObject pas, out List<Device> devs, out int pi, out int ps, out int total, out int count)
        {
            pi = 0;
            ps = 0;
            total = 0; 
            count = 0;
            devs = new List<Device>();
            StringBuilder sbCondition = new StringBuilder();
            sbCondition.Append(" 1=1 ");
            try
            {
                pi = pas["PageIndex"].Value<int>();
                ps = pas["PageSize"].Value<int>();

                if(pas.ContainsKey("DeviceNo"))
                {
                    string devName = pas["DeviceNo"].Value<string>();
                    if (!string.IsNullOrWhiteSpace(devName))
                    {
                        sbCondition.Append($" AND \"DeviceNo\" LIKE \"%{devName}%\"");
                    }
                }

                if (pas.ContainsKey("IMEI"))
                {
                    string imei = pas["IMEI"].Value<string>();
                    if (!string.IsNullOrWhiteSpace(imei))
                    {
                        sbCondition.Append($" AND \"IMEI\" LIKE \"{imei}%\"");
                    }
                }

                if (pas.ContainsKey("StartTime"))
                {
                    string begintime = pas["StartTime"].Value<string>();
                    if (DateTime.TryParse(begintime, out _))
                    {
                        sbCondition.Append($" AND \"CreateTime\" >= \"{begintime}\"");
                    }
                }
                if (pas.ContainsKey("EndTime"))
                {
                    string endtime = pas["EndTime"].Value<string>();
                    if (DateTime.TryParse(endtime, out _))
                    {
                        sbCondition.Append($" AND \"CreateTime\" <= \"{endtime}\"");
                    }
                }

                if (pas.ContainsKey("ID"))
                {
                    int id = pas["ID"].Value<int>();
                    if (id > 0)
                    {
                        sbCondition.Append($" AND \"ID\" = {id}");
                    }
                }

                devs = EntityHelp.GetObjectList<Device>($"SELECT * FROM \"public\".\"Device\" WHERE {sbCondition}  ORDER BY \"CreateTime\" DESC LIMIT {ps} OFFSET {ps * (pi - 1)}");
                total = (int)(long)DbHelper.ExecuteScalar($"SELECT COUNT(*) FROM \"public\".\"Device\" WHERE {sbCondition}");
                count = (total % ps) == 0 ? total / ps : (total / ps + 1);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}
