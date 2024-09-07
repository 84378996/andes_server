using Entity;
using MCSService.Api.BLL;
using Newtonsoft.Json.Linq;
using System;
using System.Web.Http;
using Tool;
using System.Windows.Forms;
using NPOI.SS.Formula.Functions;

namespace MCSService.Api.Controllers
{
    public class TestController : ApiController
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
                ResponseObject rsp = new ResponseObject();

                JArray array = new JArray();
                array.Add(new JObject
                {
                    { "ID", 1 },

                {"no", "test001"                                  },
            {"name", "test"                                   },
            {"imei", "863121077972917"                        },
            {"createtime", "2024-09-01 20:14:07"             },
            {"deleted", 0                                     },
            {"unit", 0                                        },
            {"jd",1                                          },
            {"thresholdmin", 200                            },
            {"thresholdmax", 500                            },
            {"value", 0                                       },
            { "lastrecordtime", "2024-08-31 20:23:55"        },
                });
                array.Add(new JObject
                {
                    { "ID", 2 },

                {"no", "test002"                                  },
            {"name", "test"                                   },
            {"imei", "863121077972918"                        },
            {"createtime", "2024-09-01 20:14:07"             },
            {"deleted", 0                                     },
            {"unit", 0                                        },
            {"jd",1                                          },
            {"thresholdmin", 200                            },
            {"thresholdmax", 500                            },
            {"value", 0                                       },
            { "lastrecordtime", "2024-08-31 20:23:55"        },
                });

                JObject data = new JObject
                {
                    { "Data", array},
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

    }
}
