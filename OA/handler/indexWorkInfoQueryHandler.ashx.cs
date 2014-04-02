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
    /// Summary description for WorkInfoQueryHandler
    /// </summary>
    public class indexWorkInfoQueryHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            HttpRequest rp = context.Request;
            WorkInfoManager manager = new WorkInfoManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]) ;

            int count = 0, recordCount = 0;
            string workstatus = rp["Workstatus"];
            WhereClip where = new WhereClip();

            if (!string.IsNullOrEmpty(workstatus))
            {
                where.And(WorkInfo._.Status == workstatus);
            }


            if (!string.IsNullOrEmpty(context.Request["begindate"]))
            {

                string begin = context.Request["begindate"];
                if (!string.IsNullOrEmpty(begin))
                {
                    where = where && WorkInfo._.CreateDate >= begin;

                }
            }
            if (!string.IsNullOrEmpty(context.Request["enddate"]))
            {

                string enddate = context.Request["enddate"];
                if (!string.IsNullOrEmpty(enddate))
                {
                    where = where && WorkInfo._.CreateDate <= enddate;

                }
            }
            if (!string.IsNullOrEmpty(context.Request["username"]))
            {
                where = where && WorkInfo._.CurrentUser.Contains(context.Request["username"]);

            }

            if (!string.IsNullOrEmpty(context.Request["sbcode"]))
            {
                where = where && ShebeiInfo._.Code.Contains(context.Request["sbcode"]);


            }

            if (!string.IsNullOrEmpty(context.Request["sbname"]))
            {
                where = where && ShebeiInfo._.Name.Contains(context.Request["sbname"]);
            }
            OrderByClip or = WorkInfo._.CreateDate.Desc;
            if (!string.IsNullOrEmpty(context.Request["sortdatafield"]))
            {
                if (!string.IsNullOrEmpty(context.Request["sortorder"]) && context.Request["sortorder"] == "desc")
                {
                    or = new OrderByClip(context.Request["sortdatafield"] + " desc");
                }
                else
                {
                    or = new OrderByClip(context.Request["sortdatafield"]);
                }

            } 
            DataTable dt = manager.GetDataTable(currentPage + 1, pageSize, where, or, ref count, ref recordCount);
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