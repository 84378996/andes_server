using DB;
using Entity;
using Newtonsoft.Json.Linq;
using System;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;

namespace AndesMobileDataService
{

    internal class Program
    {
        static System.Collections.Concurrent.ConcurrentDictionary<int, Client> m_clients = new System.Collections.Concurrent.ConcurrentDictionary<int, Client>();
        static Timer m_timer = null;
        //static List<Client> m_clients = new List<Client>();
        static Socket m_listener = null;
        static WaitHandle m_handle = null;
        private static void Main(string[] args)
        {
            try
            {
                Common.Init();
                Console.WriteLine($"{Common.Devices.Count}");
                Console.WriteLine(Common.Devices[0].IMEI);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
            }

            m_timer = new Timer(OnTimer, null, TimeSpan.FromSeconds(5), TimeSpan.FromMinutes(12));
            m_handle = new EventWaitHandle(false, EventResetMode.ManualReset);
            m_listener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            m_listener.Bind(new IPEndPoint(IPAddress.Any, 23231));
            m_listener.Listen(1000);
            m_listener.BeginAccept(OnAccept, null);
            m_handle.WaitOne();
            m_listener.Close();
        }

        static short ReadInit16(byte[] buf, ref int offset)
        {
            return (short)(((buf[offset++]) << 8) | buf[offset++]);
        }

        private static void OnTimer(object state)
        {
            Console.WriteLine($"On time {DateTime.Now}");
            var ks = m_clients.Keys.ToArray();
            foreach (var k in ks)
            {
                if (m_clients.TryGetValue(k, out var client))
                {
                    var ts = DateTime.Now - client.AliveTime;
                    if (ts.TotalMinutes > 20)
                    {
                        Console.WriteLine("client time out");
                        try
                        {
                            client.Socket?.Close();
                        }
                        catch { }
                        m_clients.TryRemove(k, out _);
                    }
                }
            }
        }

        private static void OnAccept(IAsyncResult ar)
        {
            try
            {
                Socket client = m_listener.EndAccept(ar);
                Client c = new Client(client);
                m_clients.TryAdd(c.Key, c);
                var ir = client.BeginReceive(c.Buf, 0, c.Buf.Length, SocketFlags.None, OnReceive, c);
                m_listener.BeginAccept(OnAccept, null);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                Console.WriteLine(ex.StackTrace);
            }
        }

        private static void OnReceive(IAsyncResult ar)
        {
            if (ar.AsyncState is Client client)
            {
                try
                {
                    int len = client.Socket.EndReceive(ar);
                    if (len <= 0)
                    {
                        Console.WriteLine("client disconnect");
                        m_clients.TryRemove(client.Key, out _);
                        return;
                    }
                    Console.WriteLine($"receive {len} bytes");

                    //string str= BitConverter.ToString(client.Buf, 0, len);
                    //str = str.Replace("-", " ");
                    //Console.WriteLine(str);
                    client.AliveTime = DateTime.Now;

                    //if (len == 15)
                    //{
                    //    int offset = 3;
                    //    int unit = ReadInit16(client.Buf, ref offset);
                    //    int jd = ReadInit16(client.Buf, ref offset);
                    //    int thresold_min = ReadInit16(client.Buf, ref offset);
                    //    int thresold_max = ReadInit16(client.Buf, ref offset);
                    //    int val = ReadInit16(client.Buf, ref offset);

                    //    Console.WriteLine($"{unit},{jd},{thresold_min},{thresold_max},{val}");

                    //    //DbHelper.ExecuteNonQuery($" INSERT INTO \"public\".\"tb_record\" (\"unit\", \"jd\", \"threshold_min\", \"threshold_max\", \"val\", \"rd_time\") VALUES ( {unit}, {jd},{thresold_min},{thresold_max},{val}, '{DateTime.Now}');");
                    //    Record rd = new Record
                    //    {  }

                    //}
                    //else
                    if (len == 80)
                    {
                        string str = Encoding.UTF8.GetString(client.Buf, 0, len);
                        JObject json = JObject.Parse(str);
                        string data = json["id1"].Value<string>();
                        int csq = json["csq"].Value<int>();
                        string imei = json["sn"].Value<string>();
                        int vol = json["vol"].Value<int>();

                        var buf = HexStringToByteArray(data);
                        int offset = 3;
                        short unit = ReadInit16(client.Buf, ref offset);
                        short jd = ReadInit16(client.Buf, ref offset);
                        short thresold_min = ReadInit16(client.Buf, ref offset);
                        short thresold_max = ReadInit16(client.Buf, ref offset);
                        short val = ReadInit16(client.Buf, ref offset);
                        Console.WriteLine($"{unit},{jd},{thresold_min},{thresold_max},{val}");

                        var dev = Common.Devices.FirstOrDefault(d => d.IMEI == imei);
                        if (dev == null)
                        {
                            Console.WriteLine($"未找到对应设备, imei: {imei}, dev imei: {Common.Devices[0].IMEI}");
                        }
                        else
                        {
                            //DbHelper.ExecuteNonQuery($" INSERT INTO \"public\".\"tb_record\" (\"unit\", \"jd\", \"threshold_min\", \"threshold_max\", \"val\", \"rd_time\", \"device_id\", \"device_name\") VALUES ( {unit}, {jd},{thresold_min},{thresold_max},{val}, '{DateTime.Now}', {dev.id}, '{dev.name}');");
                            Record rd = new Record { Unit = unit, DeviceID = dev.ID, DeviceName = dev.DeviceName, JD = jd, RecordTime = DateTime.Now, TheValue = val, ThresholdMax = thresold_max, ThresholdMin = thresold_min };
                            EntityHelp.InsertEntity(rd);

                            dev.JD = (short)jd;
                            dev.TheValue = (short)val;
                            dev.Unit = (short)unit;
                            dev.LastRecordTime = DateTime.Now;
                            dev.ThresholdMax = (short)thresold_max;
                            dev.ThresholdMin = (short)thresold_min;

                            EntityHelp.UpdateEntity(dev);

                            if (val >= thresold_min) //报警
                            {
                                Alarm alarm = new Alarm { DeviceID = dev.ID, AlarmTime = DateTime.Now, DeviceName = dev.DeviceName, JD = dev.JD, ThresholdMax = dev.ThresholdMax, ThresholdMin = dev.ThresholdMin, Unit = dev.Unit, TheValue = dev.TheValue };
                                EntityHelp.InsertEntity(alarm);
                            }

                        }
                    }

                    client.Socket.BeginReceive(client.Buf, 0, client.Buf.Length, SocketFlags.None, OnReceive, client);
                }
                catch (ObjectDisposedException)
                {
                    Console.WriteLine("ObjectDisposedException");
                    client.ReleaseSocket();
                }
                catch (SocketException ex)
                {
                    Console.WriteLine("Socket Exception, " + ex.Message);
                    client.ReleaseSocket();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                    Console.WriteLine(ex.StackTrace);
                    client.ReleaseSocket();
                }
            }
        }

        public static byte[] HexStringToByteArray(string hex)
        {
            // 去掉可能的空格
            hex = hex.Replace(" ", string.Empty);

            // 字符串长度必须为偶数
            if (hex.Length % 2 != 0)
                throw new ArgumentException("Hex string must have an even length");

            byte[] bytes = new byte[hex.Length / 2];

            for (int i = 0; i < bytes.Length; i++)
            {
                // 每两个字符转换为一个字节
                bytes[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);
            }

            return bytes;
        }
    }
}