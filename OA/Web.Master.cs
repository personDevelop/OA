using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAManager;
using OAEntity;
using Sharp.Common;
using System.Data;

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
                string titlepix = "首页";
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
                ttt.Text = titlepix + "-长清公安分局运维综合管理系统";
                //NoticeInfo notice = ntMgr.GetTopText(true);
                //string s = "<a style='color:#FFFFFF; ' href='newsinfo.aspx?id={0}'>{1}</a>";

                //if (notice != null)
                //{
                //    hidZuiTopTongZhi.Value = string.Format(s, notice.ID, notice.TITLE);

                //}
                //NoticeInfo notice = ntMgr.GetTopText(false);
                //string s = "<a style='font-family:Microsoft YaHei;color:#FFFF00;font-size:24px;' href='newsinfo.aspx?id={0}'>{1}</a>";
                //if (notice != null)
                //{
                //    hidTopTongZhid.Value = string.Format(s, notice.ID, notice.TITLE);

                //}
                WorkInfoManager wkMgr = new WorkInfoManager();
                WhereClip where = WorkInfo._.Status == "制单";
                OrderByClip order = WorkInfo._.CreateDate.Desc;
                int count = 0;
                if ( Session["AllDepart"] != null)
                {
                    List<AdministrativeRegions> list =  Session["AllDepart"] as List<AdministrativeRegions>;
                    if (list != null && list.Count > 0)
                    {
                        string[] dparr = new string[list.Count];
                        for (int i = 0; i < list.Count; i++)
                        {
                            dparr[i] = list[i].ID.ToString();
                        }
                        if (WhereClip.IsNullOrEmpty(where))
                        {
                            where = ShebeiInfo._.SocrceDepart.In(dparr);

                        }
                        else
                        {
                            where = where && ShebeiInfo._.SocrceDepart.In(dparr);
                        }
                    }
                }
                DataTable dtwk = wkMgr.GetGzDataTable(1, 4, where, order, ref count, ref count);
                string s = "<a style='font-family:Microsoft YaHei;color:#FFFF00;font-size:24px;'  >{0}</a>";
                string msg = string.Empty;
                if (dtwk == null || dtwk.Rows.Count == 0)
                {
                    msg = "没有最新设备报修信息，所有报修设备信息都已派工";
                  
                }
                else
                {
                    foreach (DataRow item in dtwk.Rows)
                    {
                        msg += item["Name"] + "(" + item["Code"] + ")：" + item["Guzhang"];  
                        msg += "   |   ";
                    }
                   
                }
                hidTopTongZhid.Value =  string.Format(s, msg); ;

            }
        }
    }
}