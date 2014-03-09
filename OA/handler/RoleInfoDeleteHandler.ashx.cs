using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Text;

namespace OA.handler
{
    /// <summary>
    /// RoleInfoDeleteHandler 的摘要说明
    /// </summary>
    public class RoleInfoDeleteHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            string msg = string.Empty;
            try
            {

                if (string.IsNullOrEmpty(rp["ID"]))
                {
                    msg = "请选择要删除的数据！";
                }
                else
                {
                    int i = new RoleInfoManager().DelateRole(new Guid(rp["ID"]));
                    if (i > 0)
                    {
                        context.Response.Write("{\"success\":\"true\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"success\":\"true\"}");
                        msg = "删除失败！";

                    }

                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;

            }
            if (!string.IsNullOrEmpty(msg))
            {
                byte[] bytes = Encoding.UTF8.GetBytes(msg.Replace("\r\n", "<br/>"));
                string encode = Convert.ToBase64String(bytes);
                context.Response.Write("{\"success\":\"false\",\"msg\":\"" + encode + "\"}");
            }
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