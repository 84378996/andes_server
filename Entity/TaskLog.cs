using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public partial class TaskLog
    {
        public long? ID { get; set; }

        public long? TaskID { get; set; }

        public long? SendID{get;set;}

        public long? RecvID { get; set; }
        //手自动
        public int? IsAutoMode { get; set; }

        //动作
        public int Action { get; set; }
       

        public string ActionData { get; set; }

        public string Remark { get; set; }

        public DateTime? AddTime { get; set; }

        public int? TaskLine { get; set; }

        public string TaskNo { get; set; }
    }

    //扩展
    public partial class TaskLog
    {
        

        public string TaskLineName { get; set; }

        public string SendName { get; set; }

        public string RecvName { get; set; }

    }


}
