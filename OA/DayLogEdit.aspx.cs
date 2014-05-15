using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;

namespace OA
{
    public partial class DayLogEdit : BasePage
    {
        DayLog entity = new DayLog();
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
            DayLog code = new OAManager.DayLogManager().GetItemById(new Guid(ID));
            txtID.Value = code.ID.ToString();
            txtContent.Value = code.Content;
            hidWordDate.Value = code.WordDate.ToString("yyyy/MM/dd");
            txtUserID.Value = code.UserID.ToString();
            txtCreateDate.Value = code.CreateDate.ToString("yyyy/MM/dd"); ;
            txtUserName.Value = code.UserName;
            txtGS.Value = code.GS;

        }
    }
}