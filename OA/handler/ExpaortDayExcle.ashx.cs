using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data;
using NPOI.SS.UserModel;
using OAEntity;
using Sharp.Common;
using System.Web.SessionState;
using OAManager;

namespace OA.handler
{
    /// <summary>
    /// ExpaortDayExcle 的摘要说明
    /// </summary>
    public class ExpaortDayExcle : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            HttpRequest rp = context.Request;
            string personID = rp["personid"];
            WhereClip where = null;

            if (!string.IsNullOrEmpty(personID))
            {
                where = DayLog._.UserID == new Guid(personID);
            }
            else
                if (context.Session["UserID"] != null)
                {
                    where = DayLog._.UserID == new Guid(context.Session["UserID"].ToString());

                }

            if (!string.IsNullOrEmpty(context.Request["rq1"]))
            {

                where.And(DayLog._.CreateDate >= DateTime.Parse(context.Request["rq1"]));

            }
            if (!string.IsNullOrEmpty(context.Request["rq2"]))
            {

                where.And(DayLog._.CreateDate < DateTime.Parse(context.Request["rq2"]).AddDays(1));

            }

            DataTable dt = new DayLogManager().GetDataTable(where);
            if (dt.Rows.Count > 0)
            {
                ExcelOperator eo = new ExcelOperator();

                IWorkbook work = eo.GenerateSheet(dt, "工作日志");
                string path = Guid.NewGuid() + ".xls";
                string dict = context.Server.MapPath("~\\upload\\") + "exportxml";
                if (Directory.Exists(dict))
                {
                    string[] fs = Directory.GetFileSystemEntries(dict);
                    foreach (string item in fs)
                    {
                        File.Delete(item);
                    }
                }

                while (!Directory.Exists(dict))
                {
                    Directory.CreateDirectory(dict);
                }


                string newpath = dict + "\\" + path; ;

                try
                {


                    using (Stream stream = File.Open(newpath, FileMode.OpenOrCreate, FileAccess.ReadWrite))
                    {
                        work.Write(stream);
                    }
                    context.Response.Write("{\"success\":\"true\",\"msg\":\"" + path + "\"}");
                }

                catch (Exception ex)
                {

                    path = "错误：" + ex.Message;
                    path = path.Replace("\r\n", "<br/>");
                    byte[] bytes = Encoding.UTF8.GetBytes(path);
                    string encode = Convert.ToBase64String(bytes);
                    context.Response.Write("{\"success\":\"false\",\"msg\":\"" + encode + "\"}");

                }
            }
            else
            {
                byte[] bytes = Encoding.UTF8.GetBytes("没有需要导出的日志信息");
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