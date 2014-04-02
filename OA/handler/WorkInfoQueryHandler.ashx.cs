﻿using System;
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
    public class WorkInfoQueryHandler : IHttpHandler
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
            WhereClip where = null;
            where = WorkInfo._.CreateDate.Like("%%");
            if (!string.IsNullOrEmpty(workstatus))
            {
                where.And( WorkInfo._.Status == workstatus);
            }

       
            if (!string.IsNullOrEmpty(context.Request["RQ"]))
            {
                string[] datestr = context.Request["RQ"].ToString().Split('@');
                string begin = datestr[0];
                if (!string.IsNullOrEmpty(begin))
                {
                    where.And(WorkInfo._.CreateDate >= begin);
                }
                string end = datestr[1];
                if (!string.IsNullOrEmpty(end))
                {
                    where.And(WorkInfo._.CreateDate <= end);
                }
            }
            if (!string.IsNullOrEmpty(context.Request["USERNAME"]))
            {
                where.And(WorkInfo._.CreaterName.Like("%" + context.Request["USERNAME"].ToString() + "%"));
            }

            if (!string.IsNullOrEmpty(context.Request["SBNAME"]))
            {
                where.And(ShebeiInfo._.Name.Like("%" + context.Request["SBNAME"].ToString() + "%"));
            }
            if (!string.IsNullOrEmpty(context.Request["SBZT"]))
            {
                where.And(WorkInfo._.Status.Like("%" + context.Request["SBZT"].ToString() + "%"));
            }
            if (!string.IsNullOrEmpty(context.Request["GZXX"]))
            {
                where.And(WorkInfo._.GuZhangXx.Like("%"+context.Request["GZXX"].ToString()+"%"));
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