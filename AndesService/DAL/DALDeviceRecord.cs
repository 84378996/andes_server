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
    internal class DALDeviceRecord
    {
        internal bool Get(JObject pas, out List<Record> devs, out int pi, out int ps, out int total, out int count)
        {
            pi = 0;
            ps = 0;
            total = 0;
            count = 0;
            devs = new List<Record>();
            StringBuilder sbCondition = new StringBuilder();
            sbCondition.Append(" 1=1 ");
            try
            {
                pi = pas["PageIndex"].Value<int>();
                ps = pas["PageSize"].Value<int>();

                if (pas.ContainsKey("DeviceNo"))
                {
                    string devName = pas["DeviceNo"].Value<string>();
                    if (!string.IsNullOrWhiteSpace(devName))
                    {
                        sbCondition.Append($" AND \"DeviceNo\" LIKE \"%{devName}%\"");
                    }
                }

if (pas.ContainsKey("DeviceID"))
                {
                    int devID = pas["DeviceID"].Value<int>();
                    if (devID> 0)
                    {
                        sbCondition.Append($" AND \"DeviceID\" = {devID}");
                    }
                }

                if (pas.ContainsKey("StartTime"))
                {
                    string begintime = pas["StartTime"].Value<string>();
                    if (DateTime.TryParse(begintime, out _))
                    {
                        sbCondition.Append($" AND \"RecordTime\" >= \"{begintime}\"");
                    }
                }
                if (pas.ContainsKey("EndTime"))
                {
                    string endtime = pas["EndTime"].Value<string>();
                    if (DateTime.TryParse(endtime, out _))
                    {
                        sbCondition.Append($" AND \"RecordTime\" <= \"{endtime}\"");
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

                devs = EntityHelp.GetObjectList<Record>($"SELECT * FROM \"public\".\"Record\" WHERE {sbCondition}  ORDER BY \"RecordTime\" DESC LIMIT {ps} OFFSET {ps * (pi - 1)}");
                total = (int)(long)DbHelper.ExecuteScalar($"SELECT COUNT(*) FROM \"public\".\"Record\" WHERE {sbCondition}");
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
