using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{

    public enum LogType : int
    {

        Add = 1,
        Modify = 2,
        Delete = 3,
        Browser = 4,
        Download = 5,
        Dispatch = 6,
        Login = 7,
        Other = 1000,
    }
    public enum LogStatus : int
    {
        Success = 1,
        Default = 0,
        Fail = -1,
    }

    public enum LogModule : int
    {
        /// <summary>
        /// 用户信息
        /// </summary>
        User = 1,

        /// <summary>
        /// 角色信息
        /// </summary>
        Role = 2,

        /// <summary>
        /// 设备信息
        /// </summary>
        Device = 3,

        /// <summary>
        /// 指令文件
        /// </summary>
        NFile = 4,
        /// <summary>
        /// 设备文件管理
        /// </summary>
        DevFtp = 5,

        /// <summary>
        /// 数据采集
        /// </summary>
        Monitor = 6,

    
        /// <summary>
        /// 生产任务
        /// </summary>
        TaskCutList = 7,

        TaskCut = 8,


        /// <summary>
        /// 字典信息
        /// </summary>
        Dictionary = 9,

        Other = 1000,


    }

    public partial class Log
    {
        public long? ID { get; set; }

        /// <summary>
        ///操作类型  
        /// </summary>
        public int? Type { get; set; }

        /// <summary>
        /// 模块标识
        /// </summary>
        public int? Module { get; set; }


        /// <summary>
        /// 识别标识符
        /// </summary>
        public string Identifier { get; set; }

        /// <summary>
        /// 概述
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 操作员
        /// </summary>
        public long? OperID { get; set; }


        //添加时间
        public DateTime? AddTime { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 操作明细 参数1
        /// </summary>
        public string Param1 { get; set; }

        /// <summary>
        /// 操作明细 参数2
        /// </summary>
        public string Param2 { get; set; }

        public int? Status { get; set; }


        public string UserHostAddress { get; set; }


    }


    public partial class Log
    {

        public string TypeStr { get; set; }

        public string ModuleStr { get; set; }

        public string OperName { get; set; }
    }

}

