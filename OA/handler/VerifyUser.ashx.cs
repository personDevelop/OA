using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using OAEntity;
using OAManager;
using Sharp;
using Sharp.Common;
using Sharp.Data;


namespace OA.handler
{
    /// <summary>
    /// Summary description for VerifyUser
    /// </summary>
    public class VerifyUser : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                context.Response.ContentType = "text/plain";
                HttpRequest rp = context.Request;

                string login_user = rp["login_user"].ToString();
                string login_pwd = rp["login_pwd"].ToString();
                string rand_rs = rp["rand_rs"].ToString();
                if (context.Session["Very_Code"]==null)
                {
                    context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"请刷新验证码！\"}");
                }
                else
                {
                    if (rand_rs != context.Session["Very_Code"].ToString())
                    {
                        context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"验证码错误！\"}");
                        return;

                    }
                    PersonInfo pr = new PersonInfo();
                    PersonInfoManager prManger = new PersonInfoManager();
                    if (prManger.checkUserIndentity(login_pwd, login_user))
                    {
                        //登陆成功
                        context.Session["UserName"] = login_user; //缓存用户名
                        WhereClip where = PersonInfo._.UserName == login_user;
                        pr = prManger.GetItemById(where);
                        context.Session["UserID"] = pr.ID; //缓存用户名
                        //prManger.GetItemById(
                        context.Response.Write("{\"result\":\"OK\",\"forward\":\"main.aspx\"}");

                    }
                    else
                    {
                        context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"用户名或密码错误！\"}");
                    }
                }

            }
            catch (Exception ex)
            {
                context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\""+ex.Message+"\"}");
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