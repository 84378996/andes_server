using DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    ///<summary>
    /// Record Data Structure
    ///</summary>
    [DbSchema("public","Record")]
    public class Record
    {
        ///<summary>
        /// 主键，编号
        ///</summary>
        [DbField(true)]
        public Nullable<Int64> ID { get; set; }

        ///<summary>
        /// 设备ID
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
        /// 数据录入时间
        ///</summary>
        [DbField]
        public Nullable<DateTime> RecordTime { get; set; }

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

    }
}
