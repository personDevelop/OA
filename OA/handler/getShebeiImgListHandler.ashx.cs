using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using OAEntity;
using System.Data;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// Summary description for getShebeiImgListHandler
    /// </summary>
    public class getShebeiImgListHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            ShebeiInfoManager manager = new ShebeiInfoManager();
            DataTable dt = manager.GetDataTable();
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{\"rows\":" + result + "}");
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