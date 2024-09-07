using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MCSService
{
    class Program
    {
        static void Main(string[] args)
        {

            //服务入口
            //ServiceBase[] ServicesToRun;
            //ServicesToRun = new ServiceBase[]
            //{
            //    new FarleyFNCService()
            //};
            //ServiceBase.Run(ServicesToRun);


            //#region //控制台入口

            //MainOperate.Instance.Start();

            //while (Console.ReadKey().Key == ConsoleKey.Enter)
            //{
            //    //回车退出
            //    break;
            //}
            ////关于C#控制台程序点击后暂停工作，控制台右键-属性，取消快速编辑模式QuickEdit Mode
            //MainOperate.Instance.Stop();
            //#endregion

            #region 使用互斥量防止多开程序
            bool createNew;

            // createdNew:
            // 在此方法返回时，如果创建了局部互斥体（即，如果 name 为 null 或空字符串）
            // 或指定的命名系统互斥体，则包含布尔值 true；
            // 如果指定的命名系统互斥体已存在，则为false
            using (Mutex mutex = new Mutex(true, Application.ProductName, out createNew))
            {
                if (createNew)
                {
                    MainOperate.Instance.Start();

                    while (Console.ReadKey().Key == ConsoleKey.Enter)
                    {
                        //回车退出
                        break;
                    }
                    //关于C#控制台程序点击后暂停工作，控制台右键-属性，取消快速编辑模式QuickEdit Mode
                    MainOperate.Instance.Stop();
                }
                // 程序已经运行的情况，则弹出消息提示并终止此次运行
                else
                {
                    MessageBox.Show("应用程序已经在运行中...");
                    System.Threading.Thread.Sleep(1000);

                    // 终止此进程并为基础操作系统提供指定的退出代码。
                    System.Environment.Exit(1);
                }
            }
            #endregion


        }
    }
}
