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
            string user = UserSetLogic.S;

        }
    }
}