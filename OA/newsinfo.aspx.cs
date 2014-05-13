using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OAEntity;
using OAManager;

namespace OA
{
    public partial class newsinfo : PriBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string desc_tmpl = "信息来源：{0}&nbsp;&nbsp;&nbsp;&nbsp;发稿作者：{1}&nbsp;&nbsp;&nbsp;&nbsp;发布时间：{2}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            if (!IsPostBack)
            {

                NoticeInfo nr = new NoticeInfo();
                NoticeInfoManager nrMgr = new NoticeInfoManager();
                string id = Request.QueryString.Get("id");
                if (!string.IsNullOrEmpty(id))
                {
                    nr = nrMgr.GetItemById(new Guid(id));
                    if (nr != null)
                    {
                        news_title.InnerHtml = nr.TITLE;
                        news_desc.InnerHtml = string.Format(desc_tmpl, nr.SOURCE, nr.PUBUSER, nr.PUBDATE);
                        news_content.InnerHtml = nr.CONTENT;
                    }



                }
            }

        }
    }
}