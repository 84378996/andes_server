using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB;

namespace Entity
{
    ///<summary>
	/// tb_user Data Structure
	///</summary>
	[DbSchema("public", "User")]
    public class UserInfo
    {
        /// 主键
		///</summary>
		[DbField(true, true)]
        public Nullable<Int32> ID { get; set; }

        ///<summary>
        /// 昵称
        ///</summary>
        [DbField]
        public String Name { get; set; }

        ///<summary>
        /// 登录名
        ///</summary>
        [DbField]
        public String LoginName { get; set; }

        ///<summary>
        /// 密码
        ///</summary>
        [DbField]
        public String Password { get; set; }

        ///<summary>
        /// 用户级别
        ///</summary>
        [DbField]
        public Nullable<Int16> RoleID { get; set; }

        ///<summary>
        /// 注册日期
        ///</summary>
        [DbField]
        public Nullable<DateTime> CreateTime { get; set; }
        public string AvatarHttp { get; set; }
        public string AvatarName { get; set; }
        public int Enabled { get; set; } = 1;

        public string RoleName
        {
            get
            {
                if (RoleID == 999)
                    return "超级管理员";
                else if (RoleID == 99)
                    return "管理员";
                else
                    return "用户";
            }
        }
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
