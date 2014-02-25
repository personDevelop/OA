using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;

namespace OA.handler
{
    /// <summary>
    /// FileInfoListHandler 的摘要说明
    /// </summary>
    public class FileInfoListHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sid = context.Request.Form["sid"].ToString();//获取id值
            FileInfoManager manager = new FileInfoManager();

            DataTable dt = manager.GetDataTable(sid);
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



