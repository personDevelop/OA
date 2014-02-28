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
    public partial class RoleInfoEdit : BasePage
    {
        RoleInfo entity = new RoleInfo();
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
            RoleInfo code = new OAManager.RoleInfoManager().GetItemById(new Guid(ID));
            txtID.Value = code.ID.ToString();
            txtCode.Value = code.Code;
            txtName.Value = code.Name;
            txtRoleClass.Value = code.RoleClass;
            txtIsEnable.Checked = code.IsEnable;
            txtNote.Value = code.Note;
            

        }


    }
}
