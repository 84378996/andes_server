using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public partial class InfoDevice
    {
        public long? ID { get; set; }
        public string DevName { get; set; }     /// 设备代号
        public string DevText { get; set; }     /// 设备名字
        public string DevType { get; set; }     /// 设备类型
        
        //1:正常  2：维修  3：报废  4：闲置  
        public int? Enabled { get; set; }        /// 1：正常   2：维修中 3：报废  4：闲置 
        public string IP { get; set; }          /// IP地址
                /// 访问监控地址
        public string FtpHost { get; set; }
        public string FtpUser { get; set; }
        public string FtpPwd { get; set; }
        public int? FtpPort { get; set; }
        public DateTime? AddTime { get; set; }
        public long? OperID { get; set; }
        
        public string Remark { get; set; }

        //用于指定Ftp的根目录
        public string FtpRoot { get; set; }
        public bool Test { get; set; }
        public string Url1 { get; set; }
        public string Url2 { get; set; }
        public string Url3 { get; set; }
        public string Url4 { get; set; }

    }

    public partial class InfoDevice
    {
        public string OperName { get; set; }
    }
}
