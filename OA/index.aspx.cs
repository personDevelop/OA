﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAManager;
using Sharp.Common;
using System.Data;
using OAEntity;

namespace OA
{
    public partial class index : PriBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string tmpl =
            @"
            <tr>
                <td height='25' align='left' valign='middle' >
                    &nbsp;
                    <img src='css/images/biao.gif' />
                    <a href='{0}' target='_blank'  title='标题：中央下达的重要文件请各小组查看'>{1}</a>
                    <font class='red'>★</font>
                    &nbsp;&nbsp;
                </td>
            </tr>";

            string wrtmpl = @"
            <tr>
                <td width='65' height='28' align='center' valign='middle' > 
                    <div class='book_kk' style='width:55px;'>√{0}</div>
                </td>
                <td align='left' valign='middle' >
                    {1}:
                    <a href='indexworkinfo.aspx?id={6}' target='_blank'>
                    {2}
                    </a>
                </td>
                <td width='100' align='center' valign='middle' >{3}</td> 
                <td width='140' align='center' valign='middle' >{4}</td>
                <td width='120' align='left' valign='middle' >{5}</td>
            </tr>";


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

                #region 格式化新闻
                NoticeInfoManager ntMgr = new NoticeInfoManager();
                string result = "<table width='100%' border='0' align='center' cellpadding='0'  cellspacing='0'>";

                int count = 0;
                DataTable dt = ntMgr.GetDataTable(1, 5, "ISTOP", ref count, ref count);
                foreach (DataRow row in dt.Rows)
                {
                    result += string.Format(tmpl, "newsinfo.aspx?id=" + row["ID"].ToString(), row["TITLE"]);

                }
                result += "</table>";


                news_wrap.InnerHtml = result;
                #endregion
              
               // #region 格式化派工http://www.ycfarm.com/sbbx/images/top_b.gif
               // string worinfohtml = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'> ";
               // WorkInfoManager wkMgr = new WorkInfoManager();
               // WhereClip where = null;// WorkInfo._.Status != "完成";
               // if ( Session["AllDepart"] != null)
               // {
               //     List<AdministrativeRegions> list =  Session["AllDepart"] as List<AdministrativeRegions>;
               //     if (list != null && list.Count > 0)
               //     {
               //         string[] dparr = new string[list.Count];
               //         for (int j = 0; j < list.Count; j++)
               //         {
               //             dparr[j] = list[j].ID.ToString();
               //         }
               //         if (WhereClip.IsNullOrEmpty(where))
               //         {
               //             where = ShebeiInfo._.SocrceDepart.In(dparr);

               //         }
               //         else
               //         {
               //             where = where && ShebeiInfo._.SocrceDepart.In(dparr);
               //         }
               //     }
               // }
               // OrderByClip order = WorkInfo._.CreateDate.Desc;
               // DataTable dtwk = wkMgr.GetDataTable(1, 4, where, order, ref count, ref count);
               // // DataTable dtwk = wkMgr.GetDataTable();
               //int i = 0;
               // foreach (DataRow row in dtwk.Rows)
               // {
               //     i++;
               //     if (i > 4) break;
               //     string gzxx = row["GuZhangXx"].ToString();
               //     if (gzxx.Length > 10)
               //     {
               //         gzxx = gzxx.Substring(0, 10);
               //     }
               //     string clyj = row["ChuLiYijian"].ToString();
               //     if (clyj.Length > 10)
               //     {
               //         clyj = clyj.Substring(0, 10);
               //     }
               //     worinfohtml += string.Format(wrtmpl, row["Status"].ToString(), row["CreaterName"].ToString(), gzxx, row["CurrentUser"].ToString(), clyj, ((DateTime)row["CreateDate"]).ToString("yyyy-MM-dd"), row["ID"]);

               // }
               // worinfohtml += "</table>";
               // workinfo.InnerHtml = worinfohtml;
               // #endregion

//                string sresult =
//                @"<table width='100%' border='0' cellpadding='0' cellspacing='0' class='dx'>
//                      <tbody><tr>
//                        <td width='12%' height='25' align='center' bgcolor='#F8F8F8' class='zx'>编号</td>
//                        <td width='14%' align='center' bgcolor='#F8F8F8' class='zx'>设备状态</td>
//                        <td width='22%' align='center' bgcolor='#F8F8F8' class='zx'>设备名称</td>
//                       <td width='16%' align='center' bgcolor='#F8F8F8' class='zx'>缩略图</td>
//                        <td width='18%' align='center' bgcolor='#F8F8F8' class='zx'>故障统计</td>
//                        <td width='18%' align='center' bgcolor='#F8F8F8' class='zx'>更换统计</td>
//                      </tr>";
//                ShebeiInfoManager sbMgr = new ShebeiInfoManager();
//                DataTable dt_sb = sbMgr.GetWaiBuDataTable();

//                int scount = 0;
//                foreach (DataRow row in dt_sb.Rows)
//                {
//                    scount++;
//                    if (scount > 10) break;
//                    string img_html = string.Empty;
//                    //OAManager.FileInfoManager flMgr = new FileInfoManager();
//                    //DataTable dtimg = flMgr.GetDataTable(row["ID"].ToString());
//                    //string img_html = string.Empty;
//                    //if (dtimg.Rows.Count > 0)
//                    //{
//                    //    string src = dtimg.Rows[0]["FILEPATH"].ToString();
//                    //    img_html = "<a href='" + src + "'><img src='" + src + "' width='50' height='40' alt='图标'></a>";
//                    //}
//                    //else
//                    //{
//                    //    img_html = "无缩略图";

//                    //}

//                    sresult += string.Format(sbtmpl, row["Code"].ToString(), row["State"].ToString(), "<a href='" + row["PATH"].ToString() + "' target='sbiframe'>" + row["Name"].ToString() + "</a>", img_html, row["GZTJ"].ToString(), row["GHTJ"].ToString());

//                }
//                sresult += "</tbody></table>";
//                //sbinfo.InnerHtml = sresult;

//                  dt_sb = sbMgr.GetNeiBuDataTable();
//                sresult =
//           @"<table width='100%' border='0' cellpadding='0' cellspacing='0' class='dx'>
//                      <tbody><tr>
//                        <td width='12%' height='25' align='center' bgcolor='#F8F8F8' class='zx'>编号</td>
//                        <td width='14%' align='center' bgcolor='#F8F8F8' class='zx'>设备状态</td>
//                        <td width='22%' align='center' bgcolor='#F8F8F8' class='zx'>设备名称</td>
//                       <td width='16%' align='center' bgcolor='#F8F8F8' class='zx'>缩略图</td>
//                        <td width='18%' align='center' bgcolor='#F8F8F8' class='zx'>故障统计</td>
//                        <td width='18%' align='center' bgcolor='#F8F8F8' class='zx'>更换统计</td>
//                      </tr>";
//                  scount = 0;
//                foreach (DataRow row in dt_sb.Rows)
//                {
//                    scount++;
//                    if (scount > 10) break;
//                    string img_html = string.Empty;
//                    //OAManager.FileInfoManager flMgr = new FileInfoManager();
//                    //DataTable dtimg = flMgr.GetDataTable(row["ID"].ToString());
//                    //string img_html = string.Empty;
//                    //if (dtimg.Rows.Count > 0)
//                    //{
//                    //    string src = dtimg.Rows[0]["FILEPATH"].ToString();
//                    //    img_html = "<a href='" + src + "'><img src='" + src + "' width='50' height='40' alt='图标'></a>";
//                    //}
//                    //else
//                    //{
//                    //    img_html = "无缩略图";

//                    //}

//                    sresult += string.Format(sbtmpl, row["Code"].ToString(), row["State"].ToString(), "<a href='" + row["PATH"].ToString() + "' target='sbiframe'>" + row["Name"].ToString() + "</a>", img_html, row["GZTJ"].ToString(), row["GHTJ"].ToString());

//                }
//                sresult += "</tbody></table>";
//                //sbnbinfo.InnerHtml = sresult;
            }

        }
    }
}