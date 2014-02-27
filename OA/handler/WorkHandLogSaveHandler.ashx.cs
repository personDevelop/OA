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
    public class WorkHandLogSaveHandler : IHttpHandler
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
                work.RecordStatus = StatusType.update;
                work.Status = zt;
                ShebeiInfo s = new ShebeiInfo();
                s.ID = manager.GetItemById(work.ID).ID;
                s.RecordStatus = StatusType.update;
                
                if (zt == "处理中")
                {
                    string[] zprid = rp["txtZprID"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] zprName = rp["txtZprName"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    work.CurrentUser = rp["txtZprName"];
                    for (int i = 0; i < zprid.Length; i++)
                    {
                        WorkHandLog tem = SetValue(rp);
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
                    work.CurrentUser = "";
                    WorkHandLog tem = SetValue(rp);
                    tem.HandSequence = maxsequenc;
                    entityList.Add(tem);
                    s.State = "正常";
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
        public WorkHandLog SetValue(HttpRequest rp)
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
