﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OA
{
    public partial class DayLogList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hidUserId.Value = Request.QueryString["id"];
                txtTime1.Value = DateTime.Now.ToString("yyyy-MM-01");
                txtTime2.Value = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
    }
}