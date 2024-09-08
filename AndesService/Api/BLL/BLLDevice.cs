using Entity;
using MCSService.DAL;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool;

namespace MCSService.Api.BLL
{
    public class BLLDevice : BaseBLL
    {
        internal ResponseObject GetDeviceList(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParam(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            DALDevice _dal = new DALDevice();
            JObject param = req.Data;

            JObject pas = req.Data;
            if (!pas.ContainsKey("PageIndex") || !pas.ContainsKey("PageSize"))
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            int pi = 0, ps = 0, total = 0, count = 0;
            

            List<Device> devs = null;
            if (!_dal.Get(param, out devs, out pi, out ps, out total, out count))
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "查询出错";
                return rsp;
            }

            JArray array = JArray.FromObject(devs);

            JObject data = new JObject
            {
                { "Data", array},
                { "Total", total },
                { "Count",count },
                { "PageIndex", pi }
            };

            rsp.Data = data;
            return rsp;
        }
    }
}
