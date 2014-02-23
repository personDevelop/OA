using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;

namespace OA.handler
{
    /// <summary>
    /// YuanGongKaoQinListHandler 的摘要说明
    /// </summary>
    public class YuanGongKaoQinListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            YuanGongKaoQinManager manager = new YuanGongKaoQinManager();
            HttpRequest rp = context.Request;
            DataTable dt = manager.GetDataTable(DateTime.Parse(rp["KQRQ"]));
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write(result);
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


