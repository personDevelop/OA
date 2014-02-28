using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Text;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// 保存 系统参数表
    /// </summary>
    public class DayLogSaveHandler : IHttpHandler, IRequiresSessionState
    {
        DayLog entity = new DayLog();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            string msg = string.Empty;
            try
            {

                if (string.IsNullOrEmpty(rp["txtID"]))
                {
                    entity.ID = Guid.NewGuid();
                    if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                    {
                        entity.UserID = new Guid(context.Session["UserID"].ToString());
                        entity.UserName = context.Session["UserName"] as string;
                        entity.CreateDate = DateTime.Now;
                    }
                    else
                    {
                        entity.UserID = Guid.NewGuid();
                        entity.UserName = "test";
 
                    }
                }
                else
                {
                    entity.ID = new Guid(rp["txtID"]);
                    entity.UserID = Guid.NewGuid();
                    entity.UserName = "test";
                    entity.RecordStatus = StatusType.update;
                } 
                entity.Content = rp["txtContent"]; 
                entity.GS = rp["txtGS"];
                entity.WordDate = DateTime.Parse(rp["txtWordDate"]);
                entity.CreateDate = DateTime.Now;
                DayLogManager manager = new DayLogManager();
                bool IsExit = manager.ExitDayLog(entity);//日期重复校验参考
                if (IsExit)
                {
                    msg = "今天已填写过工作日志！";
                }
                else
                {
                    manager.Save(entity);
                    context.Response.Write("{\"success\":\"true\",\"ID\":\"" + entity.ID + "\"}");
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }
            if (!string.IsNullOrEmpty(msg))
            {
                byte[] bytes = Encoding.UTF8.GetBytes(msg.Replace("\r\n", "<br/>"));
                string encode = Convert.ToBase64String(bytes);
                context.Response.Write("{\"success\":\"false\",\"msg\":\"" + encode + "\"}");
            }
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

}
