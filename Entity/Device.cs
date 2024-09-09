using DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    ///<summary>
    /// Device Data Structure
    ///</summary>
    [DbSchema("public","Device")]
    public class Device
    {
        ///<summary>
        /// 主键
        ///</summary>
        [DbField(true, true)]
        public Nullable<Int32> ID { get; set; }

        ///<summary>
        /// 设备型号
        ///</summary>
        [DbField]
        public String DeviceNo { get; set; }

        ///<summary>
        /// 设备名称
        ///</summary>
        [DbField]
        public String DeviceName { get; set; }

        ///<summary>
        /// imei码
        ///</summary>
        [DbField]
        public String IMEI { get; set; }

        ///<summary>
        /// 添加时间
        ///</summary>
        [DbField]
        public Nullable<DateTime> CreateTime { get; set; }

        ///<summary>
        /// 0,未删除（默认），1已删除
        ///</summary>
        [DbField]
        public Nullable<Int16> Deleted { get; set; }

        ///<summary>
        /// 气体单位 0(%LEL)，1(PPM)，2(%VOL)
        ///</summary>
        [DbField]
        public Nullable<Int16> Unit { get; set; }

        ///<summary>
        /// 显示精度，0（浓度值*1），1（浓度值*0.1），2（浓度值*0.01）， 3（浓度值*0.001）
        ///</summary>
        [DbField]
        public Nullable<Int16> JD { get; set; }

        ///<summary>
        /// 低报值
        ///</summary>
        [DbField]
        public Nullable<Int16> ThresholdMin { get; set; }

        ///<summary>
        /// 高报值
        ///</summary>
        [DbField]
        public Nullable<Int16> ThresholdMax { get; set; }

        ///<summary>
        /// 浓度值
        ///</summary>
        [DbField]
        public Nullable<Int16> TheValue { get; set; }

        ///<summary>
        /// 最近采集数据时间
        ///</summary>
        [DbField]
        public Nullable<DateTime> LastRecordTime { get; set; }

        public string CurrentValue 
        {
            get 
            {
                double val = TheValue.GetValueOrDefault();
                if (JD == 1)
                    val *= 0.1;
                else if (JD == 2)
                    val *= 0.01;
                else if (JD == 3)
                    val *= 0.001;

                if (Unit == 1)
                    return $"{val:F2}(PPM)";
                else if (Unit == 2)
                    return $"{val:F2}(%VOL)";
                return $"{val:F2}(%LEL)";
            }
        }

        public string OnlineStatus
        {
            get
            {
                var ts = DateTime.Now - LastRecordTime.GetValueOrDefault();
                if (ts.TotalMinutes >= 30)
                    return "离线";
                return "在线";
            }
        }
    }
}
