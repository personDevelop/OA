using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Text;
using System.Collections.Specialized;

namespace OA.handler
{
    /// <summary>
    /// 保存 系统参数表
    /// </summary>
    public class FuncAccessSaveHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            NameValueCollection rp = context.Request.Form;
            string msg = string.Empty;
            try
            {

                if (string.IsNullOrEmpty(rp["roleID"]))
                {
                    msg = "角色不能为空，请选择角色";
                }
                else
                {
                    List<BaseEntity> list = new List<BaseEntity>();
                    int count = int.Parse((rp["count"]));
                    //先删除该角色的授权，然后重新创建
                    int loop = (rp.Count - 2) / 8;
                    Guid roleId= new Guid(rp["roleID"]);
                    for (int i = 0; i < loop; i++)
                    {
                        FuncAccess entity = new FuncAccess();
                        entity.ID = Guid.NewGuid();
                        entity.RoleID = roleId;
                        entity.FunctID = rp["acc[" + i + "][ID]"];
                        bool isbool = false;
                        if (bool.TryParse(rp["acc[" + i + "][FaccIsEnable]"],out isbool))
                        {
                            entity.IsEnable = isbool;
                        }
                        if (bool.TryParse(rp["acc[" + i + "][IsView]"], out isbool))
                        {
                            entity.IsView = isbool;
                        } 
                        list.Add(entity);
                    }

                    FuncAccessManager manager = new FuncAccessManager( );
                    manager.Save(roleId, list);
                    context.Response.Write("{\"success\":\"true\" }");
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
