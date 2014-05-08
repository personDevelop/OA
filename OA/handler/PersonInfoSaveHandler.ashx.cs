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
                List<BaseEntity> list = new List<BaseEntity>();
                PersonInfoManager manager = new PersonInfoManager();
                if (!string.IsNullOrEmpty(rp["txtDepartID"]))
                {
                    if (entity.RecordStatus == StatusType.update)
                    {
                        //先获取其默认部门
                        DepartAndPerson dp = manager.GetDefaultDepart(entity.ID);
                        if (dp == null)
                        {
                            AddDefault(rp, list);
                        }
                        else

                            if (dp.DepartID.ToString() != rp["txtDepartID"])
                            {
                                dp.IsDefault = false;
                                list.Add(dp);
                                //将单位单位设为默认ID
                                DepartAndPerson dpold = manager.GetOldDepart(entity.ID, rp["txtDepartID"]);
                                if (dpold == null)
                                {
                                    AddDefault(rp, list);
                                }
                                else
                                {
                                    dpold.IsDefault = true;
                                    list.Add(dpold);

                                }





                            }
                    }
                    else
                    {
                        //新增默认部门
                        AddDefault(rp, list);
                    }


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

                bool IsExit = manager.ExitCodeAndName(entity);//重复校验参考
                if (IsExit)
                {
                    msg = "已存在相同账户！";
                }
                else
                {
                    manager.Save(list);
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

        private void AddDefault(HttpRequest rp, List<BaseEntity> list)
        {

            DepartAndPerson dp = new DepartAndPerson();
            dp.ID = Guid.NewGuid();
            dp.UserID = entity.ID;
            dp.DepartID = new Guid(rp["txtDepartID"]);
            dp.IsDefault = true;
            list.Add(dp);
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
