using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace AndesMobileDataService
{
    public class Client
    {
        public Socket Socket { get; private set; }

        public Client(Socket socket)
        {
            Socket = socket;
            AliveTime=DateTime.Now;
        }

        public byte[] Buf { get; } = new byte[1024];
        public DateTime AliveTime { get; set; }

        public int Key
        {
            get 
            {
                if(Socket==null) return 0;
                return Socket.Handle.ToInt32();
            }
        }

        internal void ReleaseSocket()
        {
            try
            {
                Socket?.Close();
            }
            catch 
            {

            }
            Socket = null;
        }
    }
}
