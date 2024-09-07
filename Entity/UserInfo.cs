using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public partial class UserInfo
    {
        public long? ID { get; set; }

        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 用户密码
        /// </summary>
        public string Pwd { get; set; }

        /// <summary>
        /// 电话
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 角色
        /// </summary>
        public long? RoleID { get; set; }


        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? AddTime { get; set; }

        /// <summary>
        /// 最后更新时间
        /// </summary>
        //public DateTime? UpdateTime { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 启用/禁用
        /// </summary>
        public int? Enabled { get; set; }

        /// <summary>
        /// 部门 
        /// </summary>
        public string Department { get; set; }

        /// <summary>
        /// 头像文件名
        /// </summary>
        public string AvatarName { get; set; }


        /// <summary>
        /// 设备上对应的用户名，（部分设备，用户名和系统用户不对应，用于绑定设备用户)
        /// </summary>
        public string DevUser { get; set; }

        /// <summary>
        /// 工号
        /// </summary>
        public string JobNumber { get; set; }
    }

    public partial class UserInfo
    {

        public string RoleName { get; set; }


        /// <summary>
        /// 头像下载地址
        /// </summary>
        public string AvatarHttp { get; set; }


        public List<Purview> Menus { get; set; }

    }



    public class UserComparer : IComparer<UserInfo>
    {
        public int Compare(UserInfo x, UserInfo y)
        {
            if (x.ID > y.ID)
                return 1;
            else if (x.ID < y.ID)
                return -1;
            return 0;
        }
    }
}
