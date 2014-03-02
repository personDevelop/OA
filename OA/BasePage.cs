using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
}