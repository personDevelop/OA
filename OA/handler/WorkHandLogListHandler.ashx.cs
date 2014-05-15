using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;
using Sharp.Common;
using OAEntity;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// WorkHandLogListHandler 的摘要说明
    /// </summary>
    public class WorkHandLogListHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest rp = context.Request;
            WorkInfoManager manager = new WorkInfoManager();
            WhereClip where = WorkHandLog._.WorkID == rp["WorkID"];// WorkHandLog._.DownEr == new Guid(context.Session["UserID"].ToString());
            DataTable dt = manager.GetDaiBanDataTable(where, WorkHandLog._.HandSequence.Asc && WorkHandLog._.HandDate.Desc);
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write(result);
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


