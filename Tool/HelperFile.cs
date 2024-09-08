using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperFile
    {
        public static void ClearFile(string folder, double minute)
        {
            //if (Directory.Exists(folder) == false)
            //    return;
            //try
            //{
            //    DirectoryInfo root = new DirectoryInfo(folder);
            //    TimeSpan ts;
            //    FileInfo[] files = root.GetFiles();
            //    foreach (FileInfo file in files)
            //    {
            //        ts = DateTime.Now - file.LastWriteTime;
            //        if (ts.TotalMinutes > minute)
            //        {
            //            File.Delete(file.FullName);
            //            continue;
            //        }
            //    }

            //    DirectoryInfo[] dirs = root.GetDirectories();
            //    foreach (DirectoryInfo dir in dirs)
            //    {
            //        ClearFile(dir.FullName, minute);

            //        //删除空文件
            //        Directory.Delete(dir.FullName);
            //    }


            //}
            //catch (Exception ex)
            //{
            //    HelperLog.Error(ex, "文件清理异常");
            //}
        }
    }
}
