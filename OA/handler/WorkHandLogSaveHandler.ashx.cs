using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAEntity;
using OAManager;
using Sharp.Common;
using System.Text;
using System.Web.SessionState;

namespace OA.handler
{
    /// <summary>
    /// 保存 系统参数表
    /// </summary>
    public class WorkHandLogSaveHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest rp = context.Request;
            string msg = string.Empty;
            try
            {
                WorkInfoManager manager = new WorkInfoManager();
                List<BaseEntity> entityList = new List<BaseEntity>();
                int maxsequenc = manager.GetMaxSequence(new Guid(rp["txtWorkID"]));
                string zt = rp["txtHandResult"];
                WorkInfo work = new WorkInfo();
                work.ID = new Guid(rp["txtWorkID"]);
                work = manager.GetItemById(work.ID);
                work.RecordStatus = StatusType.update;
                work.Status = zt;
                ShebeiInfo s = new ShebeiInfo();
                s = new ShebeiInfoManager().GetItemById(work.SbID);

                if (zt == "处理中")
                {
                    string[] zprid = rp["txtZprID"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] zprName = rp["txtZprName"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    work.CurrentUser = rp["txtZprName"];
                    for (int i = 0; i < zprid.Length; i++)
                    {
                        WorkHandLog tem = SetValue(rp, context);
                        tem.DownEr = new Guid(zprid[i]);
                        tem.DownName = zprName[i];
                        tem.HandSequence = maxsequenc;

                        entityList.Add(tem);
                    }
                    s.State = zt;
                }
                else
                {
                    work.RealTime = DateTime.Now;
                    work.CurrentUser = manager.GetLastUserName(work.ID) ;
                    WorkHandLog tem = SetValue(rp, context);
                    tem.HandSequence = maxsequenc;
                    int handType = 0;
                    int.TryParse(rp["txtHandType"], out handType);
                    tem.HandType = handType;
                    entityList.Add(tem);
                    s.State = "正常";

                    if (rp["txtHandType"] == "0")
                    {
                        //维修

                        string sql = "update ShebeiInfo set GZTJ=isnull(GZTJ,0)+1 where id='" + s.ID + "'";
                        Sharp.Data.SessionFactory.Default.FromCustomSql(sql).ExecuteNonQuery();
                    }
                    else if (rp["txtHandType"] == "1")
                    {
                        //更换  
                        string sql = "update ShebeiInfo set GHTJ=isnull(GHTJ,0)+1 where id='" + s.ID + "'";
                        Sharp.Data.SessionFactory.Default.FromCustomSql(sql).ExecuteNonQuery();
                    }

                }

                entityList.Add(work);
                entityList.Add(s);
                manager.Save(entityList);
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
        public WorkHandLog SetValue(HttpRequest rp, HttpContext context)
        {
            WorkHandLog entity = new WorkHandLog();
            if (string.IsNullOrEmpty(rp["txtID"]))
            {
                entity.ID = Guid.NewGuid();
            }
            else
            {
                entity.ID = new Guid(rp["txtID"]);
                entity.RecordStatus = StatusType.update;
            }
            if (!string.IsNullOrEmpty(context.Session["UserName"] as string))
            {
                entity.Uper = new Guid(context.Session["UserID"].ToString());
                entity.UpName = context.Session["RealName"] as string;
            }
            entity.WorkID = new Guid(rp["txtWorkID"]);
            entity.CurrentStaus = rp["txtHandResult"];
            entity.ChuliYj = rp["txtChuliYj"];
            entity.HandDate = DateTime.Now;
            entity.HandResult = entity.CurrentStaus;
            return entity;
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
