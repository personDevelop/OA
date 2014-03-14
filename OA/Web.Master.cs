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
    public partial class Web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] != null)
            {
                hid.Value = Session["UserName"].ToString();
            }
            if (!IsPostBack)
            {
                NoticeInfoManager ntMgr = new NoticeInfoManager();
                down.InnerText = "主办单位：长清公安分局";
                string titlepix="首页";
                 switch (Request.FilePath.ToLower())
                 {
                     case "/indexxjsb.aspx":
                         titlepix = "巡检设备";
                         break;
                     case "/indexkaoqin.aspx":
                         titlepix = "考勤统计";
                         break;
                     case "/indexpaigong.aspx":
                         titlepix = "派工统计";
                         break;
                     case "/indexXjsb.aspx":
                         titlepix = "巡检设备";
                         break; 
                 }
                ttt.Text = titlepix+"-长清公安分局中和运维管理系统";
                NoticeInfo notice = ntMgr.GetTopText(true);
                string s = "<a style='color:#FFFFFF; ' href='newsinfo.aspx?id={0}'>{1}</a>";

                if (notice != null)
                {
                    hidZuiTopTongZhi.Value = string.Format(s, notice.ID, notice.TITLE);

                }
                notice = ntMgr.GetTopText(false);
                s = "<a style='font-family:Microsoft YaHei;color:#FFFF00;font-size:24px;' href='newsinfo.aspx?id={0}'>{1}</a>";
                if (notice != null)
                {
                    hidTopTongZhid.Value = string.Format(s, notice.ID, notice.TITLE);

                }

            }
        }
    }
}