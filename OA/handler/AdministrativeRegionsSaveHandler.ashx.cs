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
    public class AdministrativeRegionsSaveHandler : IHttpHandler
    {
        AdministrativeRegions entity = new AdministrativeRegions();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            string msg = string.Empty;
            try
            {
                AdministrativeRegionsManager manager = new AdministrativeRegionsManager();
                if (string.IsNullOrEmpty(rp["txtID"]))
                {
                    entity.ID = Guid.NewGuid();
                    if (!string.IsNullOrEmpty(rp["txtParentID"]))
                    {
                        entity.ParentID = new Guid(rp["txtParentID"]);
                        AdministrativeRegions paraent = manager.GetItemById(entity.ParentID.Value);
                        entity.ParentName = rp["txtParentName"];
                        entity.ClassCode = paraent.ClassCode + entity.ID + ";";
                    }
                    else
                    {
                        entity.ClassCode = entity.ID + ";";
                    }
                }
                else
                {
                    entity.ID = new Guid(rp["txtID"]);
                    entity.RecordStatus = StatusType.update;
                }
                entity.Code = rp["txtCode"];
                entity.Name = rp["txtName"];
                entity.ZipCode = rp["txtZipCode"];
                entity.Phone = rp["txtPhone"];
                entity.Note = rp["txtNote"];
                entity.ShortName = rp["txtShortName"];
                bool IsExit = manager.ExitCodeAndName(entity);//重复校验参考
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
