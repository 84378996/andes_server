using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public enum TaskListStatus : int
    {
       
        Default = 0, //已添加，未执行
        Active, //已激活
        Start, //已启动


        FeedCompleted,//上料完成
        CutCompleted,//切割完成
        Completed,  //已完成
    }

    public enum TaskCutStatus : int
    {

        Default = 0, //已添加，未执行
        Active, //已激活
        Start, //已启动


        FeedCompleted,//上料完成
        CutCompleted,//切割完成
        Completed,  //已完成
    }


    public enum TaskLine : int
    {
        DevLaser1_1 = 11,
        DevLaser1_2 = 12,
        DevLaser2_1 = 21,
        DevLaser2_2 = 22,
    }

    //任务表(数据库)
    public partial class TaskCutList
    {
        public long? ID { get; set; }
       
        //使用int ，方便数据库快速查询定位
        public int? TaskLine { get; set; }
        
        
        //任务号唯一
        public string TaskNo { get; set; }
        
        //任务添加时间
        public DateTime? AddTime { get; set; }
        //任务开始时间
        public DateTime? StartTime { get; set; }
        //任务结束时间
        public DateTime? FinishTime { get; set; }

        public int? Status { get; set; }

        public string Remark { get; set; }

        //统计用 在完成前实时计算TaskCut表里的数据，完成后，更新此表，直接用于报表统计
        //文件数
        public int? TaskCutCount { get; set; }
        //完成钢板数
        public int? FinishCount { get; set; }
        //所有钢板数
        public int? TotalCount { get; set; }
       

    }

    public partial class TaskCutList
    {  
        public List<TaskCut> TaskCuts { get; set; }
        //切割合计
        public int? CutCount { get; set; }


        //上料合计
        public int? FeedCount { get; set; }
        //已完合计
        public int? TaskCutFinishCount { get; set; }

        //当前切割任务
        public long? CurrentTaskCutID { get; set; }

        public string TaskLineName { get; set; }

        /// <summary>
        /// 发送文件数量
        /// </summary>
        public int? SendFileCount { get; set; }
    }


    //任务明细文件
    public partial class TaskCut
    {
        public long? ID {  get; set; }
        //文件名
        public string TaskName { get; set; }
        //文件完整路径
        public string Path { get; set; }
        public string Material { get;set; }//记得数据库里添加此数据项
        public string Length { get; set; }
        public string Width { get; set; }
        public string Thickness { get; set; }
        //完成数
        public int FinishCount { get; set; }
        //钢板数
        public int TotalCount { get; set; }
        //上料数量
        public int FeedCount { get; set; }
        //切割数量
        public int? CutCount { get; set; }

        public DateTime? AddTime { get; set; }
        //执行开始时间
        public DateTime? StartTime { get; set; }
        //执行结束时间
        public DateTime? FinishTime { get; set; }


        public int Status { get; set; }
     
        //自动情况下，执行顺序
        public int Sort { get; set; }
      
        public long? TaskID { get; set; }

        public string Remark { get; set; }


    }

    //扩展用
    public partial class TaskCut
    {
        /// <summary>
        /// 关联TaskCutList 的 TaskNo
        /// </summary>
        public string TaskNo { get; set; }
        /// <summary>
        /// 关联TaskCutList 的 TaskLine 的Name
        /// </summary>
        public string TaskLineName { get; set; }


        //文件是否已发送
        public bool? IsSendFile { get; set; }
        //打码数量
        public int? MarkCount { get; set; }


        public TaskCut()
        {
            IsSendFile = false;
            MarkCount = 0;
            FeedCount = 0;
            CutCount = 0;
            FinishCount = 0;
        }

    }

}              
