<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="OA.AdminIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
        .fix
        {
            width: 100%;
            height: 255px;
            border: 1px solid #ccc;
        }
        .box-title
        {
            font-size: 12px;
            height: 27px;
            line-height: 25px;
            text-indent: 7px;
            background: url(css/images/column-header-bg.png) repeat-x;
            border-bottom: 1px solid #ccc;
        }
        .box-title img
        {
            margin-right: 7px;
            padding-bottom: 3px;
            vertical-align: middle;
        }
        .nlist-3
        {
            float: left;
            width: 350px;
            overflow: hidden;
        }
        .nlist-3 ul
        {
            float: left;
            width: 344px;
        }
        .nlist-3 ul:after
        {
            clear: both;
            content: ".";
            display: block;
            height: 0;
            visibility: hidden;
        }
        .nlist-3 ul li
        {
            display: inline;
            float: left;
            margin-right: 20px;
            height: 108px;
        }
        .nlist-3 ul li a
        {
            display: block;
            width: 64px;
            height: 64px;
            border: 1px solid #fff;
            background: url(css/images/skin_icons.png) no-repeat #fff;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }
        .nlist-3 ul li a:hover
        {
            filter: alpha(opacity=100);
            opacity: 1;
        }
        .nlist-3 ul li a.icon-setting
        {
            background-position: 0 -629px;
        }
        .nlist-3 ul li a.icon-channel
        {
            background-position: -128px -629px;
        }
        .nlist-3 ul li a.icon-templet
        {
            background-position: -256px -629px;
        }
        .nlist-3 ul li a.icon-mark
        {
            background-position: -384px -629px;
        }
        .nlist-3 ul li a.icon-plugin
        {
            background-position: 0 -757px;
        }
        .nlist-3 ul li a.icon-user
        {
            background-position: -128px -757px;
        }
        .nlist-3 ul li a.icon-manaer
        {
            background-position: -256px -757px;
        }
        .nlist-3 ul li a.icon-log
        {
            background-position: -384px -757px;
        }
        .nlist-3 ul li span
        {
            display: block;
            width: 64px;
            height: 24px;
            line-height: 24px;
            text-align: center;
            font-size: 12px;
            color: #444;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <table style='padding: 0px 20px; width: 100%; height: 255px;'>
        <tr>
            <td style='width: 40%; padding-left: 20px; padding-right: 5px;'>
                <div class='fix'>
                    <div class='box-title'>
                        <div style="float: left">
                            <img src="css/images/chart_bar.png" alt="" width="20" height="20">待办任务
                        </div>
                        <div id="SeriesType" title="更多" style="float: right; padding-right: 10px; cursor: pointer;">
                            <a href="WorkInfoList.aspx?DaiBan=1">更多</a>
                        </div>
                    </div>
                    <table width="100%" style='border-left: none; border-right: none; border-top: none;'
                        border="0" cellspacing="0" cellpadding="0" class="ltable">
                        <tbody>
                            <tr class="odd_bg">
                                <th align="center">
                                    序号
                                </th>
                                <th align="left">
                                    任务名称
                                </th>
                                <th align="center">
                                    派工日期
                                </th>
                                <th width="20%" align="center">
                                    派工人
                                </th>
                                <th width="18%" align="center">
                                    状态
                                </th>
                                <th width="8%">
                                    办理
                                </th>
                            </tr>
                            <%=DaiBanRenWU %>
                        </tbody>
                    </table>
                </div>
            </td>
            <td style='width: 35%; padding-right: 5px; padding-left: 5px;'>
                <div class='fix'>
                    <div class='box-title'>
                        <div style="float: left">
                            <img src="css/images/chart_bar.png" alt="" width="20" height="20">我的派工记录
                        </div>
                        <div id="SeriesType" title="更多" style="float: right; padding-right: 10px; cursor: pointer;">
                            <a href="WorkInfoList.aspx?DaiBan=1">更多</a></div>
                    </div>
                    <table width="100%" style='border-left: none; border-right: none; border-top: none;'
                        border="0" cellspacing="0" cellpadding="0" class="ltable">
                        <tbody>
                            <tr class="odd_bg">
                                <th align="center">
                                    序号
                                </th>
                                <th align="left">
                                    任务名称
                                </th>
                                <th align="center">
                                    派工日期
                                </th>
                                <th width="20%" align="center">
                                    发起人
                                </th>
                                <th width="18%" align="center">
                                    状态
                                </th>
                            </tr>
                            <%=MyPaiGong%>
                        </tbody>
                    </table>
                </div>
            </td>
            <td style='width: 25%; padding-right: 20px; padding-left: 5px;'>
                <div class='fix'>
                    <div class='box-title'>
                        <div style="float: left">
                            <img src="css/images/chart_bar.png" alt="" width="20" height="20">系统通知
                        </div>
                        <div id="SeriesType" title="更多" style="float: right; padding-right: 10px; cursor: pointer;">
                            <a href="NoticeInfoList.aspx">更多</a></div>
                    </div>
                    <ul style='font-size: 12px; margin-left: 29px; margin-top: 13px;'>
                        <%=SystemGongGao %>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
    <table style='padding: 0px 20px; width: 100%; height: 255px;'>
        <tr>
            <td style='width: 40%; padding-left: 20px; padding-right: 5px;'>
                <div class='fix' style='border: none'>
                    <div class="nlist-3" style='margin-top: 20px; margin-left: 40px;'>
                        <ul>
                        <li><a class="icon-plugin" href="WorkInfoEdit.aspx"></a><span>报工填写</span></li>
                            <li><a class="icon-user" href="shebeiinfolist.aspx"></a><span>设备管理</span></li>
                            <li><a class="icon-manaer" href="WorkInfoList.aspx"></a><span>派工管理</span></li>
                            <li><a class="icon-log" href="YuanGongKaoQinList.aspx"></a><span>考勤管理</span></li>
                            <li><a class="icon-setting" href="SystemCodeList.aspx"></a><span>系统设置</span></li>
                            <li><a class="icon-channel" href="AdministrativeRegionsList.aspx"></a><span>地区维护</span></li>
                            <li><a class="icon-templet" href="PersonInfoList.aspx"></a><span>用户管理</span></li>
                            <li><a class="icon-mark" href="FuncAccessEdit.aspx"></a><span>权限管理</span></li>
                            
                        </ul>
                    </div>
                </div>
            </td>
            <td style='width: 60%; padding-right: 20px; padding-left: 5px;'>
                <div class='fix'>
                    <div class='box-title'>
                        <div style="float: left">
                            <img src="css/images/chart_bar.png" alt="" width="20" height="20">我的工作日志
                        </div>
                        <div id="SeriesType" title="更多" style="float: right; padding-right: 10px; cursor: pointer;">
                            <a href="DayLogList.aspx">更多</a></div>
                    </div>
                    <table width="100%" style='border-left: none; border-right: none; border-top: none;'
                        border="0" cellspacing="0" cellpadding="0" class="ltable">
                        <tbody>
                            <tr class="odd_bg">
                                <th align="center">
                                    序号
                                </th>
                                <th align="left">
                                    工作内容
                                </th>
                                <th align="center">
                                    工作日期
                                </th>
                                <th width="20%" align="center">
                                    工时
                                </th>
                            </tr>
                            <%=DayLogStr %>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
