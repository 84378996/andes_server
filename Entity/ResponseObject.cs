using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class ResponseObject
    {
        public ResponseObject()
        {
            Code = "0";
        }

        /// <summary>
        /// 代码
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// 消息文本
        /// </summary>
        public string Msg { get; set; }

        public JObject Data { get; set; }

        public JArray Array { get; set; }
        public bool Succeed
        {
            get
            {
                if (string.IsNullOrWhiteSpace(Code) == false)
                {
                    if (Code.CompareTo("0") == 0)
                    {
                        return true;
                    }
                }
                return false;
            }
            set { }
        }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented, JsonSettings.settings);
        }
    }

}
