using Entity;
using MCSService.DAL;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCSService.Api.BLL
{
    internal class BLLDeviceRecord : BaseBLL
    {
        internal ResponseObject GetDeviceRecordList(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParam(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            DALDeviceRecord _dal = new DALDeviceRecord();
            JObject param = req.Data;

            JObject pas = req.Data;
            if (!pas.ContainsKey("PageIndex") || !pas.ContainsKey("PageSize"))
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            int pi = 0, ps = 0, total = 0, count = 0;


            List<Record> devs = null;
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
