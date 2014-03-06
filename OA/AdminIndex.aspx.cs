using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAManager;
using OAEntity;
using System.Data;
using Sharp.Common;
using System.Text;


namespace OA
{
    public partial class AdminIndex : BasePage
    {
        NoticeInfoManager noticeMangaer = new NoticeInfoManager();
        public string DaiBanRenWU { get; set; }
        public string MyPaiGong { get; set; }
        public string SystemGongGao { get; set; }
        public string DayLogStr { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string UserId = Session["UserID"].ToString();
                GerneraotrDaiBan(UserId);
                GerneraotrMyPaiGong(UserId);
                GerneraotrSystemGongGao();
                GerneraotrDayLog(UserId);
            }
        }

        private void GerneraotrSystemGongGao()
        {

            int pageCount = 0, recordCount = 0;

            DataTable dt = noticeMangaer.GetDataTable(1, 10, "PUBDATE Desc,ISTOP", ref pageCount, ref recordCount);
            List<NoticeInfo> list = dt.ToList<NoticeInfo>();
            string temp = "<li style='margin-top: 5px; margin-bottom: 5px;'><a href='newsinfo.aspx?id={0}'>{1}.{2}</a><li>";
            StringBuilder sb = new StringBuilder();
            int i = 1;
            foreach (NoticeInfo item in list)
            {
                sb.AppendFormat(temp, item.ID, i++, item.TITLE);
            }
            SystemGongGao = sb.ToString();
        }

        private void GerneraotrDayLog(string UserId)
        {
            string tem = @"   <tr class='{0}'>
                                <td align='center'>
                                    {1}
                                </td>
                                <td>
                                    {2}
                                </td>
                                <td align='center'>
                                   {3}
                                </td>
                                <td align='center'>
                                   {4}
                                </td> 
                            </tr>";
            DayLogManager manager = new DayLogManager();
            int pageCount = 0, recordCount = 0;
            DataTable dt = manager.GetDataTable(1, 5, DayLog._.UserID == new Guid(Session["UserID"].ToString()), DayLog._.WordDate.Desc, ref pageCount, ref recordCount);
            StringBuilder sb = new StringBuilder();
            int i = 1;
            foreach (DataRow item in dt.Rows)
            {
                string temodd = odd_bg;
                if (i % 2 == 0)
                {
                    temodd = "";
                }
                sb.AppendFormat(tem, temodd, i, item["Content"], ((DateTime)item["WordDate"]).ToString("yyyy-MM-dd"), item["GS"]);
            }
            DayLogStr = sb.ToString();
        }

        private void GerneraotrMyPaiGong(string UserId)
        {

            string tem = @"  <tr class='{5}'>
                                <td align='center'>
                                    {0}
                                </td>
                                <td>
                                    {1}
                                </td>
                                <td align='center'>
                                    {2}
                                </td>
                                <td align='center'>
                                   {3}
                                </td>
                                <td align='center'>
                                    {4}
                                </td> 
                            </tr>";
            WorkInfoManager manager = new WorkInfoManager();
            int pageCount = 0, recordCount = 0;
            DataTable dt = manager.GetDaiBanDataTable(1, 5, WorkHandLog._.Uper == new Guid(Session["UserID"].ToString()), WorkHandLog._.HandDate.Desc, ref pageCount, ref recordCount);
            StringBuilder sb = new StringBuilder();
            int i = 1;
            foreach (DataRow item in dt.Rows)
            {
                string temodd = odd_bg;
                if (i % 2 == 0)
                {
                    temodd = "";
                }
                sb.AppendFormat(tem, i++, item["GuZhangXx"], ((DateTime)item["HandDate"]).ToString("yyyy-MM-dd"), item["UpName"], item["Status"], temodd);
            }
            MyPaiGong = sb.ToString();

        }
        string odd_bg = "odd_bg";
        private void GerneraotrDaiBan(string UserId)
        {
            string tem = @"  <tr class='{6}'>
                                <td align='center'>
                                    {0}
                                </td>
                                <td>
                                    {1}
                                </td>
                                <td align='center'>
                                    {2}
                                </td>
                                <td align='center'>
                                   {3}
                                </td>
                                <td align='center'>
                                    {4}
                                </td>
                                <td align='center'>
                                    <a href='WorkHandLogEdit.aspx?ID={5}'>办理</a>
                                </td>
                            </tr>";
            WorkInfoManager manager = new WorkInfoManager();
            int pageCount = 0, recordCount = 0;
            DataTable dt = manager.GetDaiBanDataTable(1, 5, WorkHandLog._.DownEr == new Guid(Session["UserID"].ToString()), WorkHandLog._.HandDate.Desc, ref pageCount, ref recordCount);
            StringBuilder sb = new StringBuilder();
            int i = 1;
            foreach (DataRow item in dt.Rows)
            {
                string temodd = odd_bg;
                if (i % 2 == 0)
                {
                    temodd = "";
                }
                sb.AppendFormat(tem, i++, item["GuZhangXx"], ((DateTime)item["HandDate"]).ToString("yyyy-MM-dd"), item["UpName"], item["Status"], item["WorkID"], temodd);
            }
            DaiBanRenWU = sb.ToString();
        }
    }
}