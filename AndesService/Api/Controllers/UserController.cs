using Entity;
using MCSService.Api.BLL;
using Microsoft.Owin;
using System;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Tool;

namespace MCSService.Api.Controllers
{
    public class UserController : ApiController
    {
        /// <summary>
        /// 获取验证码
        /// </summary>
        [HttpGet]
        public IHttpActionResult GetImageCode()
        {
            try
            {
                BLLImageCode bll = new BLLImageCode();
                var rsp = bll.Get();
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }

        [HttpPost]
        public IHttpActionResult Login([FromBody] RequestObject req)
        {
            try
            {
                // Access the OWIN context using the extension method GetOwinContext()
                IOwinContext owinContext = Request.GetOwinContext();

                // Get the client's IP address from the OWIN context
                string clientIpAddress = owinContext.Request.RemoteIpAddress;

                BLLUser bll = new BLLUser();
                var rsp = bll.Login(req,clientIpAddress);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }


        [Authorize]
        [HttpPost]
        public IHttpActionResult Add([FromBody] RequestObject req)
        {
            try
            {
                BLLUser bll = new BLLUser();
                var rsp = bll.Add(req);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }

        [Authorize]
        [HttpPost]
        public IHttpActionResult Modify([FromBody] RequestObject req)
        {
            try
            {
                BLLUser bll = new BLLUser();
                var rsp = bll.Modify(req);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }

        [Authorize]
        [HttpPost]
        public IHttpActionResult Delete([FromBody] RequestObject req)
        {
            try
            {
                BLLUser bll = new BLLUser();
                var rsp = bll.Delete(req);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }

        [Authorize]
        [HttpPost]
        public IHttpActionResult Get([FromBody] RequestObject req)
        {
            try
            {
                BLLUser bll = new BLLUser();
                var rsp = bll.Get(req);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }
        
        [Authorize]
        [HttpPost]
        public IHttpActionResult Gets([FromBody] RequestObject req)
        {
            try
            {
                BLLUser bll = new BLLUser();
                var rsp = bll.Gets(req);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }

        [Authorize]
        [HttpPost]
        public HttpResponseMessage UploadAvatar()
        {
            BLLUser bll = new BLLUser();
            var httpRequest = HttpContext.Current.Request;
            return bll.SaveAvatar(httpRequest);

        }

        [Authorize]
        [HttpGet]
        public IHttpActionResult Export([FromBody] RequestObject req)
        {
            try
            {
                BLLUser bll = new BLLUser();
                var rsp = bll.Export(req);
                return Json(rsp, JsonSettings.settings);
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

                return Json(new ResponseObject
                {
                    Code = MsgCode.Other,
                    Msg = ex.Message
                }, JsonSettings.settings);
            }
        }
    }
}