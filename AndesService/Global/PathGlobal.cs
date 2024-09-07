using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MCSService.Global
{
    public class PathGlobal
    {

        public static readonly string Temp = AppDomain.CurrentDomain.BaseDirectory + "temp";

        public static readonly string ImageCode = AppDomain.CurrentDomain.BaseDirectory + "temp\\imagecode";

        public static readonly string Log = AppDomain.CurrentDomain.BaseDirectory + "\\Log";


    }
}