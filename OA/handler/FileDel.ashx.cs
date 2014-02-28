using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using OAEntity;
using Sharp.Common;
using Sharp.Data;

namespace OA.handler
{
    /// <summary>
    /// Summary description for FileDel
    /// </summary>
    public class FileDel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                context.Response.ContentType = "text/plain";
                if (null == context.Request.Form["fid"])
                    throw new Exception("未传文件名称！");
                string fid = context.Request.Form["fid"].ToString();
                OAEntity.FileInfo fl = new FileInfo();
                FileInfoManager flMgr = new FileInfoManager();
                fl=flMgr.GetItemById(new Guid(fid));
                if (DeleteFile("../"+fl.FILEPATH, context))//删除文件
                {
                    flMgr.DelateById(new Guid(fid));//删除数据库记录
                    context.Response.Write("sucess");
                }
                else
                {
                    context.Response.Write("failed");
                }
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.Message);
            }
        }
        private bool DeleteFile(string path, HttpContext context)
        {
            bool ret = false;
            System.IO.FileInfo file = new System.IO.FileInfo(context.Server.MapPath(path));
            if (file.Exists)
            {
                file.Delete();
                ret = true;
            }
            return ret;
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