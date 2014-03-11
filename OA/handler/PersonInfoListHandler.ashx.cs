using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;
using OAEntity;
using Sharp.Common;

namespace OA.handler
{
    /// <summary>
    /// PersonInfoListHandler 的摘要说明
    /// </summary>
    public class PersonInfoListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest rp = context.Request;
            context.Response.ContentType = "text/plain";
            PersonInfoManager manager = new PersonInfoManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]);
            int count = 0, recordCount = 0;
            string filter = context.Request["filtervalue0"];
            WhereClip where = null;
            if (!string.IsNullOrEmpty(filter))
            {
                filter = filter.Trim();

                where = (PersonInfo._.UserName.Contains(filter) || PersonInfo._.RealName.Contains(filter));
            }
            DataTable dt = manager.GetDataTable(currentPage + 1, pageSize, where, PersonInfo._.UserName.Asc, ref count, ref recordCount);
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


