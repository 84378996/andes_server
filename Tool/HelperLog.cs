using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

[assembly: log4net.Config.XmlConfigurator(ConfigFile = "Log4Net.config", Watch = true)]
namespace Tool
{
    public class HelperLog
    {

        //选择<logger name="loginfo">的配置 
        private static log4net.ILog loginfo;
        //选择<logger name="logerror">的配置 
        private static log4net.ILog logerror;
        //选择<logger name="logerror">的配置 
        private static log4net.ILog logwarn;

        public static void Error(string msg)
        {
            Console.WriteLine(string.Format("【{0}】{1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), msg));
            if (logerror == null)
                logerror = log4net.LogManager.GetLogger("logerror");

            if (logerror.IsErrorEnabled)
                logerror.Error(msg);

        }

        public static void Error(Exception ex)
        {
            Console.WriteLine(string.Format("【{0}】{1}；{2}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), ex.Message, ex.StackTrace));
            if (logerror == null)
                logerror = log4net.LogManager.GetLogger("logerror");

            if (logerror.IsErrorEnabled)
                logerror.Error(ex.StackTrace + "\r\n" + ex.Message);

        }

        public static void Error(Exception ex, string extra)
        {
            Console.WriteLine(string.Format("【{0}】{1}；{2}；{3}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), extra, ex.Message, ex.StackTrace));
            if (logerror == null)
                logerror = log4net.LogManager.GetLogger("logerror");

            if (logerror.IsErrorEnabled)
                logerror.Error(ex.StackTrace + "\r\n" + ex.Message);

        }

        public static void Info(string msg)
        {
            Console.WriteLine(string.Format("【{0}】{1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), msg));
            if (loginfo == null)
                loginfo = log4net.LogManager.GetLogger("loginfo");

            if (loginfo.IsInfoEnabled)
                loginfo.Info(msg);

        }

        public static void Warn(string msg)
        {
            Console.WriteLine(string.Format("【{0}】{1}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), msg));
            if (logwarn == null)
                logwarn = log4net.LogManager.GetLogger("logwarn");

            if (logwarn.IsWarnEnabled)
                logwarn.Warn(msg);

        }

    }
}
