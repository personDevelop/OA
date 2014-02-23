using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAManager;
using System.Data;
using OAEntity;

namespace OA
{
    public partial class WorkHandLogEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WorkInfoManager Manager = new WorkInfoManager();
                txtWorkID.Value = Request.QueryString["ID"];
                DataTable dt = Manager.GetWorkInfo(txtWorkID.Value);
                if (dt.Rows.Count == 1)
                { 
                    txtChuliYj.Value = dt.Rows[0]["ChuLiYiJian"] as string;
                    txtShebei.Value = dt.Rows[0]["ShebeiName"] as string;
                    txtGZXX.Value = dt.Rows[0]["GuZhangXx"] as string;
                    txtCurrentStaus.Value = dt.Rows[0]["Status"] as string;
                    WorkHandLog last = Manager.GetLstWorkHandInfo(txtWorkID.Value);
                    if (last != null)
                    {
                        txtLastHandle.Value = last.ChuliYj;
                    }
                }
            }
        }
    }
}