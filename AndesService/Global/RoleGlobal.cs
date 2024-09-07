using Entity;
using MCSService.Api.BLL;
using MCSService.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool;

namespace MCSService.Global
{
    public class RoleGlobal
    {
        private static RoleGlobal uniqueInstance;

        public static RoleGlobal Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new RoleGlobal();
                }
                return uniqueInstance;
            }

        }

        private RoleGlobal()
        {
            InitPurviews();
            InitMenus();

        }

        public List<Purview> Purviews { get; } = new List<Purview>();

        public List<Purview> Menus { get; } = new List<Purview>();

        private void InitPurviews()
        {
            Purviews.Clear();

            Purview node;
            Purview childNode;
            int parentKey = 10000;
            int childKey;
            int nodeKey;

            #region 任务管理
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;

            node = new Purview
            {
                Label = "任务管理",
                Key = "Task",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "任务查询",
                Key = node.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "执行任务命令",
                Key = node.Key + "_" + PurviewKey.Execute,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "任务新增",
                Key = node.Key + "_" + PurviewKey.Add,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "任务修改",
                Key = node.Key + "_" + PurviewKey.Modify,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "任务删除",
                Key = node.Key + "_" + PurviewKey.Delete,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });

            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "任务导出",
                Key = node.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            Purviews.Add(node);
            #endregion

            #region  设备监控
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;

            node = new Purview
            {
                Label = "设备监控",
                Key = "Monitor",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };

            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "实时监控",
                Key = node.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            Purviews.Add(node);
            #endregion

            #region 文件管理
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;

            node = new Purview
            {
                Label = "文件管理",
                Key = "File",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            Purviews.Add(node);
            #endregion

            #region 报表管理
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;

            node = new Purview
            {
                Label = "报表管理",
                Key = "Report",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            Purviews.Add(node);
            #endregion

            #region 日志管理
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;

            node = new Purview
            {
                Label = "日志管理",
                Key = "Log",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };

            childKey += 100;
            nodeKey = 0;
            childNode = new Purview
            {
                Label = "操作日志",
                Key = node.Key + "_" + "Oper",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志查询",
                Key = childNode.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志导出",
                Key = childNode.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            node.Children.Add(childNode);


            childKey += 100;
            nodeKey = 0;
            childNode = new Purview
            {
                Label = "报警日志",
                Key = node.Key + "_" + "Warn",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志查询",
                Key = childNode.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志导出",
                Key = childNode.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            node.Children.Add(childNode);


            childKey += 100;
            nodeKey = 0;
            childNode = new Purview
            {
                Label = "任务日志",
                Key = node.Key + "_" + "Task",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志查询",
                Key = childNode.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志导出",
                Key = childNode.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            node.Children.Add(childNode);

            childKey += 100;
            nodeKey = 0;
            childNode = new Purview
            {
                Label = "接口日志",
                Key = node.Key + "_" + "Task",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志查询",
                Key = childNode.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            childNode.Children.Add(new Purview
            {
                Label = "日志导出",
                Key = childNode.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            node.Children.Add(childNode);

            Purviews.Add(node);
            #endregion

            #region 设备管理
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;
            node = new Purview
            {
                Label = "设备管理",
                Key = "Device",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };

            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "设备查询",
                Key = node.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });

            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "设备新增",
                Key = node.Key + "_" + PurviewKey.Add,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "设备修改",
                Key = node.Key + "_" + PurviewKey.Modify,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "设备删除",
                Key = node.Key + "_" + PurviewKey.Delete,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });

            //nodeKey++;
            //node.Children.Add(new Purview
            //{
            //    Label = "导出",
            //    Key = node.Key + "_" + PurviewKey.Export,
            //    Value = (parentKey + childKey + nodeKey).ToString(),
            //});
            Purviews.Add(node);
            #endregion

            #region 用户管理
            childKey = 0;
            nodeKey = 0;
            node = new Purview
            {
                Label = "用户管理",
                Key = "User",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "用户查询",
                Key = node.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });

            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "用户新增",
                Key = node.Key + "_" + PurviewKey.Add,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "用户修改",
                Key = node.Key + "_" + PurviewKey.Modify,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "用户删除",
                Key = node.Key + "_" + PurviewKey.Delete,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {

                Label = "用户导出",
                Key = node.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            Purviews.Add(node);
            #endregion

            #region 角色管理
            parentKey += 1000;
            childKey = 0;
            nodeKey = 0;
            node = new Purview
            {
                Label = "角色管理",
                Key = "Role",
                Value = (parentKey + childKey + nodeKey).ToString(),
                Children = new List<Purview>(),
            };
            nodeKey = 1;
            node.Children.Add(new Purview
            {
                Label = "角色查询",
                Key = node.Key + "_" + PurviewKey.Gets,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });

            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "角色新增",
                Key = node.Key + "_" + PurviewKey.Add,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "角色修改",
                Key = node.Key + "_" + PurviewKey.Modify,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {
                Label = "角色删除",
                Key = node.Key + "_" + PurviewKey.Delete,
                Value = (parentKey + childKey + nodeKey).ToString(),
            });
            nodeKey++;
            node.Children.Add(new Purview
            {

                Label = "角色导出",
                Key = node.Key + "_" + PurviewKey.Export,
                Value = (parentKey + childKey + nodeKey).ToString(),

            });
            Purviews.Add(node);
            #endregion
        }

        private void InitMenus()
        {
            Menus.Clear();

        }


        private readonly object _lock_datas = new object();
        public List<RoleInfo> Datas { get; } = new List<RoleInfo>();

        public void Refresh()
        {
            //try
            //{ 
            //    DALRole dal = new DALRole();
            //    List<RoleInfo> list = dal.GetAll();
            //    for (int i = 0; i < list.Count; ++i)
            //    {
            //        BLLRole.DealWithData(list[i], true);
            //    }

            //    lock (_lock_datas)
            //    {
            //        Datas.Clear();
            //        Datas.AddRange(list);
            //    }

            //    HelperLog.Info("刷新Role");
            //}
            //catch (Exception ex)
            //{
            //    HelperLog.Error(ex, "刷新Role");
            //}
        }

        public RoleInfo Get(long? id)
        {
            if (id == null)
                return null;

            foreach (RoleInfo role in Datas)
            {
                if (role.ID == id)
                {
                    return role;
                }
            }
            return null;
        }

        public string GetRoleName(long? id)
        {
            RoleInfo data = Get(id);
            if (data != null)
                return data.RoleName;
            return "";
        }

        private Purview GetPurview(string key, Purview node)
        {
            if (key == node.Key)
                return node;


            if (node.Children == null)
                return null;

          ;
            for (int i = 0; i < node.Children.Count; i++)
            {
                if (node.Children[i].Key == key)
                    return node.Children[i];

                Purview purview = GetPurview(key, node.Children[i]);
                if (purview != null)
                    return purview;
            }

            return null;
            
        }


        public Purview GetPurview(string key)
        {
            for (int i = 0; i < Purviews.Count; ++i)
            {
                if (key == Purviews[i].Key)
                    return Purviews[i];

                Purview purview = GetPurview(key, Purviews[i]);
                if (purview != null)
                    return purview;

            }
            return null;
        }


        /// <summary>
        /// 是否有权限
        /// </summary>
        /// <returns></returns>
        public bool HasPurview(long? id, string key)
        {
            if ((id > 0) == false)
                return false;
            Purview purview = GetPurview(key);

            if (purview == null)
                return false;
            RoleInfo roleInfo;
            
            for (int i =0; i < Datas.Count; i++) 
            {
                roleInfo = Datas[i];
                if (roleInfo.ID == id)
                {
                    if (roleInfo.Enabled != 1)
                        break;
                    if (roleInfo.PurviewList == null)
                        break;

                    for(int j=0;j< roleInfo.PurviewList.Count;++j) 
                    {
                       
                        if (roleInfo.PurviewList[j] == purview.Value)
                        {
                            return true;
                        }
                    }
                }
            }

            return false;
        }







    }
}
