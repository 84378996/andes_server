using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Entity;

namespace Tool
{
    public class HelperQueueInfoRequest
    {
        private HelperQueueInfoRequest() 
        { 
        }

        #region//单例
        private static HelperQueueInfoRequest uniqueInstance;

        public static HelperQueueInfoRequest Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new HelperQueueInfoRequest();
                }
                return uniqueInstance;
            }
        }
        #endregion

        private Queue<QueueInfoRequest> ListQueue = new Queue<QueueInfoRequest>();

        public void AddQueue(DateTime dt, JsonRequestObj RequestObj) //入列
        {
            QueueInfoRequest queueinfo = new QueueInfoRequest();

            queueinfo.CmdTime = DateTime.Now;
            queueinfo.CmdRequest = RequestObj;
            ListQueue.Enqueue(queueinfo);

            Console.WriteLine($"添加任务RequestObj{RequestObj.name}");
        }

        public void Start()//启动
        {
            Thread thread = new Thread(threadStart);
            thread.IsBackground = true;
            thread.Start();
        }

        AutoResetEvent wmsRequestDone = new AutoResetEvent(false);
        public void SetLastDone()
        {
            wmsRequestDone.Set();
        }
        private void threadStart()
        {
            while (true)
            {
                if (ListQueue.Count > 0)
                {
                    try
                    {
                        ScanQueue();
                    }
                    catch (Exception ex)
                    {
                        HelperLog.Info(ex.Message+ex.StackTrace);
                    }
                }
                else
                {
                    //没有任务，休息3秒钟
                    Thread.Sleep(3000);
                }
            }
        }

        //要执行的方法
        private void ScanQueue()
        {
            while (ListQueue.Count > 0)
            {
                try
                {
                    wmsRequestDone.WaitOne();
                    Console.WriteLine("等待500执行下一个任务");
                    Thread.Sleep(500);
                    //从队列中取出
                    QueueInfoRequest queueinfo = ListQueue.Dequeue();

                    Console.WriteLine(queueinfo.CmdRequest.ToJson());
                    //取出的queueinfo就可以用了，里面有你要的东西
                    //以下就是处理程序了
                    //。。。。。。

                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }


    }
}
