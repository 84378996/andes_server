using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public partial class AlarmData
    {
        public long? ID { get; set; }
        public long? DevID { get; set; }
        /// <summary>
        /// 报警类型
        /// 注意数据库需要添加，nvarchar(50)
        /// </summary>
        public string AlarmType { get; set; }
        /// <summary>
        /// 报警编码 为了更好的兼容性，此处用string
        /// 注意数据库要修改成varchar(50)
        /// </summary>
        public string AlarmID { get; set; }
        /// <summary>
        /// 报警内容
        /// </summary>
        public string AlarmMessage { get; set; }

        /// <summary>
        /// 维护代码
        /// 注意数据库需要添加，varchar(50)
        /// </summary>
        public string MaintainCode { get; set; }
        
        public DateTime? StartTime { get; set; }
        //public DateTime? AddTime { get; set; }
        public DateTime? EndTime { get; set; }
    }

    //扩展
    public partial class AlarmData
    {
        public string DevName { get; set; }
    }

    public interface IAlarmList
    {
        List<AlarmData> Errors { get; set; }
    }


    public  class AlarmListComparer
    {
        public static bool Equal(IAlarmList data1, IAlarmList data2)
        {
            if (data1 == null || data2 == null)
            {
                return false;
            }


            if (data1.Errors.Count != data2.Errors.Count)
            {
                return false;
            }


            for (int i = 0; i < data1.Errors.Count; i++)
            {
                
                if (data1.Errors[i].AlarmID != data2.Errors[i].AlarmID)
                {
                    return false;
                }
                
            }

            return true;
        }
    }

}
