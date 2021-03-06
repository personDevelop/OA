﻿using System;
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
    public class ShebeiInfoListHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            ShebeiInfoManager manager = new ShebeiInfoManager();
            int pageNum = int.Parse(context.Request.QueryString.Get("pagenum"));
            int pagesize = int.Parse(context.Request.QueryString.Get("pagesize"));
            int recordCount = 0;
            WhereClip where = new WhereClip();
            if (!string.IsNullOrEmpty(context.Request["status"]))
            {
                where = ShebeiInfo._.State == context.Request["status"];

            }
            string filter = context.Request["filtervalue0"];
            //获取当前用户的部们
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

                    where = where && ShebeiInfo._.SocrceDepart.In(dparr);

                }
            }

            if (!string.IsNullOrEmpty(filter))
            {
                filter = filter.Trim();

                where = where && (ShebeiInfo._.Code.Contains(filter) || ShebeiInfo._.Name.Contains(filter) || ShebeiInfo._.Address.Contains(filter));
            }
            DataTable dt = manager.GetDataTable(pageNum + 1, pagesize, where, ref pagesize, ref recordCount);
            //manager.GetDataTable();
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{\"total\":\"" + recordCount.ToString() + "\",\"rows\":" + result + "}");
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



