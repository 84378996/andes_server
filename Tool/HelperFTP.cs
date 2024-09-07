using Entity;
using FluentFTP;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperFTP
    {

        public string IP { get; set; }
        public int Port { get; set; }
        public string LoginName { get; set; }
        public string Pwd { get; set; }

        public HelperFTP()
        { }

        public HelperFTP(string ip, int port, string loginname, string pwd)
        {
            IP = ip;
            Port = port;
            LoginName = loginname;
            Pwd = pwd;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="src">本地文件路径</param>
        /// <param name="dest">远程文件路径</param>
        /// <returns></returns>
        public bool SendFile(string localPath, string remotePath)
        {
            using (FtpClient client = new FtpClient())
            {
                try
                {
                    client.Host = IP;
                    client.Port = Port;
                    client.Credentials = new NetworkCredential(LoginName, Pwd);

                    // begin connecting to the server
                    client.Connect();

                    client.UploadFile(localPath, remotePath);


                    return true;

                }
                catch (Exception ex)
                {
                    HelperLog.Error(ex);
                    return false;
                }
                finally
                {
                    client.Disconnect();
                }
            }
        }


        public List<FileItem> GetListing(string remote)
        {
            List<FileItem> list = new List<FileItem>();
            using (FtpClient client = new FtpClient())
            {

                try
                {
                    client.Host = IP;
                    client.Port = Port;
                    client.Credentials = new NetworkCredential(LoginName, Pwd);

                    // begin connecting to the server
                    client.Connect();

                    FtpListItem[] files = client.GetListing(remote);

                    foreach (FtpListItem item in files)
                    {
                        if (item.Type == FtpObjectType.File)
                        {
                            FileItem file = new FileItem();
                            file.Name = item.Name;
                            file.FullName = item.FullName;
                            file.CreationTime = item.Created;
                            file.LastWriteTime = item.Modified;
                            file.Size = item.Size;
                            file.Type = (int)FileItemType.File;

                            list.Add(file);


                        }
                        else if (item.Type == FtpObjectType.Directory)
                        {
                            FileItem dir = new FileItem();
                            dir.Type = (int)FileItemType.Directory;
                            dir.Name = item.Name;
                            dir.FullName = item.FullName;
                            list.Add(dir);
                        }
                    }

                    return list;
                }
                catch (Exception ex)
                {
                    HelperLog.Error(ex);
                    return null;
                }
                finally
                {
                    client.Disconnect();
                }
            }
        }

        public bool Delete(List<FileItem> list)
        {
            using (FtpClient client = new FtpClient())
            {

                try
                {
                    client.Host = IP;
                    client.Port = Port;
                    client.Credentials = new NetworkCredential(LoginName, Pwd);

                    // begin connecting to the server
                    client.Connect();

                    for (int i = 0; i < list.Count; i++)
                    {
                        FileItem item = list[i];
                        if (item.Type == (int)FileItemType.Directory)
                        {
                            //路径
                            client.DeleteDirectory(item.FullName);
                        }
                        else if(item.Type == (int)FileItemType.File)
                        {
                            //文件
                            client.DeleteFile(item.FullName);
                        }
                    }
                    
                    return true;
                }
                catch (Exception ex)
                {
                    HelperLog.Error(ex);
                    return false;
                }
                finally
                {
                    client.Disconnect();
                }


            }
        }
    }
}
