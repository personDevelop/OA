﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;
using Sharp.Common;
using OAEntity;

namespace OA.handler
{
    /// <summary>
    /// DayLogListHandler 的摘要说明
    /// </summary>
    public class DayLogListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            DayLogManager manager = new DayLogManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]);

            int count = 0, recordCount = 0;
            string workstatus = rp["Workstatus"];
            WhereClip where = null;
            if (!string.IsNullOrEmpty(workstatus))
            {
                where = DayLog._.UserID == workstatus;
            }

            DataTable dt = manager.GetDataTable(currentPage + 1, pageSize, where, DayLog._.WordDate.Desc, ref count, ref recordCount);
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


