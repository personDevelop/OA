﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="OA.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>长清公安分局中和运维管理系统</title>
    <link href="Script/artDialog/skins/simple.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="Script/artDialog/plugins/iframeTools.js" type="text/javascript"></script>
    <script src="Script/main.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
    <style>
        *
        {
            font-family: "Microsoft YaHei";
        }
        body, ul, li, h1
        {
            margin: 0;
            padding: 0;
            font-size: 12px;
        }
        div
        {
            margin: 0;
            padding: 0;
        }
        .nav li
        {
            display: block;
            float: left;
            margin: 0;
            padding: 0px 15px;
            border-left: 1px solid #4dc4f0;
            border-right: 1px solid #1da0d0;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            height: 42px;
            line-height: 42px;
            vertical-align: middle;
        }
        .nav .selected
        {
            background: #16a0d3;
        }
        .nav li:hover
        {
            background: #50c0e9;
        }
        .nav
        {
            display: block;
            float: left;
            height: 100%;
            border-right: 1px solid #4dc4f0;
        }
        ol, ul
        {
            list-style: none;
        }
        .main-sidebar
        {
            border-right: 1px solid #dbdbdb;
            background: #f9f9f9;
        }
        .main-sidebar
        {
            position: absolute;
            top: 42px;
            bottom: 24px;
            left: 0;
            width: 180px;
            overflow-y: auto;
            overflow-x: hidden;
        }
        .main-container
        {
            background: #fff;
        }
        .main-container
        {
            position: absolute;
            top: 42px;
            right: 0;
            bottom: 24px;
            left: 181px;
            overflow: hidden;
        }
        .nav-list > li
        {
            display: block;
            padding: 0;
            margin: 0;
            border: 0;
            border-top: 1px solid #fcfcfc;
            border-bottom: 1px solid #e5e5e5;
            position: relative;
        }
        .nav-list > li > a
        {
            display: block;
            height: 38px;
            line-height: 36px;
            padding: 0 16px 0 7px;
            color: #585858;
            text-shadow: none !important;
            font-size: 13px;
            text-decoration: none;
        }
        .nav-list > li > a:hover
        {
            background-color: #FFF;
            color: #1963aa;
        }
        .nav-list > li > a:hover:before
        {
            display: block;
            content: "";
            position: absolute;
            top: -1px;
            bottom: 0;
            left: 0;
            width: 3px;
            max-width: 3px;
            overflow: hidden;
            background-color: #3382af;
        }
        
        .arrowselected
        {
            position: absolute;
            top: 9.5px;
            right: -1px;
            width: 7px;
            height: 21px;
            background: url(css/images/skin_icons.png) -40px -356px no-repeat;
        }
        .active
        {
            background: white;
        }
        .active a
        {
            color: #1963aa;
        }
        .main-tab
        {
            height: 42px;
            background: #f5f5f5;
            border-bottom: 1px solid #e5e5e5;
        }
        
        .nav-right .icon-option i
        {
            display: block;
            width: 20px;
            height: 42px;
            background: url(css/images/skin_icons.png) -199px -305px no-repeat;
        }
        .drop-box
        {
            display: none;
            position: absolute;
            top: 42px;
            right: 1px;
        }
        .list-box .list-group h2
        {
            position: relative;
            display: block;
            padding: 10px 0 10px 20px;
            font-size: 12px;
            color: #222;
            font-weight: normal;
            line-height: 20px;
            background: #e9e9e9;
            border-top: 1px solid #f4f4f4;
            border-bottom: 1px solid #ddd;
            margin: 0;
            cursor: pointer;
        }
        .list-box .list-group ul li .item.pack
        {
            background: #f3f3f3;
            text-decoration: none;
        }
        .list-box .list-group ul li .item
        {
            position: relative;
            display: block;
            padding: 10px 0 10px 20px;
            line-height: 20px;
            height: 20px;
            border-bottom: 1px solid #dbdbdb;
            background: white;
            cursor: pointer;
        }
        .folder
        {
            background: url(css/images/skin_icons.png) -40px -197px no-repeat;
            float: left;
            height: 20px;
            width: 20px;
        }
        .nav-right .icon-info
        {
            float: left;
            padding: 0 10px 0 34px;
            height: 42px;
            line-height: 42px;
            border-right: 1px solid #1da0d0;
            background: url(css/images/skin_icons.png) no-repeat 0 -429px;
        }
        .nav-right
        {
            float: right;
        }
        .nav-right .icon-info span
        {
            display: block;
            padding-top: 4px;
            color: #ebebeb;
            font-size: 12px;
            line-height: 1.2em;
        }
        .nav-right .icon-option
        {
            position: relative;
            display: block;
            cursor: pointer;
            float: left;
            padding: 0 15px;
            height: 42px;
            border-left: 1px solid #4dc4f0;
            background: #16a0d3;
        }
        .subblock
        {
            display: none;
        }
        .selected
        {
            background: blue;
        }
        .subMenu
        {
            margin-left: 32px;
        }
        .item
        {
            font-size: 12px;
            color: #666;
            text-decoration: none;
        }
        
        .logo i
        {
            background: url(css/images/skin_icons.png);
            width: 10px;
            height: 10px;
        }
        
        .drop-box
        {
            display: block;
            width: 117px;
            z-index: 111111;
            position: absolute;
            top: 42px;
            right: 1px;
        }
        .drop-box .arrow
        {
            position: absolute;
            display: block;
            top: 0;
            right: 15px;
            width: 21px;
            height: 11px;
            text-indent: -999999px;
            background: url(css/images/skin_icons.png) no-repeat 0 -356px;
        }
        .drop-box .drop-item
        {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #b1b1b1;
            background: #fff;
            box-shadow: 0 0 4px 0 rgba(0, 0, 0, 0.2);
        }
        .drop-box .drop-item li a
        {
            display: block;
            padding: 8px 15px;
            color: #222;
            font-size: 12px;
            text-decoration: none;
            line-height: 1em;
            text-align: center;
            white-space: nowrap;
        }
        .drop-box .drop-item li a:hover
        {
            color: #fff;
            text-decoration: none;
            background: #55afeb;
        }
        
        .logo
        {
            display: block;
            float: left;
            width: 280px;
            height: 42px;
            font-family: 微软雅黑;
            line-height: 34px;
            color: white;
            margin-left: 20px;
            font-size: 18px;
            font-weight: normal;
            overflow: hidden;
        }
    </style>
    <script>

        function openPer() {
            $("#mainframe").attr("src", "PersonInfoEdit.aspx?ID=" + $("#uid").val());
        }
        $(function () {

            $(".pack").click(function () {
                if ($(this).hasClass("close")) {
                    $(this).parent().find("ul").slideDown();
                    $(this).removeClass("close");
                } else {
                    $(this).parent().find("ul").slideUp();
                    $(this).addClass("close");
                }
            });
            $(".subblock .item").click(function () {
                $(".subblock .item").css("background", "white");
                $(".subblock .item").css("color", "#666");

                $(".subblock .item").find(".arrow").removeClass("arrowselected");
                $(this).css("background", "rgb(68, 144, 240)");
                $(this).css("color", "white");
                $(this).find(".arrow").addClass("arrowselected");

            });
            $(".icon-option").click(function () {
                if ($("#menuslide").css("display") == "block") {
                    $("#menuslide").hide();
                } else {
                    $("#menuslide").show();
                }
            });
        });
    </script>
</head>
<body class='ui-sunny'>
    <form runat="server">
    <asp:HiddenField ID="uid" runat="server" />
    <div id="header" style='height: 42px; background: #33B5E5;'>
        <div class="header-box">
            <h1 class="logo">
                <i></i><span id='sys_title' runat="server"></span>
            </h1>
            <div class="nav-right">
                <ul id="nav" class="nav" style='margin-right: 6px; border-left: 1px solid #1da0d0;'>
                    <li class=""><i class="icon-0"></i><span>
                    <a href="WorkInfoList.aspx?DaiBan=1"  target='mainframe'>待办任务</a></span></li>

                    <li class=""><i class="icon-0"></i><span>
                    <a href="index.aspx"  target='_blank'>系统首页</a></span></li>
                </ul>
                <div class="icon-info">
                    <span>
                        <asp:Label ID="LabelUser" runat="server" Text="Label"></asp:Label>
                        默认用户组 </span>
                </div>
                <div class="icon-option">
                    <i></i>
                    <div class="drop-box" id='menuslide' style='display: none;'>
                        <div class="arrow">
                        </div>
                        <ul class="drop-item">
                            <li><a target="mainframe" onclick="openPer();">个人资料</a></li>
                            <li><a  href="index.aspx" target="_blank">系统首页</a></li>
                            <li><a href="SystemCodeList.aspx" target="mainframe">系统设置</a></li>
                           <%-- onclick="linkMenuTree(false, '');"--%>
                            <li><a  href="resetPwd.aspx" target="mainframe">修改密码</a></li>
                          
                            <li><a id="lbtnExit" href="javascript:logout()">注销登录</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-sidebar">
        <div class='list-box'>
            <div class="list-group" name="控制面板" style="display: block;">
                <%=Navigator %> 
            </div>
        </div>
    </div>
    </form>
    <div class="main-container">
        <iframe name='mainframe' id='mainframe' src='AdminIndex.aspx' frameborder="0" style='height: 100%;
            width: 100%; border: none;'></iframe>
    </div>
    <div style='border-top: 1px solid #DADADA; height: 24px; background: rgb(241, 241, 241);
        bottom: 0; z-index: 11111; position: absolute; width: 100%; text-align: center;
        line-height: 24px; font-size: 12px; color: #929292;'>
        版权所有：诚达信息科技有限公司 @copywrite 1998-2014
    </div>
</body>
</html>
