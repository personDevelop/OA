<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="indexworkinfo.aspx.cs" Inherits="OA.indexworkinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="1004" border="0" align="center" cellpadding="1" cellspacing="10" bordercolor="#FFFFFF" bgcolor="#F6F6F6">
  <tbody><tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" class="bg_qc">
      
       
      <table height="35" border="0" cellpadding="0" cellspacing="0">
        <tbody><tr>
          <td></td>
        </tr>
      </tbody></table>
      <table height="25" border="0" cellpadding="0" cellspacing="0">
        <tbody><tr>
          <td class="p24">
              <font class="z24"> <div id='news_title' runat=server></div></font>
              </td>
        </tr>
      </tbody></table>      
      <table height="35" border="0" cellpadding="0" cellspacing="0">
        <tbody><tr>
          <td></td>
        </tr>
      </tbody></table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F6F6F6" class="dx">
        <tbody><tr>
          <td height="20" align="center"> <div id='news_desc' runat=server></div> </td>
        </tr>
      </tbody></table>
      
      <table height="15" border="0" cellpadding="0" cellspacing="0">
        <tbody><tr>
          <td></td>
        </tr>
      </tbody></table>            
              <table height="15" border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td></td>
                </tr>
              </tbody></table>
              <table width="96%" border="0" cellpadding="0" cellspacing="0">
                <tbody> 

                <div id='news_content' runat=server></div>
                </tbody>
      </table>
      <table width="100%" height="60" border="0" cellpadding="0" cellspacing="0" class="dx">
        <tbody><tr>
          <td align="center" valign="middle"><input name="button" type="button" onclick="window.location='javascript:window.print()'" value="打印此页">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="button2" type="button" onclick="window.location='#'" value="返回顶部">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="button2" type="button" onclick="jscript:window.external.AddFavorite(document.location.href,document.title);" value="收藏本页">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="button2" type="button" onclick="window.location='javascript:window.close();'" value="关闭窗口">
          </td>
        </tr>
      </tbody></table>
      <table width="95%" border="0" align="center" cellpadding="5" cellspacing="0" style='display:none;'>
        <tbody><tr>
          <td align="left"><span class="red">上一篇：</span> 
              <a href="show_news.asp?id=10711&amp;jwsid=11">我所召开社区警民恳谈会</a>
              </td>
        </tr>
        <tr>
          <td align="left"><span class="red">下一篇：</span>
              
              <a href="show_news.asp?id=11015&amp;jwsid=11">三江所开展“两会”前统一清查行动</a>
              </td>
        </tr>
      </tbody></table></td>
  </tr>
</tbody></table>
</asp:Content>
