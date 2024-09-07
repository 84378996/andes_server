using Microsoft.Owin.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool;

namespace MCSService.Api
{
    public class WebServer
    {

        private WebServer()
        { }

        private static WebServer _instance;

        public static WebServer Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new WebServer();
                return _instance;
            }
        }

        IDisposable _server = null;


        public void Start()
        {
            try
            {
                //初始化StartOptions参数
                StartOptions options = new StartOptions();

                //服务器Url设置
                options.Urls.Add(string.Format("http://{0}:{1}/",
                  HelperConfig.Instance.AppServer_Domain, HelperConfig.Instance.AppServer_Port));
                _server = WebApp.Start<Startup>(options);


                HelperLog.Info(string.Format("{0} 服务已启动", options.Urls[0]));
            }
            catch (Exception ex)
            {
                HelperLog.Error(string.Format("http://{0}:{1} 服务启动失败", HelperConfig.Instance.AppServer_Domain, HelperConfig.Instance.AppServer_Port));
                HelperLog.Error(ex.Message);
            }
        }

        public void Stop()
        {

            if (_server != null)
                _server.Dispose();

            HelperLog.Info("Web api 停止");
        }
    }

}
