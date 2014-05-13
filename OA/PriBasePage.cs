using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OA
{
    /// <summary>
    /// 前段页面基类
    /// </summary>
    public class PriBasePage : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                string path = this.Request.FilePath.ToLower();
                if (path.EndsWith("login.aspx") || path.EndsWith("randomcode.aspx"))
                {


                }
                else
                {
                    Response.Redirect("login.aspx?ref=" + this.Request.Url.PathAndQuery);

                }
            }
            new UserSetLogic();

        }
    }
}