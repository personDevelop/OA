using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;
using Sharp.Common;
using Sharp.Data;
using System.Text;
using System.Data;
using Sharp.Common.Common;

namespace OA
{
    public partial class main : BasePage
    {
        private StringBuilder sb = new StringBuilder();
        public string Navigator { get; set; }
        string userid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = string.Empty;
            if (!IsPostBack)
            {
                sys_title.InnerHtml = "长清公安分局运维综合管理系统";
                if (Session["UserName"] == null)
                {

                }
                else
                {
                    PersonInfo pr = new PersonInfo();
                    PersonInfoManager prMgr = new PersonInfoManager();
                    WhereClip where = PersonInfo._.UserName == Session["UserName"].ToString();
                    pr = prMgr.GetItemById(where);
                    if (pr != null)
                    {
                        userid = pr.ID.ToString();
                        uid.Value = pr.ID.ToString();
                    }
                    LabelUser.Text = "您好," + Session["UserName"].ToString();
                    GenarateNavigator();
                }
            }

        }

        private void GenarateNavigator()
        {
            string userName = Session["UserName"].ToString();

            string userID = Session["UserID"].ToString();
            DataTable dt = null;
            try
            {
                dt = new FuncAccessManager().GetAccess(userID, userName);
            }
            catch (Exception)
            {

                Response.Write("<script>alert('当前用户没有设置任何角色，请联系管理员设置系统角色！');</script>");
                Response.End();
            }
            List<FunctionInfo> list = dt.ToList<FunctionInfo>();
            IEnumerable<FunctionInfo> root = list.Where(p => !p.ParentID.HasValue);
            int i = 0;
            foreach (FunctionInfo item in root)
            {
                sb.Append("<ul style='display: block;'>");
                string isclose = " close ";
                if (i > 0)
                {
                    isclose = "close";
                }
                sb.AppendFormat(@"<li><a navid='site_manage' class='item pack {0}'>
                        <div class='arrow'>
                        </div>
                        <div class='expandable open '>
                        </div>
                        <div class='folder close'>
                        </div>
                        <span>" + item.Name + "</span> </a>", isclose);
                //查找当前功能组的子功能
                int count = list.Count(p => p.ParentID == item.ID);
                if (count > 0)
                {
                    sb.Append("<ul class='subblock'>");
                    IEnumerable<FunctionInfo> childs = list.Where(p => p.ParentID == item.ID);
                    foreach (FunctionInfo child in childs)
                    {
                        sb.AppendFormat(@"<li><a navid='site_config' href='{0}' target='mainframe' class='item'>
                                <div class='arrow'>
                                </div>
                                <div class='expandable'>
                                </div>
                                <div class=''>
                                </div>
                                <span class='subMenu'>{1}</span> </a></li>", child.Url, child.Name);
                    }
                    sb.Append("</ul>");
                }

                sb.Append("</li>");
                sb.Append("</ul>");
            }
            if (Session["UserID"].ToString().Open() == StaticClass.RootKey)
            {
                sb.Append("<ul style='display: block;'>");
                sb.Append(@"<li><a navid='site_config' href='FunctionInfoList.aspx' target='mainframe' class='item'>
                                <div class='arrow'>
                                </div>
                                <div class='expandable'>
                                </div>
                                <div class=''>
                                </div>
                                <span class='subMenu'>功能设置</span> </a></li>");
                sb.Append("</ul>");
            }
            Navigator = sb.ToString();
        }
    }
}