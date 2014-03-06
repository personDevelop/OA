using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;

namespace OA
{
    public partial class NoticeInfoEdit : BasePage
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
                    txtPUBUSER.Value = Session["UserName"].ToString();

                }
            }

        }

        private void LoadData(string ID)
        {
            NoticeInfo nt = new NoticeInfoManager().GetItemById(new Guid(ID));

            txtID.Value = nt.ID.ToString();
            txtCODE.Value = nt.CODE;
            txtCONTENT.Value = nt.CONTENT.ToString();
            txtISTOP.Checked = nt.ISTOP.Value;
            txtISUSED.Checked = nt.ISTOP.Value;
            hidPUBDATE.Value = nt.PUBDATE; 
            txtPUBUSER.Value = nt.PUBUSER;
            txtSOURCE.Value = nt.SOURCE;
            txtTITLE.Value = nt.TITLE;

        }
    }
}