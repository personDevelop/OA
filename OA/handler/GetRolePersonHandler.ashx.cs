﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using System.Data;
using OAEntity;

namespace OA.handler
{
    /// <summary>
    /// GetRolePersonHandler 的摘要说明
    /// </summary>
    public class GetRolePersonHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest rp = context.Request;
            context.Response.ContentType = "text/plain";
            RoleInfoManager manager = new RoleInfoManager();
            int currentPage = int.Parse(rp["pagenum"]);
            int pageSize = int.Parse(rp["pagesize"]);
            int count = 0, recordCount = 0;
            DataTable dt = manager.GetPersonByRoleID(currentPage + 1, pageSize, rp["RoleID"],false, ref count, ref recordCount);
            string result = JsonConvert.Convert2Json(dt);
            context.Response.Write("{ \"totalRecords\":\"" + recordCount + "\",\"rows\":" + result + "}");
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