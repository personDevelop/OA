﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;

namespace OA
{
    public partial class NoticeInfoEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    //修改
                    LoadData(Request.QueryString["ID"]);
                }
                else
                {
                    //新增

                }
            }

        }

        private void LoadData(string ID)
        {
            NoticeInfo nt = new NoticeInfoManager().GetItemById(new Guid(ID));

            txtID.Value = nt.ID.ToString();
            txtCODE.Value = nt.CODE.ToString();
            txtCONTENT.Value = nt.CONTENT.ToString();
            txtISTOP.Checked = Convert.ToBoolean(nt.ISTOP);
            txtISUSED.Checked =Convert.ToBoolean(nt.ISUSED);
            txtPUBDATE.Value = nt.PUBDATE.ToString();
            txtPUBUSER.Value = nt.PUBUSER.ToString();
            txtSOURCE.Value = nt.SOURCE.ToString();
            txtTITLE.Value = nt.TITLE.ToString();

        }
    }
}