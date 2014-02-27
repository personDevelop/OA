using System;
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
    /// ShebeiInfoListHandler 的摘要说明
    /// </summary>
    public class ShebeiInfoListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            ShebeiInfoManager manager = new ShebeiInfoManager();
            int pageNum = int.Parse(context.Request.QueryString.Get("pagenum"));
            int pagesize = int.Parse(context.Request.QueryString.Get("pagesize"));
            int recordCount=0;
            WhereClip where = null;
            if (!string.IsNullOrEmpty(context.Request["status"]))
            {
                where= ShebeiInfo._.State!=context.Request["status"];
               
            }
            DataTable dt = manager.GetDataTable(pageNum + 1, pagesize,where, " CODE ", ref pagesize, ref recordCount);
            //manager.GetDataTable();
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{\"total\":\"" + recordCount.ToString() + "\",\"rows\":"+result+"}");
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



