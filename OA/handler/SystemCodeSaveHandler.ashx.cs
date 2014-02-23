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
    public class SystemCodeSaveHandler : IHttpHandler
    {
        SystemCode entity = new SystemCode();
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

                entity.Code = rp["txtCode"];
                entity.Name = rp["txtName"];
                if (!string.IsNullOrEmpty(rp["txtParentId"]))
                {

                    entity.ParentId = new Guid(rp["txtParentId"]);
                }
                entity.ParentName = rp["txtParentName"];
                entity.IsEnable = rp["txtIsEnable"] == "on";
                entity.ResValue = rp["txtResValue"];
                entity.Node = rp["txtNode"];

                SystemCodeManager manager = new SystemCodeManager();
                bool IsExit = manager.ExitCodeAndName(entity);
                if (IsExit)
                {
                    msg = "已存在相同编号或名称！";
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