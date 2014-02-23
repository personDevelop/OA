using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;

namespace OA.handler
{
    /// <summary>
    /// RoleInfoListHandler 的摘要说明
    /// </summary>
    public class RoleInfoListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            RoleInfoManager manager = new RoleInfoManager();
            DataTable dt = manager.GetDataTable();
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write(result);
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


