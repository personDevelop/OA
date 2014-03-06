using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;

namespace OA
{
    public class BasePage : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                string path = this.Request.FilePath.ToLower();
                if (path.EndsWith("login.aspx") || path.EndsWith("randomcode.aspx") || path.EndsWith("index.aspx"))
                {


                }
                else
                {
                    Response.Redirect("login.aspx");

                }
            }
            new UserSetLogic();

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string path = this.Request.FilePath.ToLower();

            if (path.EndsWith("adminIndex.aspx") || path.EndsWith("main.aspx") || path.EndsWith("login.aspx") || path.EndsWith("randomcode.aspx") || path.EndsWith("index.aspx") || path.Contains("edit.aspx")||path.EndsWith("resetpwd.aspx") )
            {
 

            }
            else
            {
                //权限判断
                //先获取当前功能
                string funcUrl = path.Substring(path.LastIndexOf("/") + 1);
                bool hasAcc = new FuncAccessManager().HasAccess(Session["UserID"].ToString(), Session["UserName"].ToString(), funcUrl);
                if (!hasAcc)
                {
                    Response.Write("<script>alert('您没有当前功能权限！');</script>");
                    Response.End();
                }
            }
        }

    }
}