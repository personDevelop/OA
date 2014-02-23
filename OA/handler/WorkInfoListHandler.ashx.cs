using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;
using System.Text;
using OAEntity;
using Sharp.Common;

namespace OA.handler
{
    /// <summary>
    /// WorkInfoListHandler 的摘要说明
    /// </summary>
    public class WorkInfoListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            HttpRequest rp = context.Request;
            WorkInfoManager manager = new WorkInfoManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]);

            int count = 0, recordCount = 0;
            string workstatus = rp["Workstatus"];
            WhereClip where = null;
            if (!string.IsNullOrEmpty(workstatus))
            {
                where = WorkInfo._.Status == workstatus;
            }

            DataTable dt = manager.GetDataTable(currentPage + 1, pageSize, where, WorkInfo._.CreateDate.Desc, ref count, ref recordCount);
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


