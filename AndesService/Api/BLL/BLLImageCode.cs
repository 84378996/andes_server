using Newtonsoft.Json.Linq;
using System;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
using Entity;
using MCSService.Global;

namespace MCSService.Api.BLL
{
    /// <summary>
    /// 验证码
    /// </summary>
    /// 
    public class BLLImageCode : BaseBLL
    {

        public BLLImageCode()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="req">{Type:,}</param>
        /// <returns></returns>
        public ResponseObject Get()
        {
            ResponseObject rsp = new ResponseObject();

            string code = CreateLoginCode(4); //验证码的字符为4个
            string filename = Guid.NewGuid().ToString() + ".bmp";

            if (Directory.Exists(PathGlobal.ImageCode) == false)
                Directory.CreateDirectory(PathGlobal.ImageCode);

            string fullname = PathGlobal.ImageCode + "\\" + filename;

            CreateLoginGraphic(code, fullname);
            
            string url = string.Format("/api/resource/imagecode/{0}",
                 filename);
            string key = Guid.NewGuid().ToString("N").ToUpper();

            JObject result = new JObject();
            result.Add("URL", url);
            result.Add("ID", key);
            //调试阶段使用，正式环境要删除
            result.Add("Code", code);
            ImageCodeGlobal.GetInstance().Add(key, code);
            rsp.Data = result;


            return rsp;

        }


        /// <summary>
        /// 生成随机的字符串
        /// </summary>
        /// <param name="codeCount"></param>
        /// <returns></returns>
        private string CreateLoginCode(int codeCount)
        {
            string allChar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,a,b,c,d,e,f,g,h,g,k,m,n,o,p,q,r,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,s,t,u,v,w,x,y,z";
            string[] allCharArray = allChar.Split(',');
            string randomCode = "";
            int temp = -1;
            Random rand = new Random();
            for (int i = 0; i < codeCount; i++)
            {
                if (temp != -1)
                {
                    rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
                }
                int t = rand.Next(35);
                if (temp == t)
                {
                    return CreateLoginCode(codeCount);
                }
                temp = t;
                randomCode += allCharArray[t];
            }
            return randomCode;
        }

        /// <summary>
        /// 创建验证码图片
        /// </summary>
        /// <param name="validateCode"></param>
        /// <returns></returns>
        private void CreateLoginGraphic(string validateCode, string filename)
        {
            int width = 90;
            int height = 38;
            //Bitmap image = new Bitmap((int)Math.Ceiling(validateCode.Length * 15.0), 38);
            Bitmap image = new Bitmap(width, height);
            Graphics g = Graphics.FromImage(image);
            try
            {
                //生成随机生成器
                Random random = new Random();
                //清空图片背景色
                g.Clear(Color.White);
                //画图片的干扰线
                for (int i = 0; i < 25; i++)
                {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);
                    g.DrawLine(new Pen(Color.Silver), x1, x2, y1, y2);
                }
                Font font = new Font("Arial", 19, (FontStyle.Bold | FontStyle.Italic));


                //for (int i = 0; i < validateCode.Length; ++i)
                //{
                //    string str = validateCode[i].ToString();
                //    int x = width * i / validateCode.Length;
                //    LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width/validateCode.Length, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);

                //    g.DrawString(str, font, brush, x,3);
                //}

                LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
                g.DrawString(validateCode, font, brush, 3, 3);

                //画图片的前景干扰线
                for (int i = 0; i < 100; i++)
                {
                    int x = random.Next(image.Width);
                    int y = random.Next(image.Height);
                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }
                //画图片的边框线
                //g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

                //保存图片数据
                image.Save(filename, ImageFormat.Bmp);

            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }


    }
}