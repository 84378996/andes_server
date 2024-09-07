using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class RequestObject
    {
        public string Params { get; set; }

        public long? OperID { get; set; }

        public JObject Data { get; set; }

        public JArray Array { get; set; }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented, JsonSettings.settings);
        }

    }
}
