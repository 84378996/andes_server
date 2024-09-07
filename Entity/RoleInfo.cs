using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class PurviewKey
    {
        public const string Gets = "Gets";
        public const string Export = "Export";
        public const string Add = "Add";
        public const string Modify = "Modify";
        public const string Delete = "Delete";
        public const string Price = "Price";
        public const string Menu = "Menu";
        public const string Execute = "Execute";
    }


    public class Purview
    {
        public string Label { get; set; }

        public string Key { get; set; }

        public string Value { get; set; }

        public List<Purview> Children { get; set; }
    }



    public partial class RoleInfo
    {
        public long? ID { get; set; }

        /// <summary>
        /// 角色名称
        /// </summary>
        public string RoleName { get; set; }
        /// <summary>
        /// 启用/禁用
        /// </summary>
        public int? Enabled { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? AddTime { get; set; }

        public string Remark { get; set; }


        public string Purview { get; set; }

        public string Menu { get; set; }

    }

    public partial class RoleInfo
    {

        public List<string> MenuList { get; set; }


        /// <summary>
        /// 权限编号
        /// </summary>
        public List<string> PurviewList { get; set; }


    }
}
