using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAManager;
using Sharp.Common;
using OAEntity;
using System.Data;

namespace OA
{
    public partial class indexPaiGong : PriBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
//            if (!IsPostBack)
//            {
              
//                string dd = Request.Form["begin"];
//            }

//            string begin_date = Request.Form["begin_date"];
//            string end_date = Request.Form["end_date"];
//            string username = Request.Form["username"];
//            string sbcode = Request.Form["sbcode"];
//            string sbname = Request.Form["sbname"];
//            string tmpl = @"
//            <tr>
//                <td height='30' align='center' bgcolor='#FFFFFF' class='zx'>{0}</td>
//                <td align='center' bgcolor='#FFFFFF' class='zx'>{1}</td>
//                <td align='center' bgcolor='#FFFFFF' class='zx'>{2}</td>
//                <td align='center' bgcolor='#FFFFFF' class='zx'>{3}</td>
//                <td align='center' bgcolor='#FFFFFF' class='zx'>{4}</td>
//            </tr>";

//            WorkInfoManager wrkMgr = new WorkInfoManager();

//            //YuanGongKaoQinManager ykMgr = new YuanGongKaoQinManager();
//            int count = 0;

//            WhereClip where = null;
//            where = WorkInfo._.CreaterName != "";

//            if (!string.IsNullOrEmpty(begin_date))
//            {
//                where.And(WorkInfo._.RealTime >= begin_date);
//            }
//            if (!string.IsNullOrEmpty(end_date))
//            {
//                where.And(WorkInfo._.RealTime <= end_date);
//            }
//            if (!string.IsNullOrEmpty(sbcode))
//            {
//                where.And(ShebeiInfo._.Code.Like("%" + sbcode + "%"));
//            }
//            if (!string.IsNullOrEmpty(sbname))
//            {
//                where.And(ShebeiInfo._.Name.Like("%" + sbname + "%"));
//            }
//            if (!string.IsNullOrEmpty(username))
//            {
//                where.And(WorkInfo._.CurrentUser.Like("%" + username + "%"));
//            }
//            OrderByClip order = null;
//            DataTable dt = wrkMgr.GetDataTable(0, 1000, where, order, ref count, ref count);
//            string header =
//            @" 
//            <table width='100%' border='1' cellpadding='0' cellspacing='0' >
//            <tbody>
//                <tr>
//                    <td width='15%' height='25' align='center' bgcolor='#CCCCCC' class='zx'>设备编号</td>
//                    <td width='15%' align='center' bgcolor='#CCCCCC' class='zx'>设备名称</td>
//                    <td width='20%' align='center' bgcolor='#CCCCCC' class='zx'>报工时间</td>
//                    <td width='20%' align='center' bgcolor='#CCCCCC' class='zx'>修复时间</td>
//                    <td width='15%' align='center' bgcolor='#CCCCCC' class='zx'>受理人员</td>
//                </tr>";
//            foreach (DataRow row in dt.Rows)
//            {
//                header += string.Format(tmpl, row["CODE"].ToString(), row["NAME"].ToString(), row["CreateDate"].ToString(), row["REALTIME"].ToString(), row["CURRENTUSER"].ToString());

//            }
//            header += " </tbody></table>";
//            kaoqin_wrap.InnerHtml = header;
        }
    }
}