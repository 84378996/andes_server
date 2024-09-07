using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Entity
{
    public class JsonResponseObj
    {
        public JsonResponseObj()
        {
            code = MsgCode.OK;
            message = MsgCode.OKMsg;
            timestamp = DateTimeOffset.Now.ToUnixTimeSeconds();
            success = true;
        }

        public long timestamp { get; set; }
        public string code { get; set; }
        public string message { get; set; }
        public bool success { get; set; }
        public JObject data { get; set; }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented, JsonSettings.settings);
        }
    }
}
