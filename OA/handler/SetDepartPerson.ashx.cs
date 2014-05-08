using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sharp.Common;
using OAEntity;
using OAManager;
using System.Text;
namespace OA.handler
{
    /// <summary>
    /// SetDepartPerson 的摘要说明
    /// </summary>
    public class SetDepartPerson : IHttpHandler
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
                    DepartAndPerson rpi = new DepartAndPerson();
                    rpi.ID = Guid.NewGuid();
                    rpi.UserID = new Guid(item);
                    rpi.DepartID = RoleID;
                    list.Add(rpi);

                }
                AdministrativeRegionsManager manager = new AdministrativeRegionsManager();
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