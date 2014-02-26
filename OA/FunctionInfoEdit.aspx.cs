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
    public partial class FunctionInfoEdit : System.Web.UI.Page
    {
        FunctionInfo entity = new FunctionInfo();
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
                    txtParentID.Value = Request.QueryString["ParentId"];
                    txtParentName.Value = Request.QueryString["ParentName"];
                }
            }
        }

        private void LoadData(string ID)
        {
            FunctionInfo code = new OAManager.FunctionInfoManager().GetItemById(new Guid(ID));
            txtID.Value = code.ID.ToString();
            txtCode.Value = code.Code;
            txtName.Value = code.Name;
            txtParentID.Value = code.ParentID.HasValue ? code.ParentID.ToString() : "";
            txtParentName.Value = code.ParentName;
            txtIsEnable.Checked = code.IsEnable;
            txtUrl.Value = code.Url;
            txtNote.Value = code.Note;
            txtImage.Value = code.Image;

        }


    }
}
