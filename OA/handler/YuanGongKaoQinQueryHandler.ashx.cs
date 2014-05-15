using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OAEntity;
using OAManager;
using Sharp.Common;
using Sharp.Data;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// Summary description for YuanGongKaoQinQueryHandler
    /// </summary>
    public class YuanGongKaoQinQueryHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            YuanGongKaoQinManager manager = new YuanGongKaoQinManager();
            int pageNum = int.Parse(context.Request.QueryString.Get("pagenum"));
            int pagesize = int.Parse(context.Request.QueryString.Get("pagesize"));
            int recordCount = 0;
            WhereClip where = new WhereClip();
            if (!string.IsNullOrEmpty(context.Request["USER"]))
            {
                where = YuanGongKaoQin._.UserName.Contains(context.Request["USER"]);

            }

            if (!string.IsNullOrEmpty(context.Request["begindate"]))
            {

                string begin = context.Request["begindate"];
                if (!string.IsNullOrEmpty(begin))
                {
                    where = where && YuanGongKaoQin._.KQRQ >= begin;

                }
            }
            if (!string.IsNullOrEmpty(context.Request["enddate"]))
            {

                string enddate = context.Request["enddate"];
                if (!string.IsNullOrEmpty(enddate))
                {
                    where = where && YuanGongKaoQin._.KQRQ <= enddate;

                }
            }
            if (!string.IsNullOrEmpty(context.Request["swstatus"]))
            {
                where = YuanGongKaoQin._.SWStatus==context.Request["swstatus"] ;

            }

            if (!string.IsNullOrEmpty(context.Request["status"]))
            {
                where = YuanGongKaoQin._.Status == context.Request["status"];

            }


            if (!string.IsNullOrEmpty(context.Request["KQRQ"]))
            {
                string[] datestr = context.Request["KQRQ"].ToString().Split('@');
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
            string or = "UserName";
            if (!string.IsNullOrEmpty(context.Request["sortdatafield"]))
            {
                if (!string.IsNullOrEmpty(context.Request["sortorder"]) && context.Request["sortorder"] == "desc")
                {
                    or = context.Request["sortdatafield"] + " desc" ;
                }
                else
                {
                    or =  context.Request["sortdatafield"] ;
                }

            }
            DataTable dt = manager.GetDataTable(pageNum + 1, pagesize, where, or, ref pagesize, ref recordCount);
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