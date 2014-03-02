using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OAEntity;
using OAManager;
using Sharp.Common;
using Sharp.Data;

namespace OA.handler
{
    /// <summary>
    /// Summary description for YuanGongKaoQinQueryHandler
    /// </summary>
    public class YuanGongKaoQinQueryHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            YuanGongKaoQinManager manager = new YuanGongKaoQinManager();
            int pageNum = int.Parse(context.Request.QueryString.Get("pagenum"));
            int pagesize = int.Parse(context.Request.QueryString.Get("pagesize"));
            int recordCount = 0;
            WhereClip where = null;
            if (!string.IsNullOrEmpty(context.Request["USER"]))
            {
                where = YuanGongKaoQin._.UserName.Like("%" + context.Request["USER"] + "%");

            }
            else
            {
                where = YuanGongKaoQin._.UserName.Like("%%");
 
            }

            if (!string.IsNullOrEmpty(context.Request["KQRQ"]))
            {
                string []datestr=context.Request["KQRQ"].ToString().Split('@');
                string begin = datestr[0];
                if (!string.IsNullOrEmpty(begin))
                {
                    where.And(YuanGongKaoQin._.KQRQ >= begin);
                }
                string end = datestr[1];
                if (!string.IsNullOrEmpty(end))
                {
                    where.And(YuanGongKaoQin._.KQRQ <= end);
                }
            }
            DataTable dt = manager.GetDataTable(pageNum + 1, pagesize, where, "  ", ref pagesize, ref recordCount);
            //manager.GetDataTable();
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{\"total\":\"" + recordCount.ToString() + "\",\"rows\":" + result + "}");
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