using Entity;
using MCSService.DAL;
using MCSService.Global;
using Microsoft.Owin;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.SS.Util;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using Tool;

namespace MCSService.Api.BLL
{
    public class BLLUser : BaseBLL
    {
        private readonly string _rolekey = "User_";

        private readonly DALUser _dal = new DALUser();
        
        private readonly DALLog _logDal = new DALLog();

        private void DealWithData(UserInfo data, bool detailed = false)
        {
            data.RoleName = RoleGlobal.Instance.GetRoleName(data.RoleID);
            data.AvatarHttp = "/api/avatar/" + data.AvatarName;
            //data.Menus = RoleGlobal.Instance.GetMenus(data.RoleID);

            if (detailed)
            { 

            }
            else
            {
                data.Pwd = null;
            }
            
   
        }

        public bool Verify(string loginname, string password)
        {
            try
            {
                UserInfo userinfo = _dal.Get(loginname);

                if (userinfo == null)
                    return false;

                if (userinfo.Enabled != 1)
                    return false;

                string pwd = HelperSecurity.SHAEncrypt(password);
                string pwdmid = HelperSecurity.DecryptPwd(userinfo.LoginName, userinfo.Pwd);
                if (pwd != pwdmid)
                    return false;

                return true;

            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);

            }
            return false;
        }

        public ResponseObject Login(RequestObject req,string clientIpAddress)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParam(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            if (req.Data.ContainsKey("LoginName") == false
                || req.Data.ContainsKey("Pwd") == false
                || req.Data.ContainsKey("Code") == false
                || req.Data.ContainsKey("CodeID") == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }


            Log log = new Log
            {
                Type = (int)LogType.Login,
                Module = (int)LogModule.User,
                Title = "登录",
                Identifier = req.Data["LoginName"].ToString(),
                Param1 = JsonConvert.SerializeObject(req, Formatting.Indented, JsonSettings.settings),
                Remark = req.Data["LoginName"].ToString() + ";" + clientIpAddress + ";",
                UserHostAddress = clientIpAddress,
            };

    
            string code = ImageCodeGlobal.GetInstance().Get(req.Data["CodeID"].ToString());
            if (string.IsNullOrWhiteSpace(code))
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "验证码异常";
                log.Status = (int)LogStatus.Fail;
                log.Remark += "验证码异常";
                _logDal.Add(log);
                return rsp;
            }
            if (code.ToLower() != req.Data["Code"].ToString().ToLower())
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "验证码异常";
                log.Status = (int)LogStatus.Fail;
                log.Remark += "验证码异常";
                _logDal.Add(log);
                return rsp;
            }

            //验证
            if (HelperString.VerifyLoginName(req.Data["LoginName"].ToString()) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "登录名异常";
                return rsp;
            }

            UserInfo userinfo = _dal.Get(req.Data["LoginName"].ToString());
            if (userinfo == null)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "登录名或密码错误";
                log.Status = (int)LogStatus.Fail;
                log.Remark += "登录名或密码错误";
                _logDal.Add(log);
                return rsp;
            }

            if (userinfo.Enabled != 1)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "帐号异常,没有登录权限";
                log.Status = (int)LogStatus.Fail;
                log.Remark += "帐号异常,没有登录权限";
                _logDal.Add(log);
                return rsp;
            }

            
                string pwd = HelperSecurity.SHAEncrypt(req.Data["Pwd"].ToString());
                string pwdmid = HelperSecurity.DecryptPwd(userinfo.LoginName, userinfo.Pwd);


            if (pwd != pwdmid)
            {

                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "登录名或密码错误";
                log.Status = (int)LogStatus.Fail;
                log.Remark += "登录名或密码错误";
                _logDal.Add(log);
                return rsp;

            }


            DealWithData(userinfo);
            rsp.Data = JObject.FromObject(userinfo);

            log.Status = (int)LogStatus.Success;
            _logDal.Add(log);
            return rsp;
        }

        public HttpResponseMessage SaveAvatar(HttpRequest httpRequest)
        {
            HttpResponseMessage rsp = new HttpResponseMessage();

            try
            {
                //注意文件长度限制，在Web.config的 httpRuntime 中限制
                //否则报错误：超过了最大请求长度

                var obj = httpRequest.Params["OperID"];
                if (obj == null)
                    throw new Exception("请求参数异常");

                long operid = long.Parse(obj.ToString());
                UserInfo user = _dal.Get(operid);

                if (user == null)
                    throw new Exception("请求参数异常");

                if (httpRequest.Files.Count == 0)
                    throw new Exception("请求参数异常");

                var postedFile = httpRequest.Files[0];
                string filename = string.Format("{0}_{1}_{2}", operid, Guid.NewGuid().ToString("N"), Path.GetExtension(postedFile.FileName));

                string folder = AppDomain.CurrentDomain.BaseDirectory + "api\\avatar";
                if (Directory.Exists(folder) == false)
                    Directory.CreateDirectory(folder);

                string filepath = folder + "\\" + filename;
                //保存文件
                postedFile.SaveAs(filepath);

                //修改
                JObject data = new JObject();
                data.Add("ID", user.ID);
                data.Add("AvatarName", filename);
                _dal.Modify(data);

                //删除原始文件
                string oldpath = folder + "\\" + user.AvatarName;
                if (File.Exists(oldpath))
                    File.Delete(oldpath);
                UserGlobal.Instance.Refresh();

                rsp.StatusCode = HttpStatusCode.OK;
                rsp.Content = new StringContent(JsonConvert.SerializeObject(new ResponseObject()), Encoding.UTF8, "application/json");
                return rsp;
            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);
                ResponseObject response = new ResponseObject();
                response.Code = ErrorCode.FileException;
                response.Msg = ex.Message;
                rsp.StatusCode = HttpStatusCode.InternalServerError;
                return rsp;
            }


        }

        public ResponseObject Modify(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }


            if (req.Data != null)
            {
                long id = long.Parse(req.Data["ID"].ToString());

                if (req.OperID != id)
                {
                    if (UserGlobal.Instance.HasPurview(req.OperID, _rolekey + PurviewKey.Modify) == false)
                    {
                        rsp.Code = ErrorCode.Parameter;
                        rsp.Msg = "没有操作权限";
                        return rsp;
                    }
                }

                UserInfo user = _dal.Get(id);
                if (user == null)
                {
                    rsp.Code = ErrorCode.Parameter;
                    rsp.Msg = "请求参数异常,未找到用户信息";
                    return rsp;
                }

                if (HelperJObject.IsString(req.Data, "Pwd"))
                {
                    //修改密码
                    string pwd = HelperSecurity.SHAEncrypt(req.Data["Pwd"].ToString());
                    req.Data["Pwd"] = HelperSecurity.EncryptPwd(user.LoginName, pwd);
                    _dal.Modify(req.Data);


                    _logDal.Add(new Log
                    {
                        Type = (int)LogType.Modify,
                        Module = (int)LogModule.User,
                        Title = "修改用户信息",
                        OperID = req.OperID,
                        Identifier = id.ToString(),
                        AddTime = DateTime.Now,
                        Remark = "修改密码",
                    });
                }
                else
                {
                    _dal.Modify(req.Data);
                    _logDal.Add(new Log
                    {
                        Type = (int)LogType.Modify,
                        Module = (int)LogModule.User,
                        Title = "修改用户信息",
                        OperID = req.OperID,
                        Identifier = id.ToString(),
                        AddTime = DateTime.Now,
                        Param1 = JsonConvert.SerializeObject(user, Formatting.Indented, JsonSettings.settings),
                        Param2 = JsonConvert.SerializeObject(req, Formatting.Indented, JsonSettings.settings),
                    });
                }


                UserGlobal.Instance.Refresh();

                return rsp;
            }

            if (req.Array != null)
            {
                List<Log> logs = new List<Log>();
                long id;

                foreach (JObject obj in req.Array)
                {
                    id = long.Parse(obj["ID"].ToString());
                    UserInfo user = _dal.Get(id);
                    if (user == null)
                    {
                        rsp.Code = ErrorCode.Parameter;
                        rsp.Msg = "请求参数异常,未找到用户信息";
                        return rsp;
                    }

                    logs.Add(new Log
                    {
                        Type = (int)LogType.Delete,
                        Module = (int)LogModule.User,
                        Title = "修改用户信息",
                        OperID = req.OperID,
                        Identifier = user.ID.ToString(),
                        Param1 = JsonConvert.SerializeObject(user, Formatting.Indented, JsonSettings.settings),
                        Param2 = obj.ToString(),
                    });
                }

                _dal.Modify(req.Array);
                UserGlobal.Instance.Refresh();
                BLLLog logBLL = new BLLLog();
                logBLL.Add(logs);
            }



            return rsp;

        }

        public ResponseObject ModifyPwd(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            try
            {
                if (req.Data.ContainsKey("ID") == false)
                {
                    rsp.Code = ErrorCode.Parameter;
                    rsp.Msg = "请求参数异常";
                    return rsp;
                }

                if (req.Data.ContainsKey("Pwd") == false)
                {
                    rsp.Code = ErrorCode.Parameter;
                    rsp.Msg = "请求参数异常";
                    return rsp;
                }

                UserInfo user = _dal.Get(long.Parse(req.Data["ID"].ToString()));
                if (user == null)
                {
                    rsp.Code = ErrorCode.Parameter;
                    rsp.Msg = "参数异常,未找到用户信息";
                    return rsp;
                }
                if (req.OperID != user.ID)
                {
                    if (UserGlobal.Instance.HasPurview(req.OperID, "User_Modify") == false)
                    {
                        rsp.Code = ErrorCode.Parameter;
                        rsp.Msg = "没有操作权限";
                        return rsp;
                    }
                }
                else
                {

                    if (req.Data.ContainsKey("OldPwd") == false)
                    {
                        rsp.Code = ErrorCode.Parameter;
                        rsp.Msg = "请求参数异常";
                        return rsp;
                    }
                    string oldpwd = req.Data["OldPwd"].ToString();
                    if (string.IsNullOrWhiteSpace(oldpwd) == false)
                        oldpwd = HelperSecurity.EncryptPwd(user.LoginName, oldpwd);

                    if (oldpwd != user.Pwd)
                    {
                        rsp.Code = ErrorCode.Parameter;
                        rsp.Msg = "密码错误";
                        return rsp;
                    }
                }

                string pwd = req.Data["Pwd"].ToString();
                pwd = HelperSecurity.EncryptPwd(user.LoginName,pwd);

                JObject obj = new JObject();
                obj.Add("ID", user.ID);
                obj.Add("Pwd", pwd);
                _dal.Modify(obj);
                BLLLog logBLL = new BLLLog();
                logBLL.Add(new Log
                {
                    Type = (int)LogType.Modify,
                    Module = (int)LogModule.User,
                    Title = "修改密码",
                    OperID = req.OperID,
                    Identifier = user.ID.ToString(),
                    Remark = string.Format("修改帐户密码：{0},{1}", user.LoginName, user.UserName),
                });

            }
            catch (Exception ex)
            {
                HelperLog.Error(ex.StackTrace + ex.Message);
                rsp.Code = ErrorCode.DBException;
                rsp.Msg = ex.Message;
            }

            return rsp;
        }

        public ResponseObject Get(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParam(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            JObject param = req.Data;
            if (HelperJObject.IsLong(param, "ID") == false
                && HelperJObject.IsString(param, "LoginName") == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            UserInfo user = _dal.Get(param);
            
            if (user == null)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "未找到用户信息";
                return rsp;
            }
            DealWithData(user);



            BLLLog logBLL = new BLLLog();
            List<Log> logs = logBLL.Gets(user.ID.ToString(), LogModule.User);

            rsp.Data = new JObject
                {
                    { "User", JObject.FromObject(user) },
                    { "Logs",JArray.FromObject(logs) }
                };


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
                rsp.Code = ErrorCode.NoPermission;
                rsp.Msg = "没有操作权限";
                return rsp;
            }

            JObject param = req.Data;

            _dal.Gets(param, false, out List<UserInfo> list, out int total);
            for(int i=0;i<list.Count;i++) 
                DealWithData(list[i]);


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

        public ResponseObject Add(RequestObject req)
        {

            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            if (UserGlobal.Instance.HasPurview(req.OperID, _rolekey + PurviewKey.Add) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "没有操作权限";
                return rsp;
            }


            UserInfo data = JsonConvert.DeserializeObject<UserInfo>(req.Data.ToString());

            if (string.IsNullOrWhiteSpace(data.UserName))
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "登录名错误";
                return rsp;
            }
            data.AddTime = DateTime.Now;
            data.RoleName = null;
            data.AvatarName = null;
            data.AvatarHttp = null;
            
            string pwd = HelperSecurity.SHAEncrypt(data.Pwd);
            data.Pwd = HelperSecurity.EncryptPwd(data.LoginName, pwd);

    
            _dal.Add(data);
            UserGlobal.Instance.Refresh();



            return rsp;
        }

        public ResponseObject Delete(RequestObject req)
        {
            ResponseObject rsp = new ResponseObject();
            if (VerifyPostParamOper(req) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            if (UserGlobal.Instance.HasPurview(req.OperID, _rolekey + PurviewKey.Delete) == false)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "没有操作权限";
                return rsp;
            }

            if (req.Data != null)
            {
                if (HelperJObject.IsLong(req.Data, "ID") == false)
                {
                    rsp.Code = ErrorCode.Parameter;
                    rsp.Msg = "请求参数异常";
                    return rsp;
                }
                long id = long.Parse(req.Data["ID"].ToString());

                UserInfo user = _dal.Get(id);
                if (user == null)
                {
                    rsp.Code = ErrorCode.Parameter;
                    rsp.Msg = "请求参数异常,未找到用户信息";
                    return rsp;
                }
                _dal.Delete(id);
                UserGlobal.Instance.Refresh();
                BLLLog logBLL = new BLLLog();
                logBLL.Add(new Log
                {
                    Type = (int)LogType.Delete,
                    Module = (int)LogModule.User,
                    Title = "删除用户信息",
                    OperID = req.OperID,
                    Identifier = user.ID.ToString(),
                    Param1 = JsonConvert.SerializeObject(user, Formatting.Indented, JsonSettings.settings),
                    Remark = string.Format("{0},{1}", user.LoginName, user.UserName),
                });

                return rsp;
            }



            if (req.Array != null)
            {

                List<Log> logs = new List<Log>();
                long id;
                List<long> list = new List<long>();
                foreach (JObject obj in req.Array)
                {
                    id = long.Parse(obj["ID"].ToString());
                    list.Add(id);
                    UserInfo user = _dal.Get(id);
                    if (user == null)
                    {
                        rsp.Code = ErrorCode.Parameter;
                        rsp.Msg = "请求参数异常,未找到用户信息";
                        return rsp;
                    }

                    logs.Add(new Log
                    {
                        Type = (int)LogType.Delete,
                        Module = (int)LogModule.User,
                        Title = "删除用户信息",
                        OperID = req.OperID,
                        Identifier = user.ID.ToString(),
                        Param1 = JsonConvert.SerializeObject(user, Formatting.Indented, JsonSettings.settings),
                        Remark = string.Format("{0},{1}", user.LoginName, user.UserName),
                    });

                }
                _dal.Delete(list);
                UserGlobal.Instance.Refresh();
                BLLLog logBLL = new BLLLog();
                logBLL.Add(logs);
            }

            return rsp;
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
                rsp.Code = ErrorCode.NoPermission;
                rsp.Msg = "没有操作权限";
                return rsp;
            }

            JObject param = JObject.Parse(req.Params);
            if (param == null)
            {
                rsp.Code = ErrorCode.Parameter;
                rsp.Msg = "请求参数异常";
                return rsp;
            }

            List<UserInfo> list = _dal.GetAll(param, false);

            string url = BuildReport(list, "用户信息");
            JObject data = new JObject
                {
                    { "Url", url },
                };

            rsp.Data = data;

            return rsp;
        }

        public string BuildReport(List<UserInfo> list, string title)
        {

            HSSFWorkbook workbook = new HSSFWorkbook();
            ISheet sheet = workbook.CreateSheet(DateTime.Now.ToString("yyyyMMddHHmmss"));
            HelperExcel.InitSheet(sheet);

            IRow row;
            ICell cell;
            int rowindex = 0;

            //标题
            row = sheet.CreateRow(rowindex);
            int colindex = 0;
            cell = row.CreateCell(colindex);
            cell.SetCellValue(title);
            cell.CellStyle = HelperExcel.GetTitleStyle(workbook);
            row.HeightInPoints = 40;
            sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, 9));

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
            cell.SetCellValue("状态");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("登录名");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("用户名");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("角色");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("工号");
            cell.CellStyle = style;
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("电话");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("邮箱");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 150);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("录入时间");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 200);
            colindex++;
            cell = row.CreateCell(colindex);
            cell.SetCellValue("说明");
            cell.CellStyle = style;
            sheet.SetColumnWidth(colindex, 30 * 200);

            style = HelperExcel.GetRowStyle(workbook);
            int index = 0;
            foreach (UserInfo item in list)
            {
                DealWithData(item);
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
                cell.SetCellValue(item.Enabled == 1 ? "正常" : "禁用");
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.LoginName);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.UserName);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.RoleName);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.JobNumber);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.Phone);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.Email);
                cell.CellStyle = style;

                colindex++;
                cell = row.CreateCell(colindex);
                cell.SetCellValue(item.AddTime.Value.ToString("yyyy-MM-dd HH:mm:ss"));
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