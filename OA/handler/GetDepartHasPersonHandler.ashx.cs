using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// GetDepartHasPersonHandler 的摘要说明
    /// </summary>
    public class GetDepartHasPersonHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest rp = context.Request;
            context.Response.ContentType = "text/plain";
            AdministrativeRegionsManager manager = new AdministrativeRegionsManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]);
            int count = 0, recordCount = 0;
            DataTable dt = manager.GetPersonByDepartID(currentPage + 1, pageSize, null, rp["departid"], true, ref count, ref recordCount);
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{ \"totalRecords\":\"" + recordCount + "\",\"rows\":" + result + "}");
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