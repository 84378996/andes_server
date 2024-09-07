using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MCSService.Global
{
    public class ImageCodeGlobal
    {

        private static ImageCodeGlobal uniqueInstance;
        private ImageCodeGlobal()
        {

        }
        public static ImageCodeGlobal GetInstance()
        {
            if (uniqueInstance == null)
            {
                uniqueInstance = new ImageCodeGlobal();
            }
            return uniqueInstance;
        }

        private readonly object _lock_datas = new object();

        public Dictionary<string, string> Datas { get; } = new Dictionary<string, string>();


        public void Add(string key, string value)
        {
            lock (_lock_datas)
            {
                Datas.Add(key, value);
            }
        }

        public string Get(string key)
        {
            if (Datas.ContainsKey(key))
            {
                string value = Datas[key];

                lock (_lock_datas)
                {
                    Datas.Remove(key);
                }
                return value;
            }

            return "";
        }

    }
}