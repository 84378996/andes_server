using Entity;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperDevClient
    {
        private static HelperDevClient uniqueInstance;

        private HelperDevClient()
        {

        }
        public static HelperDevClient Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new HelperDevClient();
                }
                return uniqueInstance;
            }
        }


        private const int _timeout = 60 * 1000;

        public JObject ExecutePost(string url)
        {
            try
            {
                string content = "";
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
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public JObject ExecutePost(RequestObject request, string url)
        {
            try
            {
                string content = request.ToString();
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
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public JObject ExecuteGet(string url)
        {
            string requrl = url;

            try
            {
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(requrl);

                req.ServicePoint.Expect100Continue = false;
                req.Method = "GET";
                req.KeepAlive = true;
                req.UserAgent = "Top4Net";
                req.Timeout = _timeout;

                req.ContentType = "application/json;charset=utf-8";
                //req.Headers.Add("Authorization", "bearer " + Token);

                HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();

                Stream rspStream = req.GetResponse().GetResponseStream();

                string result;
                using (StreamReader sr = new StreamReader(rspStream))
                {
                    result = sr.ReadToEnd();
                }
                JObject response = JObject.Parse(result);
                //ResponseObject response = JsonConvert.DeserializeObject<ResponseObject>(result);
                return response;
            }
            catch (WebException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
