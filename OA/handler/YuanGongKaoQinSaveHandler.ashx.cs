using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Text;

namespace OA.handler
{
    /// <summary>
    /// 保存 系统参数表
    /// </summary>
    public class YuanGongKaoQinSaveHandler : IHttpHandler
    {
        YuanGongKaoQin entity = new YuanGongKaoQin();
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
                        entity.CreaterID = new Guid(context.Session["UserID"].ToString());
                        entity.CreateDate = DateTime.Now;
                    }
                }
                else
                {
                    entity.ID = new Guid(rp["txtID"]);
                    entity.RecordStatus = StatusType.update;
                    if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                    {
                        entity.UpdaterID = new Guid(context.Session["UserID"].ToString());
                        entity.Updatedate = DateTime.Now;
                    }
                }
                entity.UserID = new Guid(rp["txtUserID"]); 
                entity.UserName = rp["txtUserName"]; 
                entity.StartTime = rp["txtStartTime"]; 
                entity.EndTime = rp["txtEndTime"];
                entity.KQRQ = DateTime.Parse(rp["txtKQRQ"]);
                entity.Status = rp["txtStatus"];
                entity.Note = rp["txtNote"];
                YuanGongKaoQinManager manager = new YuanGongKaoQinManager(); 
                manager.Save(entity);
                context.Response.Write("{\"success\":\"true\",\"ID\":\"" + entity.ID + "\"}");

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
