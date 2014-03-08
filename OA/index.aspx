<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="OA.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="1004" border="0" align="center" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
        <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF" class="kk">
                <table width="100%" height="6" border="0" cellpadding="0" cellspacing="1" background="images/nzcms/nzcms_left_bg.gif"
                    bgcolor="#F9F9F9">
                    <tr>
                        <td width="65" height="20" align="center">
                            工单状态
                        </td>
                        <td align="center">
                            故障申报内容
                        </td>
                        <td width="100" align="center">
                            受理人
                        </td>
                        <td width="140" align="center">
                            处理结果
                        </td>
                        <td width="120" align="center">
                            时间
                        </td>
                    </tr>
                </table>
                <div id="workinfo" runat="server">
                </div>
            </td>
            <td width="250" align="center" valign="top" class="kk">
                <!-- 这里开始通知通告栏-->
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                    class="right_kq">
                    <tr>
                        <td width="30" height="27" align="center" background="images/nzcms/left.gif">
                            <img src="css/images/laba.gif" />
                        </td>
                        <td width="80" align="left" background="images/nzcms/left.gif" class="title12b">
                            通知通告
                        </td>
                        <td align="right" class="p12">
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <marquee scrollamount="2" width="240" height="150" direction="up" onmouseover="stop()"
                    onmouseout="start()">
<div id="news_wrap" runat=server></div></marquee>
                <!-- 这里结束通知通告栏-->
            </td>
        </tr>
    </table>
    <table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
        class="kk5">
        <tbody>
            <tr>
                <td colspan="2" valign="top" class="kk" style='border-bottom: none;'>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/news_bg.gif">
                        <tbody>
                            <tr>
                                <td width="120" height="29" align="center" class="white14B">
                                    巡检设备
                                </td>
                                <td align="right">
                                    &nbsp;&nbsp;
                                </td>
                                <td width="60">
                                    <a href="indexItemInfo.aspx" target="_blank">更多 &gt;&gt; </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" class="kk" width="40%" style='border-right: none;'>
                    <div id='sbinfo' runat="server">
                    </div>
                </td>
                <td valign="top" class="kk" width="40%">
                    <iframe id="sbiframe" name="sbiframe" frameborder="0" style='border: none; width: 100%;
                        height: 400px;'></iframe>
                    <!--调用窗口-->
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
