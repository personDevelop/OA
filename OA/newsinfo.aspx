<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newsinfo.aspx.cs" Inherits="OA.newsinfo" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/css_2.css" rel="stylesheet" type="text/css">
<script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="Script/index.js" type="text/javascript"></script>
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0>
<!--登录框 -->

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/top_bg.jpg" bgcolor="#FFFFFF">
  <tr>
    <td height="28" valign="middle">&nbsp;&nbsp;<img src="css/images/time.gif" width="12" height="12" />&nbsp;
	
	
	今天是：<input name="Text" type="Text"  id="txtTime"  style="border:0px; width:160px; background:none; padding-top:0px; color:#000000">
            <script   language="javascript">
                function ShowTime() {
                    now = new Date()
                    tmonth = now.getMonth() + 1
                    thour = ((now.getHours() < 10) ? "0" : "") + now.getHours()
                    tminutes = ((now.getMinutes() < 10) ? "0" : "") + now.getMinutes()
                    tseconds = ((now.getSeconds() < 10) ? "0" : "") + now.getSeconds()
                    gweek = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")
                    hhp = gweek[now.getDay()]
                    document.getElementById("txtTime").value = now.getYear() + "年" + tmonth + "月" + now.getDate() + "日" + " " + hhp
                    setTimeout("ShowTime()", 100)
                }
                ShowTime();   
              </script>
</td>
    <td align="right" valign="middle">
      <table border="0" cellspacing="0" cellpadding="0">
        <form action="file/login.asp" method="post" name="form" id="form"onsubmit="return Validator.Validate(this,2)">
          <tr>
            <td>用户名：
              <input name="username" type="text" class="index_dr" id="username" size="5" datatype="Require" style="height:18px" msg="请填写正确的管理帐号！" />
              &nbsp;密码：
              <input name="userpassword" type="password" class="index_dr" id="userpassword" size="5" datatype="Require"  style="height:18px" msg="请填写正确的管理密码！" />
              &nbsp;
              验证码：
              <input name="number" type="text" class="index_dr" id="number" value="" size="4" maxlength="4" datatype="Require"  msg="请不要非法提交！"  style="height:18px"/>
              &nbsp;<img src="GetCode.bmp" alt="点击可以刷新验证码" onClick="this.src='file/getcode.asp?t='+(new Date().getTime());"/>
            <input name="Submit" type="submit" class="top-so" value="登录" />
            &nbsp;</td>
          </tr>
        </form>
      </table>
    </td>
    <td width="60" align="center"><a  href="javascript:" onClick="jscript:window.external.AddFavorite(document.location.href,document.title);">收藏本站</a></td>
  </tr>
</table>

<!--登录框 -->
<!--下拉这里开始 -->
<!--导航FLASH -->
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="flash/top/nzgov_06.jpg" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><img src="css/images/image2.jpg" /></td>
  </tr>
</table>
<!--导航FLASH -->
<!--导航 -->
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="images/nzcms/nzcms_top01.gif" bgcolor="#093887" class="top" >
  <tr>
    <td width="1004" height="38" align="center" valign="middle">
      <table border="0" cellpadding="0" cellspacing="0" id="sddm">
        <tr>
          
          <td align="left"><table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center">
                  <a href="index.asp" class="left" >
                  首页</a>                </td>
              </tr>
          </table>
          <!--导航 -->
		  </td>
          
          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>报工管理</a></td>
              </tr>
          </table>
		  </td>
		  
		  <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>派工管理</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>设备管理</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>后台登录</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="500" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms7.gif" >
              <tr>
                <td height="38" align="center" style="color: #FFFFFF;text-decoration: none;font-size: 14px;font-weight: bold;">通知： <marquee scrollamount=5 width=400 onmouseover=stop() onmouseout=start()>
		 最新放假通知信息！
		 </marquee></td>
              </tr>
          </table>
		  </td>
          
          
          
        </tr>
        
    </table></td>
  </tr>
</table>
<!--滚动栏插件 -->

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><iframe src="top_ggl.asp" name="sina_roll" width="1004" marginwidth="0" height="65" marginheight="0" scrolling="No" frameborder="NO" id="sina_roll" border="0"></iframe></td>
  </tr>
</table>

<!--滚动栏插件 -->
<!--导航-->
 
<!-- 这里开始签收文件栏-->

<table width="1004" border="0" align="center" cellpadding="1" cellspacing="10" bordercolor="#FFFFFF" bgcolor="#F6F6F6">
  <tbody><tr>
    <td align="center" valign="top" bgcolor="#FFFFFF" class="bg_qc">
      
      <table width="100%" height="27" border="0" cellpadding="8" cellspacing="0" bgcolor="#F6F6F6">
        <tbody><tr>
          <td class="p12">您的位置：<a href="index.asp?jwsid=11">首页</a>&nbsp;&gt;&gt;&nbsp;警务动态&nbsp;&gt;&gt;&nbsp;<a href="list_news.asp?id=668&amp;sort_id=657&amp;jwsid=11 &amp;title=警务动态">警务动态</a>
              
          </td>
        </tr>
      </tbody></table>
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
 <table width="1004" border="0" align="center" cellpadding="15" cellspacing="0" background="images/nzcms/end_bg.gif" bgcolor="#FFFFFF"">
  <tr>
    <td align="center" valign="top" class="end">主办单位：长清公安分局&nbsp; &nbsp; 本站最佳浏览效果：1024*768分辨率/建议使用微软公司浏览器IE6.0以上&nbsp;&nbsp;
<br />
<script language="JavaScript" src="count.asp" type="text/javascript"></script>
<br />
<table border="0" cellpadding="3" cellspacing="0">
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;&nbsp;&nbsp;<a href="http://www.ningzhi.net" target="_blank"><font color="#FFFFFF">本站由：致群智能工程有限公司搭建</font></a>&nbsp;&nbsp;&nbsp;</td>
    <td align="center" bgcolor="#006600">&nbsp;&nbsp;&nbsp;<a href="nz0808" target="_blank"><font color="#FFFFFF">进入后台管理</font></a>&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></td>
  </tr>
</table>
</BODY>
</html>