using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sharp.Common;
using OAManager;
using OAEntity;
using System.Data;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// GetDepartPersonHandler 的摘要说明
    /// </summary>
    public class GetDepartPersonHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest rp = context.Request;
            context.Response.ContentType = "text/plain";
            AdministrativeRegionsManager manager = new AdministrativeRegionsManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]);
            string fiter = rp["filtervalue0"];
            WhereClip where = null;
            if (!string.IsNullOrEmpty(fiter))
            {
                fiter = fiter.Trim();
                where = (PersonInfo._.UserName.Contains(fiter) || PersonInfo._.RealName.Contains(fiter));
            }
            int count = 0, recordCount = 0;
            DataTable dt = manager.GetPersonByDepartID(currentPage + 1, pageSize, where, rp["DepartID"], false, ref count, ref recordCount);
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