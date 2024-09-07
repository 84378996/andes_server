using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Tool
{
    public class HelperJson
    {


        private static HelperJson uniqueInstance;

        private HelperJson()
        {

        }
        public static HelperJson Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new HelperJson();
                }
                return uniqueInstance;
            }
        }

        private const int _timeout = 60 * 1000;


        public JObject ExecutePost(JsonRequestObj request, string url)
        {
            try
            {
                string content = request.ToJson();
                string requrl = url;

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(requrl);

                req.ServicePoint.Expect100Continue = false;
                req.Method = "POST";
                req.KeepAlive = true;
                req.UserAgent = "Top4Net";
                req.Timeout = _timeout;

                req.ContentType = "application/json;charset=utf-8";
                //req.Headers.Add("Authorization", "bearer " + Token);

                byte[] postData = Encoding.UTF8.GetBytes(content);
                req.ContentLength = postData.Length;
                Stream reqStream = req.GetRequestStream();
                reqStream.Write(postData, 0, postData.Length);
                reqStream.Close();


                HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();

                Stream rspStream = req.GetResponse().GetResponseStream();

                string result;
                using (StreamReader sr = new StreamReader(rspStream))
                {
                    result = sr.ReadToEnd();
                }

                //ResponseObject response = JsonConvert.DeserializeObject<ResponseObject>(result);
                JObject response = JObject.Parse(result);
                return response;
            }
            catch (WebException ex)
            {
                HelperLog.Error("Error:" + ex.Message + " ExecutePost方法" + "name:" + request.name + ", URL:" + url);
                throw ex;
                //JObject response = new JObject();
                //response.Add("code",ErrorCode.Parameter);
                //response.Add("WebExceptionStatus", (int)ex.Status);
                //response.Add("WebException", ex.Message); 
                //return response;
            }
            catch (Exception ex)
            {
                HelperLog.Error("Error:" + ex.Message + " ExecutePost方法" + "name:" + request.name + ", URL:" + url);
                throw ex;
                //JObject response = new JObject();
                //response.Add("code", ErrorCode.Parameter);
                //response.Add("Exception", ex.Message);
                //return response;
            }
        }
        public bool IsRetCodeSuccess(JObject ret)
        { 
            bool retCode = false;
            //HelperLog.Info(ret.ToString());
            if (ret.ContainsKey("code")) 
            { 
                if (ret["code"].ToString() == MsgCode.OK)
                {
                    retCode = true;
                }
            }
            return retCode;
        }
        public bool JsonParse(string content,out JObject obj)
        {
            try
            {
                obj = (JObject)JsonConvert.DeserializeObject(content);
                return true;
            }
            catch (JsonReaderException)
            {
                obj = null;
                return false;
            }
        }

    }
}
