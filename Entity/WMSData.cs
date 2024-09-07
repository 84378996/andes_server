using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{

    public partial class WMSData
    {
        public const int CellCount = 91;
        public string DevStatus { get; set; }
        public string DevMode { get; set; }
        public List<AlarmData> Errors { get; set; }
        public List<WMSCell> Cells { get; set; }
        public WMSData()
        {
            Errors = new List<AlarmData>();
            Cells = new List<WMSCell>();
        }
    }

    public enum BoxType :int
    {
        empty = 0,
        raw,
        surplus,
        finished
    }

    public class WMSCell
    {
        public int? column { get; set; }
        public int? row { get; set; }
        public string material { get; set; }
        public string length { get; set; }
        public string width { get; set; }
        public string thickness { get; set; }
        public int num { get; set; }
        /// <summary>
        /// 成品 余料 原材料
        /// </summary>
        public int? type { get; set; }
    }

    //public class WMSData : IAlarm
    //{
    //    public WMSCell curPallet_1 { get; set; }
    //    public WMSCell curPallet_2 { get; set; }
    //    public List<WMSCell> Cells { get; set; }
    //    public List<AlarmData> Errors { get; set; }

    //}
}
