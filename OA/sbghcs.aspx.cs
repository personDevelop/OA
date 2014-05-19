using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAManager;
using OAEntity;

namespace OA
{
    public partial class sbghcs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                //修改\
                txtID.Value = Request.QueryString["ID"].ToString();
                ShebeiInfo sb = new ShebeiInfoManager().GetItemById(new Guid(txtID.Value));
                txtSbName.InnerText = sb.Name + "(" + sb.Code + ")";
            }
        }
    }
}