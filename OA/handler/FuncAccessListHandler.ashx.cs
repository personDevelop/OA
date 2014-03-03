using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;

namespace OA.handler
{
    /// <summary>
    /// FuncAccessListHandler 的摘要说明
    /// </summary>
    public class FuncAccessListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
             
            context.Response.ContentType = "text/plain";
            FuncAccessManager manager = new FuncAccessManager();
            HttpRequest rp = context.Request;
            Guid roleID = new Guid(rp["roleID"]);
            DataTable dt = manager.GetDataTable(roleID);
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


