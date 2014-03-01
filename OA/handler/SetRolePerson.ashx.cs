using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using OAManager;
using OAEntity;
using Sharp.Common;

namespace OA.handler
{
    /// <summary>
    /// SetRolePerson 的摘要说明
    /// </summary>
    public class SetRolePerson : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            string msg = string.Empty;
            try
            {
                Guid RoleID = new Guid(rp["roleID"]);
                string personID = rp["person"];
                string[] personArray = personID.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                List<BaseEntity> list = new List<BaseEntity>();
                foreach (string item in personArray)
                {
                    RolePerson rpi = new RolePerson();
                    rpi.ID = Guid.NewGuid();
                    rpi.PersonID = new Guid(item);
                    rpi.RoleID = RoleID;
                    list.Add(rpi);

                }
                RoleInfoManager manager = new RoleInfoManager();
                manager.Save(list);
                context.Response.Write("{\"success\":\"true\"}");

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