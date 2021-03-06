﻿using System;
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
                //if (context.Session["Very_Code"] == null)
                //{
                //    context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"请刷新验证码！\"}");
                //}
                //else
                //{
                    //if (rand_rs != context.Session["Very_Code"].ToString())
                    //{
                    //    context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"验证码错误！\"}");
                    //    return;

                    //}
                    PersonInfo pr = new PersonInfo();
                    PersonInfoManager prManger = new PersonInfoManager();
                    if (prManger.checkUserIndentity(login_pwd, login_user))
                    {
                        //登陆成功
                        context.Session["UserName"] = login_user; //缓存用户名
                        WhereClip where = PersonInfo._.UserName == login_user;
                        pr = prManger.GetItemById(where);
                        if (pr == null)
                        {

                            context.Session["UserID"] = "root"; //缓存用户名
                            context.Session["RealName"] = "管理员";
                            context.Session["DepartID"] = "root";
                            context.Session["DepartName"] = "总部";
                        }
                        else
                        {
                            context.Session["UserID"] = pr.ID; //缓存用户名
                            context.Session["RealName"] = pr.RealName;
                            //缓存部门
                            AdministrativeRegions ar = prManger.GetDefaultDepartInfo(pr.ID);
                            if (ar != null)
                            {
                                context.Session["DepartID"] = ar.ID;
                                context.Session["DepartName"] = ar.Name;
                            }
                            //缓存所有部门
                            List<AdministrativeRegions> list = prManger.GetAllDepart(pr.ID);
                            context.Session["AllDepart"] = list;
                        }
                        string url = "main.aspx";
                        if (context.Request.UrlReferrer != null && !string.IsNullOrEmpty(context.Request.UrlReferrer.Query))
                        {
                            string refurl = context.Request.UrlReferrer.Query;
                            if (refurl.StartsWith("?ref=/"))
                            {
                                url = refurl.Substring(refurl.LastIndexOf('/')+1);

                            }

                        }
                        context.Response.Write("{\"result\":\"OK\",\"forward\":\"" + url + "\"}");

                    }
                    else
                    {
                        context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"用户名或密码错误！\"}");
                    }
                //}

            }
            catch (Exception ex)
            {
                context.Response.Write("{\"result\":\"ERROR\",\"errmsg\":\"" + ex.Message +ex.Source+ex.StackTrace+ "\"}");
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