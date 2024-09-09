using DB;
using Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AndesMobileDataService
{
    public class Common
    {
        public static List<Device> Devices { get; set; } = new List<Device>();

        public static void Init()
        {
            Devices.AddRange(EntityHelp.GetObjectList<Device>());
        }
    }
}
