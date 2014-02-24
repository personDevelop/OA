using System;
using System.Collections.Generic;
using System.Web;
using System.IO;

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
                    fileUpload.SaveAs(path + folder + "/" + saveName);
                    context.Response.Write(UploadDir + folder + "/" + saveName);
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