<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="indexItemInfo.aspx.cs" Inherits="OA.indexItemInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
        class="kk5">
        <tbody>
            <tr>
                <td colspan="2" valign="top" class="kk">
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
                                    <a href="login.aspx" target="_blank">登陆 &gt;&gt; </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" class="kk" width="40%">
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
