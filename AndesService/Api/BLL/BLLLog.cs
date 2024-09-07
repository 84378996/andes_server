using System;
using System.Collections.Generic;
using System.IO;
using Entity;
using MCSService.DAL;
using MCSService.Global;
using Newtonsoft.Json.Linq;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.SS.Util;
using Tool;


namespace MCSService.Api.BLL
{
    public class BLLLog : BaseBLL
    {

        private readonly DALLog _dal = new DALLog();

        private readonly string _rolekey = "Log_";

        private string GetTypeStr(int? type)
        {
            if (type == null)
                return "";

            string str;
            switch (type.Value)
            {
                case (int)LogType.Add:
                    str = "添加";
                    break;
                case (int)LogType.Browser:
                    str = "浏览";
                    break;
                case (int)LogType.Delete:
                    str = "删除";
                    break;
                case (int)LogType.Dispatch:
                    str = "派工";
                    break;
                case (int)LogType.Download:
                    str = "下载";
                    break;
                case (int)LogType.Modify:
                    str = "修改";
                    break;
                case (int)LogType.Login:
                    str = "登录";
                    break;
                case (int)LogType.Other:
                    str = "其它";
                    break;
                default:
                    str = type.Value.ToString();
                    break;
            }
            return str;

        }

        private string GetModuleStr(int? module)
        {
            if (module == null)
                return "";
            string str;
            switch (module.Value)
            {
                case (int)LogModule.Other:
                    str = "其它";
                    break;
                case (int)LogModule.User:
                    str = "用户信息";
                    break;
                case (int)LogModule.Role:
                    str = "角色信息";
                    break;
                case (int)LogModule.Device:
                    str = "设备信息";
                    break;
                case (int)LogModule.NFile:
                    str = "指令文件";
                    break;
                case (int)LogModule.DevFtp:
                    str = "设备文件";
                    break;
                case (int)LogModule.Monitor:
                    str = "数据采集";
                    break;

                case (int)LogModule.TaskCutList:
                    str = "生产任务";
                    break;
                case (int)LogModule.TaskCut:
                    str = "生产任务文件";
                    break;
                case (int)LogModule.Dictionary:
                    str = "字典信息";
                    break;
                default:
                    str = module.Value.ToString();
                    break;
            }
            return str;
        }

        private string GetStatusStr(int? status)
        {
            if (status == null)
                return "";

            string str;
            switch (status.Value)
            {
                case (int)LogStatus.Fail:
                    str = "失败";
                    break;
                case (int)LogStatus.Success:
                    str = "成功";
                    break;
                default:
                    str = "";
                    break;
            }
            return str;

        }

        private void RefreshData(Log data)
        {
            data.TypeStr = GetTypeStr(data.Type);
            data.ModuleStr = GetModuleStr(data.Module);
            data.OperName = UserGlobal.Instance.GetName(data.OperID);


        }

        public ResponseObject GetOptions()
        {
            ResponseObject rsp = new ResponseObject();
            rsp.Data = new JObject();

            JArray arr = new JArray();
            foreach (LogType type in Enum.GetValues(typeof(LogType)))
            {
                arr.Add(new JObject
                {
                    { "ID", (int)type },
                    { "Name", GetTypeStr((int)type) }
                });
            }
            rsp.Data.Add("Type", arr);

            arr = new JArray();
            foreach (LogModule type in Enum.GetValues(typeof(LogModule)))
            {
                arr.Add(new JObject
                {
                    { "ID", (int)type },
                    { "Name", GetModuleStr((int)type) }
                });
            }
            rsp.Data.Add("Module", arr);
            return rsp;
        }

        public ResponseObject Get(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();

            if (VerifyGetParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            if (UserGlobal.Instance.HasPurview(req.OperID, "Log_Gets") == false)
            {
                rsp.Code = MsgCode.NoPermission;
                rsp.Msg = "没有操作权限";
                return rsp;
            }


            JObject param = JObject.Parse(req.Params);

            if (HelperJObject.IsLong(param, "ID") == false)
            {
                rsp.Code = MsgCode.ReqException;
                rsp.Msg = "请求参数异常";
                return rsp;
            }
            long id = long.Parse(param["ID"].ToString());
            Log item = _dal.Get(id);
            RefreshData(item);
            JObject data = new JObject
                {
                    { "Data", JObject.FromObject(item) },
                };

            rsp.Data = data;

            return rsp;

        }

        public ResponseObject Gets(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            if (UserGlobal.Instance.HasPurview(req.OperID, _rolekey + PurviewKey.Gets) == false)
            {
                rsp.Code = MsgCode.NoPermission;
                rsp.Msg = "没有操作权限";
                return rsp;
            }

            JObject param = req.Data;
            _dal.Gets(param, false, out List<Log> list, out int total);

            for(int i=0;i<list.Count;i++) 
            {
                RefreshData(list[i]);
                list[i].Param1 = null;
                list[i].Param2 = null;
            }

            JObject data = new JObject
                {
                    { "Data", JArray.FromObject(list) },
                    { "Total", total },
                    { "Count", list.Count },
                    { "PageIndex", param["PageIndex"] }
                };

            rsp.Data = data;

            return rsp;

        }

        public void Add(Log data)
        {
            data.AddTime = DateTime.Now;
            _dal.Add(data);
        }

        public void Add(List<Log> list)
        {
            _dal.Add(list);
        }

        public List<Log> Gets(string identifier, LogModule module)
        {
            JObject param = new JObject
            {
                { "Identifier", identifier },
                { "Module", (int)module }
            };
            List<Log> list = _dal.GetAll(param, true);

            for(int i=0;i<list.Count;++i) 
            {
                RefreshData(list[i]);

                list[i].Param1 = null;
                list[i].Param2 = null;
            }
            return list;
        }


        public ResponseObject Export(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyGetParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            if (UserGlobal.Instance.HasPurview(req.OperID, _rolekey + PurviewKey.Export) == false)
            {
                rsp.Code = MsgCode.NoPermission;
                rsp.Msg = "没有操作权限";
                return rsp;
            }

            JObject param = JObject.Parse(req.Params);
            if (param == null)
            {
                rsp.Code = MsgCode.ReqException;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            List<Log> list = _dal.GetAll(param, false);

            string url = BuildReport(list, "系统日志");
            JObject data = new JObject
                {
                    { "Url", "url" },
                };

            rsp.Data = data;

            return rsp;
        }


        public string BuildReport(List<Log> list, string title)
        {

            DateTime dt = DateTime.Now;

            HSSFWorkbook workbook = new HSSFWorkbook();
            ISheet sheet = workbook.CreateSheet(dt.ToString("yyyyMMddHHmmss"));
            HelperExcel.InitSheet(sheet);

            IRow row;
            ICell cell;
            int rowindex = 0;
            int colindex = 0;

            //标题
            row = sheet.CreateRow(rowindex);
            colindex = 0;
            cell = row.CreateCell(colindex);
            cell.SetCellValue(title);
            cell.CellStyle = HelperExcel.GetTitleStyle(workbook);
            row.HeightInPoints = 40;
            sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, 6));

            ICellStyle style = HelperExcel.GetRowTitleStyle(workbook);

            rowindex++;
            row = sheet.CreateRow(rowindex);
            row.HeightInPoints = HelperExcel.GetRowHeight();
            colindex = 0;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("#");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("时间");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 200);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("标题");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 200);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("日志类型");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("模块");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("操作员");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("说明");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 500);
            style = HelperExcel.GetRowStyle(workbook);

            int index = 0;
            foreach (Log item in list)
            {
                RefreshData(item);
                index++;
                rowindex++;
                row = sheet.CreateRow(rowindex);
                row.HeightInPoints = HelperExcel.GetRowHeight();
                colindex = 0;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(index);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.AddTime.Value.ToString("yyyy-MM-dd HH:mm:ss"));
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.Title);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(GetTypeStr(item.Type));
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(GetModuleStr(item.Module));
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(UserGlobal.Instance.GetName(item.OperID));
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.Remark);
                cell.CellStyle = style;

            }

            style = HelperExcel.GetRowTotalStyle(workbook);
            rowindex++;
            row = sheet.CreateRow(rowindex);
            row.HeightInPoints = HelperExcel.GetRowHeight();
            colindex = 0;

            cell = row.CreateCell(colindex);
            cell.SetCellValue("合计");
            cell.CellStyle = style;

            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("");
            cell.CellStyle = style;

            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("");
            cell.CellStyle = style;

            string filename = title + ".xls";
            string childfolder = Guid.NewGuid().ToString("N").ToUpper();
            string folder = AppDomain.CurrentDomain.BaseDirectory + "api\\report\\" + childfolder;
            if (Directory.Exists(folder) == false)
                Directory.CreateDirectory(folder);

            string fullname = folder + "\\" + filename;
            FileStream fs = File.OpenWrite(fullname);
            workbook.Write(fs);
            fs.Close();

            //return ReportHttp + "/" + filename;
            return "/api/report/" + childfolder + "/" + filename;

        }






    }
}
