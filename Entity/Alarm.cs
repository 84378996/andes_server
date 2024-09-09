using DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    ///<summary>
    /// Alarm Data Structure
    ///</summary>
    [DbSchema("public","Alarm")]
    public class Alarm
    {
        ///<summary>
        /// 主键
        ///</summary>
        [DbField(true,true)]
        public Nullable<Int32> ID { get; set; }

        ///<summary>
        /// 设备Id
        ///</summary>
        [DbField]
        public Nullable<Int32> DeviceID { get; set; }

        ///<summary>
        /// 设备名称
        ///</summary>
        [DbField]
        public String DeviceName { get; set; }

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
        /// 报警时间
        ///</summary>
        [DbField]
        public Nullable<DateTime> AlarmTime { get; set; }

    }
}
