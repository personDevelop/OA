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
    public partial class ShebeiInfoEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                //修改
                LoadData(Request.QueryString["ID"]);
            }
            else
            {
                txtID.Value = Guid.NewGuid().ToString();
                txtState.Value = "正常";
            }

        }

        private void LoadData(string ID)
        {
            ShebeiInfo sb = new ShebeiInfoManager().GetItemById(new Guid(ID));

            txtID.Value = sb.ID.ToString();
            txtName.Value = sb.Name.ToString();
            txtGuiGe.Value = sb.GuiGe.ToString();
            txtCode.Value = sb.Code.ToString();
            txtIsEnable.Checked = sb.IsEnable;
            txtNote.Value = sb.Note.ToString();
            txtPATH.Value = sb.PATH.ToString();
            txtState.Value = sb.State.ToString();


        }
    }
}