using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class MarkerData
    {
        /// <summary>
        /// 设备状态
        /// </summary>
        public string DevStatus { get; set; }
        /// <summary>
        /// 设备模式
        /// </summary>
        public int DevMode { get; set; }

        /// <summary>
        /// 当前打码程序
        /// </summary>
        public string CurrentProg { get; set; }

        /// <summary>
        /// 运行累计时间
        /// </summary>
        public double RunTotalTime { get; set; }

        /// <summary>
        /// 故障累计时间
        /// </summary>
        public double RunFaultTime { get; set; }

        /// <summary>
        /// 待机累计时间
        /// </summary>
        public double RunStandbyTime { get; set; }

        /// <summary>
        /// 工作累计时间
        /// </summary>
        public double RunWorkingTime { get; set; }

        /// <summary>
        /// 实时电表度数
        /// </summary>
        public double PowerReal { get; set; }
        /// <summary>
        /// 日耗电度数
        /// </summary>
        public double PowerDay { get; set; }
        /// <summary>
        /// 月耗电度数
        /// </summary>
        public double PowerMonth { get; set; }
        /// <summary>
        /// 年耗电度数
        /// </summary>
        public double PowerYear { get; set; }

        /// <summary>
        /// 日钢板数量
        /// </summary>
        public int SteelDay { get; set; }
        /// <summary>
        /// 月钢板数量
        /// </summary>
        public int SteelMonth { get; set; }
        /// <summary>
        /// 年钢板数量
        /// </summary>
        public int SteelYear { get; set; }

        /// <summary>
        /// 日喷码数量
        /// </summary>
        public int CodeDay { get; set; }

        /// <summary>
        /// 月喷码数量
        /// </summary>
        public int CodeMonth { get; set; }

        /// <summary>
        /// 年喷码数量
        /// </summary>
        public int CodeYear { get; set; }


        /// <summary>
        /// 日喷码OK数量
        /// </summary>
        public int CodeOkDay { get; set; }

        /// <summary>
        /// 月喷码OK数量
        /// </summary>
        public int CodeOkMonth { get; set; }

        /// <summary>
        /// 年喷码OK数量
        /// </summary>
        public int CodeOkYear { get; set; }


        /// <summary>
        /// 日喷码NG数量
        /// </summary>
        public int CodeNgDay { get; set; }

        /// <summary>
        /// 月喷码NG数量
        /// </summary>
        public int CodeNgMonth { get; set; }

        /// <summary>
        /// 年喷码NG数量
        /// </summary>
        public int CodeNgYear { get; set; }


        /// <summary>
        /// 单张钢板已打码数量
        /// </summary>
        public int PlateCodeTotal { get; set; }
        /// <summary>
        /// 单张钢板已打码OK数量
        /// </summary>
        public int PlateCodeOk { get; set; }
        /// <summary>
        /// 单张钢板已打码NG数量
        /// </summary>
        public int PlateCodeNg { get; set; }
        /// <summary>
        /// 单张钢板打码耗时（秒）
        /// </summary>
        public double PlateCodeUse { get; set; }

        /// <summary>
        /// 当日打码OK良率
        /// </summary>
        public double RateCurrentDay { get; set; }
        /// <summary>
        /// 当月打码OK良率
        /// </summary>
        public double RateCurrentMonth { get; set; }
        /// <summary>
        /// 当年打码OK良率
        /// </summary>
        public double RateCurrentYear { get; set; }
        /// <summary>
        /// 当张打码OK良率
        /// </summary>
        public double RateCurrentPlate { get; set; }

        /// <summary>
        /// 日钢板打码耗时
        /// </summary>
        public double UseTimeDay { get; set; }
        /// <summary>
        /// 月钢板打码耗时
        /// </summary>
        public double UseTimeMonth { get; set; }
        /// <summary>
        /// 年钢板打码耗时
        /// </summary>
        public double UseTimeYear { get; set; }

        public List<AlarmData> Errors { get; set; }

        public DateTime? CreateTime { get; set; }

        public MarkerData()
        {
            Errors = new List<AlarmData>();
        }

    }
}
