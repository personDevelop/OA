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
    public class WorkInfoSaveHandler : IHttpHandler, IRequiresSessionState
    {
        WorkInfo entity = new WorkInfo();
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
                }
                else
                {
                    entity.ID = new Guid(rp["txtID"]);
                    entity.RecordStatus = StatusType.update;
                }
                entity.SbID = new Guid(rp["txtSbID"]);  
                entity.GuZhangXx = rp["txtGuZhangXx"]; 
                entity.ChuLiYiJian = rp["txtChuLiYiJian"]; 
                if (!string.IsNullOrEmpty(rp["txtPlanTime"]))
                {
                    entity.PlanTime = DateTime.Parse(rp["txtPlanTime"]);
                } 
                entity.Status = "制单"; 
                if (string.IsNullOrEmpty(context.Session["UserName"] as string))
                { 
                    entity.CreaterID = Guid.NewGuid();
                    entity.CreaterName = "管理员";
                }
                else
                {
                    entity.CreaterID = new Guid(context.Session["UserID"].ToString());
                    entity.CreaterName = context.Session["UserName"] as string;
                }
                if (!string.IsNullOrEmpty(rp["txtRealTime"]))
                {
                    entity.RealTime = DateTime.Parse(rp["txtRealTime"]);
                } 
                entity.Note = rp["txtNote"];

                if (!string.IsNullOrEmpty(rp["txtCity"]))
                {
                    entity.City = new Guid(rp["txtCity"]);
                }

                if (!string.IsNullOrEmpty(rp["txtXian"]))
                {
                    entity.Xian = new Guid(rp["txtXian"]);
                }
                 
                if (!string.IsNullOrEmpty(rp["txtZhen"]))
                {
                    entity.Zhen = new Guid(rp["txtZhen"]);
                } 
                entity.Address = rp["txtAddress"]; 
                entity.Tel = rp["txtTel"]; 
                entity.CreateDate = DateTime.Now;
                WorkInfoManager manager = new WorkInfoManager();
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
