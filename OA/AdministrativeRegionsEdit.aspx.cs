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
    public partial class AdministrativeRegionsEdit : BasePage
    {
        AdministrativeRegions entity = new AdministrativeRegions();
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
                    txtParentID.Value = Request.QueryString["ParentID"];
                    txtParentName.Value = Request.QueryString["ParentName"];
                }
            }
        }

        private void LoadData(string ID)
        {
            AdministrativeRegions code = new OAManager.AdministrativeRegionsManager().GetItemById(new Guid(ID));
            txtID.Value = code.ID.ToString();
            txtCode.Value = code.Code;
            txtName.Value = code.Name;
            if (code.ParentID.HasValue)
            {
                txtParentID.Value = code.ParentID.ToString();

            }
            else
            {
                txtParentID.Value = string.Empty;
            } 
            txtZipCode.Value = code.ZipCode;
            txtPhone.Value = code.Phone; 
            txtNote.Value = code.Note;
            txtShortName.Value = code.ShortName;

        }


    }
}
