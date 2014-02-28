using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;

namespace OA
{
    public partial class index : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                string result = "<table width='100%' border='0' align='center' cellpadding='0'  cellspacing='0'>";
                NoticeInfoManager ntMgr = new NoticeInfoManager();
                int count=0;
                DataTable dt=ntMgr.GetDataTable(0, 5, "ISTOP", ref count, ref count);
                foreach(DataRow row in dt.Rows)
                {
                    result += string.Format(tmpl, "newsinfo.aspx?id=" + row["ID"].ToString(), row["TITLE"]); 

                }
                result+="</table>";
                
        
                news_wrap.InnerHtml=result;
            }

        }
    }
}