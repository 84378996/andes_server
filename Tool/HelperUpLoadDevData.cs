using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace Tool
{
    public class HelperUpLoadDevData
    {
        readonly object _lockpool = new object();

        List<DevRealData> Datas = new List<DevRealData>();

        public void Push(DevRealData data)
        {
            lock (_lockpool)
            {
                Datas.Add(data);
            }
        }

        public List<DevRealData> Peek()
        {
            List<DevRealData> list = new List<DevRealData>();

            lock (_lockpool)
            {
                foreach (DevRealData item in Datas)
                {
                    list.Add(item);
                    if (list.Count > 20)
                        break;
                }
            }
            return list;
        }

        public void Delete(int count)
        {
            lock (_lockpool)
            {
                Datas.RemoveRange(0, count);
            }
        }
    }
}
