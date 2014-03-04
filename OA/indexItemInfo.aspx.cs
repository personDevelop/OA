using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;
using Sharp.Common;
using Sharp.Data;

namespace OA
{
    public partial class indexItemInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sbtmpl = @" 
		    <tr>
                <td height='30' align='center' bgcolor='#FFFFFF' class='zx'>{0}</td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>&nbsp;<font class='book_kk'>{1}</font><!--故障设备置顶--></td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>{2}</td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>{3}</td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>共<span class='title12b'>{4}</span>次故障</td>
                <td align='center' bgcolor='#FFFFFF' class='zx'>共<span class='title12b'>{5}</span>次更换</td>
            </tr>";


            if (!IsPostBack)
            {
                string sresult = 
                @"<table width='100%' border='0' cellpadding='0' cellspacing='0' class='dx'>
                      <tbody><tr>
                        <td width='12%' height='25' align='center' bgcolor='#F8F8F8' class='zx'>编号</td>
                        <td width='14%' align='center' bgcolor='#F8F8F8' class='zx'>设备状态</td>
                        <td width='22%' align='center' bgcolor='#F8F8F8' class='zx'>设备名称</td>
                        <td width='16%' align='center' bgcolor='#F8F8F8' class='zx'>缩略图</td>
                        <td width='18%' align='center' bgcolor='#F8F8F8' class='zx'>故障统计</td>
                        <td width='18%' align='center' bgcolor='#F8F8F8' class='zx'>更换统计</td>
                      </tr>";
                ShebeiInfoManager sbMgr = new ShebeiInfoManager();
                DataTable dt_sb = sbMgr.GetDataTable();
                
                int scount = 0;
                foreach (DataRow row in dt_sb.Rows)
                {
                    scount++;
                    if (scount > 100) return;
                    OAManager.FileInfoManager flMgr = new FileInfoManager();
                    DataTable dtimg=flMgr.GetDataTable(row["ID"].ToString());
                    string img_html = string.Empty;
                    if (dtimg.Rows.Count > 0)
                    {
                        string src = dtimg.Rows[0]["FILEPATH"].ToString();
                        img_html = "<a href='" + src + "'><img src='" + src + "' width='50' height='40' alt='图标'></a>";
                    }
                    else
                    {
                        img_html = "无缩略图";
 
                    }

                    sresult += string.Format(sbtmpl, row["Code"].ToString(), row["State"].ToString(), "<a href='" + row["PATH"].ToString() + "' target='sbiframe'>" + row["Name"].ToString() + "</a>", img_html, row["GZTJ"].ToString(), row["GHTJ"].ToString());

                }
                sresult += "</tbody></table>";
                sbinfo.InnerHtml = sresult;


            }

        }
    }
}