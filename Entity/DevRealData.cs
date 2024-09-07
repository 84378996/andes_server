using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class DevRealData
    {
        public long? ID { get; set; }
        public string DevName { get; set; }
        public long? DevID { get; set; }
        public string Value1 { get; set; }
        public string Value2 { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? AddTime { get; set; }
    }
}
