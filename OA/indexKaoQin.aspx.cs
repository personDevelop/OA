using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Data;
namespace OA
{
    public partial class indexKaoQin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string dd = Request.Form["begin"];
            }

            string begin_date = Request.Form["begin_date"];
            string end_date = Request.Form["end_date"];
            string username = Request.Form["username"];
            string swstatus = Request.Form["swstatus"];
            string status = Request.Form["status"];
            string tmpl = @"
            <tr>
                <td height='30' align='center' bgcolor='#FFFFFF' class='zx'>{0}</td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>{1}</td>
                <td align='center' bgcolor='#FFFFFF' class='zx'><a title='工作日志内容'>{3}</a></td>
                <td align='center' bgcolor='#FFFFFF' class='zx'><a title='无'>{4}</a></td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>{2}</td>
            </tr>";

            YuanGongKaoQinManager ykMgr = new YuanGongKaoQinManager();
            int count = 0;

            WhereClip where = null;
            where = YuanGongKaoQin._.UserName != "";

            if (!string.IsNullOrEmpty(begin_date))
            {
                where.And(YuanGongKaoQin._.KQRQ >= begin_date);
            }
            if (!string.IsNullOrEmpty(end_date))
            {
                where.And(YuanGongKaoQin._.KQRQ <= end_date);
            }
            if (!string.IsNullOrEmpty(username))
            {
                where.And(YuanGongKaoQin._.UserName.Like("%" + username + "%"));
            }
            if (!string.IsNullOrEmpty(swstatus))
            {
                where.And(YuanGongKaoQin._.SWStatus == swstatus);
            }
            if (!string.IsNullOrEmpty(status))
            {
                where.And(YuanGongKaoQin._.Status == status);
            }
            DataTable dt = ykMgr.GetDataTable(0, 1000, where, "", ref count, ref count);
            string header =
            @" 
            <table width='100%' border='1' cellpadding='0' cellspacing='0' >
            <tbody>
            <tr>
                <td width='20%' height='25' align='center' bgcolor='#CCCCCC' class='zx'>日期</td>
                <td width='20%' align='center' bgcolor='#CCCCCC' class='zx'>人员</td>
                <td width='30%' align='center' bgcolor='#CCCCCC' class='zx'>上午考勤</td>
                <td width='20%' align='center' bgcolor='#CCCCCC' class='zx'>下午考勤</td>
                <td width='20%' align='center' bgcolor='#CCCCCC' class='zx'>备注</td>
            </tr>";
            foreach (DataRow row in dt.Rows)
            {
                header += string.Format(tmpl, row["KQRQ"].ToString(), row["USERNAME"].ToString(), row["NOTE"].ToString(), row["SWSTATUS"].ToString(), row["STATUS"].ToString());

            }
            header += " </tbody></table>";
            kaoqin_wrap.InnerHtml = header;
        }
    }
}