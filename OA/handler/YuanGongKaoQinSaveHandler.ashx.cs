using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Text;
using System.Collections.Specialized;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// 保存 系统参数表
    /// </summary>
    public class YuanGongKaoQinSaveHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            NameValueCollection rp = context.Request.Form;
            string msg = string.Empty;
            try
            {
                string succesmsg = "";
                List<BaseEntity> list = new List<BaseEntity>();
                if (rp.AllKeys.Contains("ID"))
                {
                    //单条记录保存
                    YuanGongKaoQin entity = new YuanGongKaoQin();
                    if (string.IsNullOrEmpty(rp["ID"]))
                    {
                        entity.ID = Guid.NewGuid();
                        entity.CreateDate = DateTime.Now;
                        if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                        {
                            entity.CreaterID = new Guid(context.Session["UserID"].ToString());

                        }
                        else
                        {
                            entity.CreaterID = Guid.NewGuid();
                        }
                    }
                    else
                    {
                        entity.ID = new Guid(rp["ID"]);
                        entity.RecordStatus = StatusType.update;
                        if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                        {
                            entity.UpdaterID = new Guid(context.Session["UserID"].ToString());
                            entity.Updatedate = DateTime.Now;
                        }
                    }
                    entity.UserID = new Guid(rp["PersonID"]);
                    entity.UserName = rp["RealName"];
                    entity.StartTime = rp["StartTime"];
                    entity.EndTime = rp["EndTime"];
                    entity.KQRQ = DateTime.Parse(rp["KQRQ"]);
                    entity.Status = rp["Status"];
                    entity.Note = rp["Note"];
                    list.Add(entity);
                    succesmsg = "{\"success\":\"true\",\"ID\":\"" + entity.ID + "\"}";
                }
                else
                {
                    //多条记录保存
                    int rows = ((rp.Count - 1) / 14) - 1;
                    for (int i = 0; i < rows; i++)
                    {
                        string rowpix = string.Format("row[{0}]", i);
                        YuanGongKaoQin entity = new YuanGongKaoQin();
                        if (string.IsNullOrEmpty(rp[rowpix + "[ID]"]))
                        {
                            entity.ID = Guid.NewGuid();
                            entity.CreateDate = DateTime.Now;
                            if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                            {
                                entity.CreaterID = new Guid(context.Session["UserID"].ToString());
                               
                            }
                            else
                            {
                                entity.CreaterID = Guid.NewGuid();
                            }
                        }
                        else
                        {
                            entity.ID = new Guid(rp[rowpix + "[ID]"]);
                            entity.RecordStatus = StatusType.update;
                            if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
                            {
                                entity.UpdaterID = new Guid(context.Session["UserID"].ToString());
                                entity.Updatedate = DateTime.Now;
                            }
                        }
                        entity.UserID = new Guid(rp[rowpix + "[PersonID]"]);
                        entity.UserName = rp[rowpix + "[RealName]"];
                        entity.StartTime = rp[rowpix + "[StartTime]"];
                        entity.EndTime = rp[rowpix + "[EndTime]"];
                        entity.KQRQ = DateTime.Parse(rp["KQRQ"]);
                        entity.Status = rp[rowpix + "[Status]"];
                        entity.Note = rp[rowpix + "[Note]"];
                        list.Add(entity);
                    }
                    succesmsg = "{\"success\":\"true\" }";
                }

                YuanGongKaoQinManager manager = new YuanGongKaoQinManager();
                manager.Save(list);
                context.Response.Write(succesmsg);

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
