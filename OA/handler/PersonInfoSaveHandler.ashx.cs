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
    public class PersonInfoSaveHandler : IHttpHandler
    {
        PersonInfo entity = new PersonInfo();
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
                entity.UserName = rp["txtUserName"];
                if (entity.RecordStatus == StatusType.add)
                {
                    entity.Pwd = entity.UserName;
                    entity.CreateDate = DateTime.Now;
                }

                entity.Email = rp["txtEmail"];

                entity.RealName = rp["txtRealName"];

                entity.Location = rp["txtLocation"];
                entity.DetailedAddress = rp["txtDetailedAddress"];
                entity.Sex = int.Parse(rp["txtSex"]); 
                entity.Telphone = rp["txtTelphone"];
                entity.IDCardNumber = rp["txtIDCardNumber"];

                if (!string.IsNullOrEmpty(rp["txtBirthday"]))
                {
                    entity.Birthday = DateTime.Parse(rp["txtBirthday"]);
                }
                entity.MarryStatus = int.Parse(rp["txtMarryStatus"]); 
                entity.UpdateDATE = DateTime.Now;
                entity.Note = rp["txtNote"];
                PersonInfoManager manager = new PersonInfoManager();
                bool IsExit = manager.ExitCodeAndName(entity);//重复校验参考
                if (IsExit)
                {
                    msg = "已存在相同账户！";
                }
                else
                {
                    manager.Save(entity);
                    context.Response.Write("{\"success\":\"true\",\"ID\":\"" + entity.ID + "\"}");
                }
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
