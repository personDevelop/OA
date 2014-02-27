using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// Summary description for clearstate
    /// </summary>
    public class clearState : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                context.Response.ContentType = "text/plain";
                CleanSession(context);
                context.Response.Write("{\"Result\":\"1\",\"Msg\":\"注销成功！\"}");
            }
            catch (Exception ex)
            {
                context.Response.Write("访问Web服务器出错！");
            }
        }
        private void CleanSession(HttpContext context)
        {
            context.Session["UserName"] = null;//清空session
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