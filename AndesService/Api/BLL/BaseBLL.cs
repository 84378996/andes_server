using Newtonsoft.Json.Linq;
using Entity;

namespace MCSService.Api.BLL
{
    public class BaseBLL
    {

        public bool VerifyGetParam(RequestObject req)
        {
            if (req == null)
                return false;

            if (string.IsNullOrWhiteSpace(req.Params))
                return false;

            try
            {
                JObject.Parse(req.Params);
            }
            catch
            {
                return false;
            }


            if (req.OperID == null)
                req.OperID = 0;

            return true;
        }


        public bool VerifyGetParamOper(RequestObject req)
        {
            if (req == null)
                return false;

            if (string.IsNullOrWhiteSpace(req.Params))
                return false;

            try
            {
                JObject.Parse(req.Params);
            }
            catch
            {
                return false;
            }

            if (req.OperID == null)
                return false;

            if (req.OperID <= 0)
                return false;

            return true;
        }


        public bool VerifyPostParam(RequestObject req)
        {
            if (req == null)
                return false;

            if (req.Data == null && req.Array == null)
                return false;

            if (req.OperID == null)
                req.OperID = 0;

            return true;
        }


        public bool VerifyPostParamOper(RequestObject req)
        {
            if (req == null)
                return false;

            if (req.Data == null && req.Array == null)
                return false;

            if (req.OperID == null)
                return false;

            if (req.OperID <= 0)
                return false;

            return true;
        }



        public bool VerifyJsonPostParam(JsonRequestObj req)
        {
            if (req == null)
                return false;

            if (req.id == null || req.name == null || req.timestamp == null)
                return false;

            return true;

        }



    }
}
