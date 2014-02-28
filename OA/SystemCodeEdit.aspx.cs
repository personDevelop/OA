using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using OAEntity;
using OAManager;
using Sharp.Common;

namespace OA
{
    public partial class SystemCodeEdit : BasePage
    {
        SystemCode entity = new SystemCode();
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
                    txtParentId.Value = Request.QueryString["ParentId"];
                    txtParentName.Value = Request.QueryString["ParentName"];
                } 
            }
        }

        private void LoadData(string ID)
        {
            SystemCode code = new OAManager.SystemCodeManager().GetItemById(new Guid(ID));
            txtID.Value = code.ID.ToString();
            txtCode.Value = code.Code;
            txtName.Value = code.Name;
            txtIsEnable.Checked = code.IsEnable;
            txtResValue.Value = code.ResValue;
            txtNode.Value = code.Node;
            if (code.ParentId.HasValue)
            {
                txtParentId.Value = code.ParentId.ToString();
                txtParentName.Value = code.ParentName;
            }
            else
            {
                txtParentId.Value =
                 txtParentName.Value = string.Empty;
            }
        }


    }
}