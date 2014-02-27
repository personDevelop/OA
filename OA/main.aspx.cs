﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;
using Sharp.Common;
using Sharp.Data;

namespace OA
{
    public partial class main : System.Web.UI.Page
    {
        string userid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = string.Empty;
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {

                }
                else
                {
                    PersonInfo pr = new PersonInfo();
                    PersonInfoManager prMgr = new PersonInfoManager();
                    WhereClip where = PersonInfo._.UserName == Session["UserName"].ToString();
                    pr = prMgr.GetItemById(where);
                    if (pr != null)
                    {
                        userid = pr.ID.ToString();
                        uid.Value = pr.ID.ToString();
                    }
                    LabelUser.Text = "您好,"+Session["UserName"].ToString();
                }
            }

        }
    }
}