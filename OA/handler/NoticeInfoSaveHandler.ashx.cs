using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Text;

namespace OA.handler
{
    /// <summary>
    /// 保存 系统参数表
    /// </summary>
    public class NoticeInfoSaveHandler : IHttpHandler
    {
        NoticeInfo entity = new NoticeInfo();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            string msg = string.Empty;
            try
            {

                if (string.IsNullOrEmpty(rp["txtID"]))
                {
                    entity.ID = Guid.NewGuid();
                }
                else
                {
                    entity.ID = new Guid(rp["txtID"]);
                    entity.RecordStatus = StatusType.update;
                }




                entity.CODE = rp["txtCODE"];


                entity.TITLE = rp["txtTITLE"];


                entity.SOURCE = rp["txtSOURCE"];


                entity.PUBDATE = rp["txtPUBDATE"];


                entity.CONTENT = rp["txtCONTENT"];


                entity.PUBUSER = rp["txtPUBUSER"];


                entity.NOTE = rp["txtNOTE"];


                entity.ISTOP = rp["txtISTOP"] == "on";


                entity.ISUSED = rp["txtISUSED"] == "on";



                //if (!string.IsNullOrEmpty(rp["txtParentId"]))//父ID传值参考
                //{
                //    entity.ParentId = new Guid(rp["txtParentId"]);
                //  }
                //  entity.IsEnable = rp["txtIsEnable"] == "on";//checkbox传值参考



                NoticeInfoManager manager = new NoticeInfoManager();
                // bool IsExit = manager.ExitCodeAndName(entity);//重复校验参考
                // if (IsExit)
                // {
                //     msg = "已存在相同编号或名称！";
                //  }
                //  else
                //  {
                manager.Save(entity);
                context.Response.Write("{\"success\":\"true\",\"ID\":\"" + entity.ID + "\"}");
                // }
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

