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
    /// ShebeiInfoListHandler 的摘要说明
    /// </summary>
    public class IndexShebeiInfoListHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            ShebeiInfoManager manager = new ShebeiInfoManager();
            int pageNum = int.Parse(context.Request.QueryString.Get("pagenum"));
            int pagesize = int.Parse(context.Request.QueryString.Get("pagesize"));

            int recordCount = 0;
            WhereClip where = new WhereClip();
            if (!string.IsNullOrEmpty(context.Request.QueryString["nb"]))
            {
                if (context.Request.QueryString["nb"] == "1")
                {
                    where = where && ShebeiInfo._.IsNeiWai == true;
                }
                else if (context.Request.QueryString["nb"] == "0")
                {
                    where = where && ShebeiInfo._.IsNeiWai == false;
                }

            }
            if (!string.IsNullOrEmpty(context.Request["sbzt"]))
            {
                where = where && ShebeiInfo._.State == context.Request["sbzt"];

            }
            if (!string.IsNullOrEmpty(context.Request["sbcode"]))
            {
                where = where && ShebeiInfo._.Code.Contains(context.Request["sbcode"]);

            }
            if (!string.IsNullOrEmpty(context.Request["sbname"]))
            {
                where = where && ShebeiInfo._.Name.Contains(context.Request["sbname"]);

            }
            if (context.Session["AllDepart"] != null)
            {
                List<AdministrativeRegions> list = context.Session["AllDepart"] as List<AdministrativeRegions>;
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
            string or = " state, CODE ";
            if (!string.IsNullOrEmpty(context.Request["sortdatafield"]))
            {
                if (!string.IsNullOrEmpty(context.Request["sortorder"]) && context.Request["sortorder"] == "desc")
                {
                    or = context.Request["sortdatafield"] + " desc";
                }
                else
                {
                    or = context.Request["sortdatafield"];
                }

            }
             
            DataTable dt = manager.GetDataTableWithImg(pageNum + 1, pagesize, where, or, ref pagesize, ref recordCount);
            //manager.GetDataTable();
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{\"totalRecords\":\"" + recordCount.ToString() + "\",\"rows\":" + result + "}");
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



