using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;

namespace OA.handler
{
    /// <summary>
    /// WorkHandler 的摘要说明
    /// </summary>
    public class WorkHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sbid = context.Request.QueryString["sbid"]; 
            string type = context.Request.QueryString["type"];
            DataTable dt = new WorkInfoManager().GetWorkHandType(sbid, type); 
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{\"total\":\"1\",\"rows\":" + result + "}");
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