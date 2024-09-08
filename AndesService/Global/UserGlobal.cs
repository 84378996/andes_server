using Entity;
using MCSService.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool;

namespace MCSService.Global
{
    public class UserGlobal
    {
        private static UserGlobal uniqueInstance;
        private UserGlobal()
        {

        }
        public static UserGlobal Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new UserGlobal();
                }
                return uniqueInstance;
            }
        }

        private readonly object _lock_datas = new object();

        public List<UserInfo> Datas { get; } = new List<UserInfo>();

        private readonly UserComparer comparer = new UserComparer();

        public void Refresh()
        {
            try
            {
                DALUser dal = new DALUser();
                List<UserInfo> list = dal.GetAll();
                lock (_lock_datas)
                {
                    Datas.Clear();
                    Datas.AddRange(list);
                }

                HelperLog.Info("刷新Users");
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex);
            }
        }

        public UserInfo Get(long? id)
        {
            if (id == null)
                return null;

            foreach (UserInfo user in Datas)
            {
                if (user.ID == id)
                {
                    return user;
                }
            }
            return null;
        }

        public string GetName(long? id)
        {
            UserInfo user = Get(id);
            if (user != null)
                return user.Name;
            return "";
        }

        public UserInfo GetByLoginName(string loginname)
        {
            if (string.IsNullOrWhiteSpace(loginname))
                return null;
            lock (_lock_datas)
            {
                foreach (UserInfo user in Datas)
                {
                    if (user.LoginName == loginname)
                    {
                        return user;
                    }
                }
            }
            return null;
        }

        


        /// <summary>
        /// 是否有权限
        /// </summary>
        /// <returns></returns>
        public bool HasPurview(long? operid, string key)
        {
            return true;
            //if ((operid > 0) == false)
            //    return false;

            //foreach (UserInfo user in Datas)
            //{
            //    if (operid == user.ID)
            //    {
            //        if (user.RoleID > 0)
            //        {
            //            return RoleGlobal.Instance.HasPurview(user.RoleID, key);
            //        }
            //        break;
            //    }
            //}

            //return false;

        }
    }
}
