using MCSService.DAL;
using MCSService.Global;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Tool;

namespace MCSService
{
    public class MainOperate
    {
        System.Timers.Timer _timerTask;
        private static MainOperate _instance = null;
        public static MainOperate Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new MainOperate();
                return _instance;
            }
        }

        public void Start()
        {
            HelperLog.Info("服务正在启动...");

            Task.Run(() =>
            {

                try
                {
                    HelperLog.Info("正在初始化...");
                    string _filename = System.AppDomain.CurrentDomain.BaseDirectory + "config.ini";
                    HelperConfig.Instance.ReadConfig(_filename);
                    //启动服务
                    Api.WebServer.Instance.Start();


                   
                    UserGlobal.Instance.Refresh();
                    RoleGlobal.Instance.Refresh();


                   

                    _timerTask = new System.Timers.Timer(60);
                    _timerTask.Elapsed += TimerTask_Elapsed;
                    _timerTask.AutoReset = true;
                    _timerTask.Enabled = true;

                    HelperLog.Info("初始化完成");
                }
                catch (Exception ex)
                {
                    HelperLog.Error(ex, "服务启动失败");
                }

            });
        }



        public void Stop()
        {
            try
            {
                if (_timerTask != null)
                    _timerTask.Stop();

               

                Api.WebServer.Instance.Stop();

            }
            catch (Exception ex)
            {
                HelperLog.Error(ex);
            }
            // TODO: 在此处添加代码以执行停止服务所需的关闭操作。
            HelperLog.Info("服务停止...");
        }

        private void TimerTask_Elapsed(object source, System.Timers.ElapsedEventArgs e)
        {
            if (_timerTask.Interval == 60)
            {
                _timerTask.Interval = 60 * 60 * 1000;
            }

            HelperLog.Info("正在执行系统定时任务....");
            try
            {

                //清除日志等文件
                string folder = string.Format("{0}\\Error", PathGlobal.Log);
                HelperFile.ClearFile(folder, 60 * 24 * 30);
                folder = string.Format("{0}\\Info", PathGlobal.Log);
                HelperFile.ClearFile(folder, 60 * 24);
                folder = string.Format("{0}\\Warn", PathGlobal.Log);
                HelperFile.ClearFile(folder, 60 * 24 * 30);

                //清除验证码文件
                folder = PathGlobal.ImageCode;
                HelperFile.ClearFile(folder, 5);

                //清除临时文件
                folder = PathGlobal.Temp;
                HelperFile.ClearFile(folder, 60);

                DALDatabase dal = new DALDatabase();

                //创建数据表
                //当月
                //dal.CreateTable(DateTime.Now.ToString("yyyyMM"));
                //下月
                //dal.CreateTable(DateTime.Now.AddMonths(1).ToString("yyyyMM"));

                //删除
                //dal.DeleteTable();

                //RefreshReport

            }
            catch (Exception ex)
            {
                HelperLog.Error(ex);
            }
            HelperLog.Info("系统定时任务结束");
        }



    }
}
