using System;
using System.Collections.Generic;
using System.Web;
using System.IO;
using OAEntity;
using Sharp.Common;
using Sharp.Data;

namespace OA.handler
{

    /// <summary>
    /// Summary description for uploadHandler
    /// </summary>
    public class uploadHandler : IHttpHandler
    {

        int FileMaxSize = 10240;//
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string ParentID = context.Request.Params["id"];
            HttpPostedFile fileUpload = context.Request.Files[0];
            if (fileUpload != null)
            {
                try
                {
                    string UploadDir = "../upload/";//图片保存的文件夹 
                    //图片保存的文件夹路径 
                    string path = context.Server.MapPath(UploadDir);
                    //每天上传的图片一个文件夹 
                    string folder = DateTime.Now.ToString("yyyyMM");
                    //如果文件夹不存在，则创建 
                    if (!Directory.Exists(path + folder))
                    {
                        Directory.CreateDirectory(path + folder);
                    }
                    //上传图片的扩展名 
                    string fileExtension = fileUpload.FileName.Substring(fileUpload.FileName.LastIndexOf('.'));
                    //判断文件大小 
                    if (fileUpload.ContentLength > FileMaxSize * 1024)
                    {
                        context.Response.Write("错误提示：上传的文件(" + fileUpload.FileName + ")超过最大限制：" + FileMaxSize + "KB");
                        return;
                    }
                    //保存图片的文件名 
                    //string saveName = Guid.NewGuid().ToString() + fileExtension; 
                    //使用时间+随机数重命名文件 
                    string strDateTime = DateTime.Now.ToString("yyMMddhhmmssfff");//取得时间字符串 
                    Random ran = new Random();
                    string strRan = Convert.ToString(ran.Next(100, 999));//生成三位随机数 
                    string saveName = strDateTime + strRan + fileExtension;
                    // Model.Album uc = new Model.Album();
                    // uc.Title = fileUpload.FileName;
                    //uc.ImagePath = folder + "/" + saveName;
                    //uc.PostTime = DateTime.Now;
                    //uc.Pid = int.Parse(id);
                    //bll.Album alb = new bll.Album();
                    // alb.add(uc);
                    //保存图片 
                    fileUpload.SaveAs(path + folder + "\\" + saveName);
                    string SBID = context.Request.QueryString.Get("sid");
                    //string FileName = "";
                    OAEntity.FileInfo fl = new OAEntity.FileInfo();
                    
                    fl.ID = Guid.NewGuid();
                    fl.SBID = SBID;
                    fl.FILENAME = fileUpload.FileName;
                    fl.FILEPATH = "upload/" + folder + "/" + saveName;
                    fl.FILEEXT = "";
                    fl.RecordStatus = StatusType.add;
                    OAManager.FileInfoManager flMgr = new OAManager.FileInfoManager();
                    //flMgr.RecordStatus == StatusType.add;
                    flMgr.Save(fl);

                    context.Response.Write("upload/" + folder + "/" + saveName + ";" + fl.ID);
                }
                catch
                {
                    context.Response.Write("错误提示：上传失败");
                }

            }
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