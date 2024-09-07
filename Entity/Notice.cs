using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{

    public enum NoticeType : int
    {
        /// <summary>
        /// 系统提醒
        /// </summary>
        Info = 1,

        /// <summary>
        /// 报警
        /// </summary>
        Warning = 2,

        /// <summary>
        /// 错误
        /// </summary>
        Error = 3,

        /// <summary>
        /// 设备报警
        /// </summary>
        DevWarning = 4,
    }
    public enum NoticeStatus : int
    {

        /// <summary>
        /// 无效
        /// </summary>
        Invalid = -1,

        /// <summary>
        /// 初始化
        /// </summary>
        Init = 0,


        /// <summary>
        /// 已处理
        /// </summary>
        Handled = 1,

        /// <summary>
        /// 超时
        /// </summary>
        TimeOut = 2,





    }
    public class Notice
    {
        public long? ID { get; set; }
        public int? Status { get; set; }
        public int? Type { get; set; }
        public string Remark { get; set; }
        public string Title { get; set; }
        public long? SendID { get; set; }
        public long? RecvID { get; set; }
        public DateTime? AddTime { get; set; }
        public string Param { get; set; }
        public string Identifier { get; set; }
        public long? DevID { get; set; }
        public string DevName { get; set; }
    }
}
