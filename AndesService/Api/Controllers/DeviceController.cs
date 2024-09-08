using Entity;
using MCSService.Api.BLL;
using Newtonsoft.Json.Linq;
using System;
using System.Web.Http;
using Tool;
using System.Windows.Forms;
using NPOI.SS.Formula.Functions;
using DB;
using System.Collections.Generic;

namespace MCSService.Api.Controllers
{
    public class DeviceController : ApiController
    {
        [HttpGet]
        [HttpPost]
        public IHttpActionResult Test()
        {
            JObject root = new JObject();
            root.Add("response", "测试");
            return Json(root);
        }
        [HttpPost]
        public IHttpActionResult RestartApp([FromBody] RequestObject req)
        {
            try
            {
                ResponseObject rsp = new ResponseObject();

                if (req.Params == "restart")
                {
                    HelperLog.Info("restart app");
                    //System.Environment.Exit(1);
                    rsp.Succeed = true;
                    return Json(rsp, JsonSettings.settings);
                    //System.Diagnostics.Process.Start(System.Reflection.Assembly.GetExecutingAssembly().Location);
                }
                else
                {
                    rsp.Succeed = false;
                    rsp.Code = MsgCode.Other;
                    rsp.Msg = "后台程序无法关闭,请检查";
                    return Json(rsp, JsonSettings.settings);

                }
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
        public IHttpActionResult GetDevices([FromBody] RequestObject req)
        {
            try
            {
                
                BLLDevice bll = new BLLDevice();
                ResponseObject rsp = bll.GetDeviceList(req);
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
        public IHttpActionResult GetDevice([FromBody] RequestObject req)
        {
            try
            {
                ResponseObject rsp = new ResponseObject();

                // var ds = EntityHelp.GetObjectList<Device>();

                // JArray array = JArray.FromObject(ds);
                Device device = new Device();
                device.DeviceNo = "sdfasf";
                JObject data = new JObject
                {
                    { "Data", JObject.FromObject(device)},
                    { "Total", 1 },
                    { "Count",0 },
                    { "PageIndex", 1 }
                };

                rsp.Data = data;
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
        public IHttpActionResult GetDeviceRecords([FromBody] RequestObject req)
        {
            try
            {
                //ResponseObject rsp = new ResponseObject();

                //var ds = EntityHelp.GetObjectList<Record>($"select * from \"public\".\"Record\" where \"DeviceID\"={1}");

                //JObject data = new JObject
                //{
                //    { "Data", JArray.FromObject(ds)},
                //    { "Total", 1 },
                //    { "Count",0 },
                //    { "PageIndex", 1 }
                //};

                //rsp.Data = data;
                //return Json(rsp, JsonSettings.settings);

                BLLDeviceRecord bll = new BLLDeviceRecord();
                ResponseObject rsp = bll.GetDeviceRecordList(req);
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
