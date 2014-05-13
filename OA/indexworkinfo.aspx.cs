using System;
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
    public partial class indexworkinfo : PriBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string desc_tmpl = "报工设备：{0}&nbsp;&nbsp;&nbsp;&nbsp;报工时间：{1}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/><br/>处理意见：{2}";
            if (!IsPostBack)
            {
               
                WorkInfoManager wkMgr = new WorkInfoManager();
                string id = Request.QueryString.Get("id");
                WhereClip where = WorkInfo._.ID == new Guid(id);
                OrderByClip order = WorkInfo._.CreateDate.Desc;
                int count = 0;
                DataTable dtwk = wkMgr.GetDataTable(1, 1, where, order, ref count, ref count);

                news_title.InnerHtml = "报修设备：" + dtwk.Rows[0]["Name"].ToString();
                //news_desc.InnerHtml = string.Format(desc_tmpl, dtwk.Rows[0]["Name"], dtwk.Rows[0]["GuZhangXx"], dtwk.Rows[0]["ChuLiYiJian"]);
                news_content.InnerHtml = string.Format(desc_tmpl, dtwk.Rows[0]["Name"], dtwk.Rows[0]["GuZhangXx"], dtwk.Rows[0]["ChuLiYiJian"]); ;


            }

        }
    }
}