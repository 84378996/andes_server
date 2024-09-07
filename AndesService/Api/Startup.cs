using MCSService.Api.BLL;
using Microsoft.Owin;
using Microsoft.Owin.Security.OAuth;
using Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http.Formatting;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.SelfHost;
using Tool;

namespace MCSService.Api
{
    class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureOAuth(app);
            HttpConfiguration config = InitWebApiConfig();

            _ = app.UseWebApi(config);
            _ = app.Use((context, fun) =>
            {
                return StaticWebFileHandel(context, fun);
            });


        }
        
        /// <summary>
        /// 路由初始化
        /// </summary>
        public HttpConfiguration InitWebApiConfig()
        {
            HttpConfiguration config = new HttpConfiguration();
            _ = config.Routes.MapHttpRoute(
                name: "System",
                routeTemplate: "api/{controller}/{action}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "ImageRoute",
                 routeTemplate: "api/resource/{folder}/{filename}",
            defaults: new { controller = "Resource", action = "GetImage" }
            );

            EnableCorsAttribute cors = new EnableCorsAttribute("*", "*", "*");//跨域允许设置
            config.EnableCors(cors);


            //默认返回 json
            config.Formatters
                .JsonFormatter.MediaTypeMappings.Add(
                new QueryStringMapping("datatype", "json", "application/json"));

            //json 序列化设置
            config.Formatters
                .JsonFormatter.SerializerSettings = new
                Newtonsoft.Json.JsonSerializerSettings();

           
            return config;
        }





        public Task StaticWebFileHandel(IOwinContext context, Func<Task> next)
        {
            string path = GetFilePath(context.Request.Path.Value);
            if (Path.HasExtension(path) == false)
            {
                path += ".html";
            }

            if (File.Exists(path))
            {
                return SetResponse(context, path);
            }
            //不存在返回下一个请求
            return next();
        }

        public static string GetFilePath(string relPath)
        {
            string basePath = AppDomain.CurrentDomain.BaseDirectory;
            string filePath = relPath.TrimStart('/').Replace('/', '\\');

            if (Path.HasExtension(filePath) == false)
            {
                return Path.Combine(basePath, filePath);
            }
            else
            {
                //指定路径
                 string path = HelperConfig.Instance.AppServer_SiteDir == "."
                ? Path.Combine(basePath, filePath)
                : Path.Combine(HelperConfig.Instance.AppServer_SiteDir, filePath);

                return path;
                
            }
        }

        public Task SetResponse(IOwinContext context, string path)
        {
            /*
                .txt text/plain
                RTF文本 .rtf application/rtf
                PDF文档 .pdf application/pdf
                Microsoft Word文件 .word application/msword
                PNG图像 .png image/png
                GIF图形 .gif image/gif
                JPEG图形 .jpeg,.jpg image/jpeg
                au声音文件 .au audio/basic
                MIDI音乐文件 mid,.midi audio/midi,audio/x-midi
                RealAudio音乐文件 .ra, .ram audio/x-pn-realaudio
                MPEG文件 .mpg,.mpeg video/mpeg
                AVI文件 .avi video/x-msvideo
                GZIP文件 .gz application/x-gzip
                TAR文件 .tar application/x-tar
                任意的二进制数据 application/octet-stream
             */
            string perfix = Path.GetExtension(path);
            if (perfix == ".html")
            {
                context.Response.ContentType = "text/html; charset=utf-8";
            }
            else if (perfix == ".txt")
            {
                context.Response.ContentType = "text/plain";
            }
            else if (perfix == ".js")
            {
                context.Response.ContentType = "application/x-javascript";
            }
            else if (perfix == ".css")
            {
                context.Response.ContentType = "text/css";
            }
            else
            {
                if (perfix == ".jpeg" || perfix == ".jpg")
                {
                    context.Response.ContentType = "image/jpeg";
                }
                else if (perfix == ".gif")
                {
                    context.Response.ContentType = "image/gif";
                }
                else if (perfix == ".png")
                {
                    context.Response.ContentType = "image/png";
                }
                else if (perfix == ".bmp")
                {
                    context.Response.ContentType = "image/bmp";
                }
                else if (perfix == ".svg")
                {
                    context.Response.ContentType = "image/svg+xml";
                }
                else if (perfix == ".woff")
                {
                    context.Response.ContentType = "application/font-woff";
                }
                else if (perfix == ".woff2")
                {
                    context.Response.ContentType = "application/font-woff2";
                }
                else if (perfix == ".ttf")
                {
                    context.Response.ContentType = "application/octet-stream";
                }

                return context.Response.WriteAsync(File.ReadAllBytes(path));
            }
            //truetype
            return context.Response.WriteAsync(File.ReadAllText(path));
        }

        public void ConfigureOAuth(IAppBuilder app)
        {
            try
            {
                OAuthAuthorizationServerOptions OAuthServerOptions = new OAuthAuthorizationServerOptions()
                {
                    AllowInsecureHttp = true,
                    TokenEndpointPath = new PathString("/api/token"),
                    AccessTokenExpireTimeSpan = TimeSpan.FromHours(8),
                    //AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(5),
                    Provider = new SimpleAuthorizationServerProvider()
                };
                app.UseOAuthAuthorizationServer(OAuthServerOptions);
                app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
            }
            catch (Exception e)
            {
                HelperLog.Error(e);
            }
        }


        /// <summary>
        /// Token验证
        /// </summary>
        public class SimpleAuthorizationServerProvider : OAuthAuthorizationServerProvider
        {
            Dictionary<string, string> dirusers = new Dictionary<string, string> {
            {"mscapiadmin","123456"},
                {"msckanbanadmin","000988"}
        };

            public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
            {
                await Task.Factory.StartNew(() => context.Validated());
            }

            public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
            {
                await Task.Factory.StartNew(() => context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" }));
                /*
                 * 对用户名、密码进行数据校验
                using (AuthRepository _repo = new AuthRepository())
                {
                    IdentityUser user = await _repo.FindUser(context.UserName, context.Password);

                    if (user == null)
                    {
                        context.SetError("invalid_grant", "The user name or password is incorrect.");
                        return;
                    }
                }*/

                //判断键存在
                if (dirusers.ContainsKey(context.UserName)) // True 
                {
                    string val = dirusers[context.UserName];
                    if (val != context.Password)
                    {
                        context.SetError("invalid_grant", "The user name or password is incorrect.");
                        return;
                    }
                }
                else
                {
                    BLLUser userBLL = new BLLUser();
                    if (userBLL.Verify(context.UserName, context.Password) == false)
                    {
                        context.SetError("invalid_grant", "The user name or password is incorrect.");
                        return;
                    }
                }

                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim("sub", context.UserName));
                identity.AddClaim(new Claim("role", "user"));

                context.Validated(identity);

            }
        }

    }
}
