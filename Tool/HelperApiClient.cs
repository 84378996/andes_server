using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace Tool
{
    public class HelperApiClient
    {


        private static HelperApiClient uniqueInstance;

        private HelperApiClient()
        {

        }
        public static HelperApiClient Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new HelperApiClient();
                }
                return uniqueInstance;
            }
        }

        private string _token = "";
        private readonly int _timeout = 60 * 1000;

        public string Host { get; set; }

        public ResponseObject ExecutePost(RequestObject request, string route)
        {
            try
            {
                string content = request.ToString();
                string requrl = Host + route;

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(requrl);

                req.ServicePoint.Expect100Continue = false;
                req.Method = "POST";
                req.KeepAlive = true;
                req.UserAgent = "Top4Net";
                req.Timeout = _timeout;

                req.ContentType = "application/json;charset=utf-8";
                req.Headers.Add("Authorization", "bearer " + _token);

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

                ResponseObject response = JsonConvert.DeserializeObject<ResponseObject>(result);
                return response;
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError)
                {
                    RefreshToken();
                }

                throw ex;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ResponseObject ExecutePost(string route)
        {
            try
            {
                string content = "";
                string requrl = Host + route;

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(requrl);

                req.ServicePoint.Expect100Continue = false;
                req.Method = "POST";
                req.KeepAlive = true;
                req.UserAgent = "Top4Net";
                req.Timeout = _timeout;

                req.ContentType = "application/json;charset=utf-8";
                req.Headers.Add("Authorization", "bearer " + _token);

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

                ResponseObject response = JsonConvert.DeserializeObject<ResponseObject>(result);
                return response;
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError)
                {
                    RefreshToken();
                }

                throw ex;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ResponseObject ExecuteGet(string route)
        {
            try
            {
                string requrl = Host + route;


                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(requrl);

                req.ServicePoint.Expect100Continue = false;
                req.Method = "GET";
                req.KeepAlive = true;
                req.UserAgent = "Top4Net";
                req.Timeout = _timeout;

                req.ContentType = "application/json;charset=utf-8";
                req.Headers.Add("Authorization", "bearer " + _token);

                HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();

                Stream rspStream = req.GetResponse().GetResponseStream();

                string result;
                using (StreamReader sr = new StreamReader(rspStream))
                {
                    result = sr.ReadToEnd();
                }

                ResponseObject response = JsonConvert.DeserializeObject<ResponseObject>(result);
                return response;
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError)
                {
                    RefreshToken();
                }
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void RefreshToken()
        {
            string requrl = Host + "/api/token";
            try
            {
                string content = "grant_type=password&username=mscapiadmin&password=123456";
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(requrl);

                req.ServicePoint.Expect100Continue = false;
                req.Method = "POST";
                req.KeepAlive = true;
                req.UserAgent = "Top4Net";
                req.Timeout = _timeout;
                req.ContentType = "application/x-www-form-urlencoded";

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

                JObject o = JObject.Parse(result);
                //通过属性名或者索引来访问，仅仅是自己的属性名，而不是所有的
                JToken jtoken = o["access_token"];
                _token = jtoken.ToString();
            }
            catch (WebException e1)
            {
                HelperLog.Error(e1);
                //throw ex;
            }
            catch (Exception e2)
            {
                HelperLog.Error(e2);
                //throw ex;
            }
        }


    }
}
