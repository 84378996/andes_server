using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Entity
{
    public class QueueInfoRequest
    {
        public DateTime CmdTime { get; set; }
        public JsonRequestObj CmdRequest { get; set; }
        public string Url { get; set; }
        public string Cmd { get; set; }
    }


    public class JsonRequestObj
    {
        public JsonRequestObj()
        {
            id = Guid.NewGuid().ToString();
            timestamp = DateTimeOffset.Now.ToUnixTimeSeconds();
            data = new JObject();
        }
        public string id { get ; set; }
        public string name { get; set; }
        public long timestamp { get; set; }
        public JObject data { get; set; }
        public string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented, JsonSettings.settings);
        }
        public bool Parse(string req)
        { 
            bool result = false;
            if(string.IsNullOrWhiteSpace(req)) return result;

            JObject keyValuePairs = JObject.Parse(req);
            id = keyValuePairs.Value<string>("id");
            name = keyValuePairs.Value<string>("name");
            timestamp = keyValuePairs.Value<long>("timestamp");
            data = keyValuePairs.Value<JObject>("data");
            if (id == null || name == null || timestamp == null) return result;
            if (data == null) return result;

            result = true;

            return result;
        }
    }
}
