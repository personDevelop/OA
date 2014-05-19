using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OAManager;
using NPOI.SS.UserModel;
using System.IO;
using System.Text;

namespace OA.handler
{
    /// <summary>
    /// ExpaortExcle 的摘要说明
    /// </summary>
    public class ExpaortExcle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string sbid = context.Request.QueryString["sbid"];
            string name = context.Request.QueryString["name"];
            string type = context.Request.QueryString["type"];
            ExcelOperator eo = new ExcelOperator();
            DataTable dt = new WorkInfoManager().GetWorkHandType(sbid, type);
            IWorkbook work = eo.GenerateSheet(dt, name);
            string path = Guid.NewGuid() + ".xls";
            string dict = context.Server.MapPath("~\\upload\\") + "exportxml";
            if (Directory.Exists(dict))
            {
                string[]  fs = Directory. GetFileSystemEntries(dict);
                foreach (string item in fs)
                {
                    File.Delete(item);
                }
            }

            while (!Directory.Exists(dict))
            {
                Directory.CreateDirectory(dict);
            }
          

            string newpath =   dict + "\\" + path; ;

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