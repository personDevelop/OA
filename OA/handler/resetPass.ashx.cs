using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using OAManager;
using OAEntity;

namespace OA.handler
{
    /// <summary>
    /// Summary description for resetPass
    /// </summary>
    public class resetPass : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            try
            {
                context.Response.ContentType = "text/plain";
                string p1 = context.Request.Form["p1"].ToString();//获取id值
                string p2 = context.Request.Form["p2"].ToString();//获取id值
                string p3 = context.Request.Form["p3"].ToString();//获取id值
                string userName = context.Session["UserName"].ToString();
                PersonInfo pr = new PersonInfo();
                PersonInfoManager prMgr = new PersonInfoManager();
                if (!prMgr.checkUserIndentity(p1, userName))
                {
                    context.Response.Write("原密码不正确！");
                    return;
                }
                else
                {
                    prMgr.UpdatePwd(userName, p2);
                    context.Response.Write("");
                }
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.Message);
            }
            //prMgr.GetItemById(
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