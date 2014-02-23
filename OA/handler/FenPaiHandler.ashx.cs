using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Specialized;
using OAEntity;
using System.Web.SessionState;
using OAManager;
using Sharp.Common;
using System.Text;

namespace OA.handler
{
    /// <summary>
    /// FenPaiHandler 的摘要说明
    /// </summary>
    public class FenPaiHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            NameValueCollection rp = context.Request.Form;
            Guid rwid = new Guid(rp["rwid"]);
            List<BaseEntity> list = new List<BaseEntity>();
            string msg = string.Empty;
            PersonInfo curentperson = null;
            string zprenstr = rp["zpren[]"];
            try
            {
              PersonInfoManager plogic= new PersonInfoManager();
                
                string[] zpren = zprenstr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < zpren.Length; i++)
                {
                    if (i == 0)
                    {
                        curentperson = plogic.GetItemById(new Guid(zpren[i]));
                    }
                    WorkHandLog log = new WorkHandLog();
                    log.ID = Guid.NewGuid();
                    log.WorkID = rwid;
                    log.CurrentStaus = "处理中";
                    log.ChuliYj = "工作指派";
                    //if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                    //{
                    //    log.Uper = new Guid(context.Session["UserID"].ToString());
                    //    log.UpName = plogic.GetItemById(log.Uper.Value).RealName;
                    //}
                    log.DownEr = new Guid(zpren[i]);
                    log.DownName = plogic.GetItemById(log.DownEr.Value).RealName;
                    log.HandDate = DateTime.Now;
                    log.HandResult = "已指派";
                    log.HandSequence = 1;
                    list.Add(log);
                }
                WorkInfo work = new WorkInfo();
                work.ID = rwid;
                work.RecordStatus = Sharp.Common.StatusType.update;
                work.Status = "处理中";
                work.CurrentUser = curentperson.RealName;
                list.Add(work);
                int result = new WorkInfoManager().Save(list);
                context.Response.Write("{\"success\":\"true\"}");
            }
            catch (Exception ex)
            {
                msg = ex.Message;

            }
            if (!string.IsNullOrEmpty(msg))
            {
                byte[] bytes = Encoding.UTF8.GetBytes(msg.Replace("\r\n", "<br/>"));
                string encode = Convert.ToBase64String(bytes);
                context.Response.Write("{\"success\":\"false\",\"msg\":\"" + encode + "\"}");
            }
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}