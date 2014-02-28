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
    public partial class PersonInfoEdit : BasePage
    {
        PersonInfo entity = new PersonInfo();
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
            PersonInfo code = new OAManager.PersonInfoManager().GetItemById(new Guid(ID));
            txtID.Value = code.ID.ToString();
            txtUserName.Value = code.UserName; 
            txtEmail.Value = code.Email;
            txtRealName.Value = code.RealName;
            txtLocation.Value = code.Location;
            txtDetailedAddress.Value = code.DetailedAddress;
            txtSex.SelectedValue = code.Sex.ToString();
            txtTelphone.Value = code.Telphone;
            txtIDCardNumber.Value = code.IDCardNumber;
            hidBirthday.Value = code.Birthday.HasValue ? code.Birthday.Value.ToString("yyyy/MM/dd") : "";
            txtMarryStatus.SelectedValue = code.MarryStatus.HasValue ? code.MarryStatus.ToString() : ""; 
            txtNote.Value = code.Note;

        }


    }
}
