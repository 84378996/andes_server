using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class MsgCode
    {
        /// <summary>
        /// OK
        /// </summary>
        public const string OK = "0";
        public const string OKMsg = "OK";
        /// <summary>
        /// 请求参数异常
        /// </summary>
        public const string ReqException = "1001";
        public const string ReqExceptionMsg = "请求参数异常";
        /// <summary>
        /// 响应参数异常
        /// </summary>
        public const string RspException = "1002";
        public const string RspExceptionMsg = "响应参数异常";
        /// <summary>
        /// 参数异常
        /// </summary>
        public const string Parameter = "1003";
        public const string ParameterMsg = "参数异常";


        /// <summary>
        /// 文件异常
        /// </summary>
        public const string FileException = "1009";
        public const string FileExceptionMsg = "文件异常";


        /// <summary>
        /// 操作数据库出现错误
        /// </summary>
        public const string DBException = "1104";
        public const string DBExceptionMsg = "操作数据库出现错误";


        /// <summary>
        /// 其他错误
        /// </summary>
        public const string Other = "1105";
        public const string OtherMsg = "其他错误";

        /// <summary>
        /// 操作等待中
        /// </summary>
        public const string Waiting = "1106";
        public const string WaitingMsg = "操作等待中";

        /// <summary>
        /// 超时
        /// </summary>
        public const string TimeOut = "1107";
        public const string TimeOutMsg = "超时";

        /// <summary>
        /// 服务器配置异常
        /// </summary>
        public const string ApiConfig = "1108";
        public const string ApiConfigMsg = "服务器配置异常";

        /// <summary>
        /// 已存在
        /// </summary>
        public const string AlreadyExists = "1109";
        public const string AlreadyExistsMsg = "已存在";


        /// <summary>
        /// 没有权限
        /// </summary>
        public const string NoPermission = "1110";
        public const string NoPermissionMsg = "没有权限";

        
    }
}
