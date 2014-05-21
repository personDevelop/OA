using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Text;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// DayLogDeleteHandler 的摘要说明
    /// </summary>
    public class DayLogDeleteHandler : IHttpHandler, IRequiresSessionState
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
                    if (context.Session["UserName"].ToString().ToLower() != "admin")
                    {
                        msg = "只有管理员才可以删除！";

                    }
                    else
                    {
                        int i = new DayLogManager().DelateById(new Guid(rp["ID"]));
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