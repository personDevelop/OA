<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indexItemInfo.aspx.cs" Inherits="OA.indexItemInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>巡检设备</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/css_2.css" rel="stylesheet" type="text/css">
<script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="Script/index.js" type="text/javascript"></script>
<SCRIPT language=javascript type=text/javascript src="css/images/helper.js"></SCRIPT>
  <script type="text/javascript" src="css/images/helper.js"></script>
 
    <script type="text/javascript">
        $(function () {

            $("#toptongzhi").html($("#hidTopTongZhid").val());


        });
    
    
    </script>
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
                    document.getElementById("txtTime").value = now.getFullYear() + "年" + tmonth + "月" + now.getDate() + "日" + " " + hhp
                    setTimeout("ShowTime()", 100)
                }
                ShowTime();   
              </script>
</td>
<form id="Form1" runat=server>
<asp:HiddenField ID="hid" runat="server" />
 <asp:HiddenField ID="hidTopTongZhid" runat="server" />
</form>
    <td align="right" valign="middle">
     <table id='userPer' border="0" cellspacing="0" cellpadding="0" style='margin-top:-7px;'>
       <FORM id=loginform  onsubmit="javascript:return check_login_info(this);" method=post name=loginform action=handler/VerifyUser.ashx>
          <tr>
            <td>用户名：
              <input name="login_user" type="text" class="index_dr" id="login_user" size="5" datatype="Require" style="height:18px" msg="请填写正确的管理帐号！" />
              &nbsp;密码：
              <input name="login_pwd" type="password" class="index_dr" id="login_pwd" size="5" datatype="Require"  style="height:18px" msg="请填写正确的管理密码！" />
              &nbsp;
              验证码：
              <input name="rand_rs" type="text" class="index_dr" id="rand_rs" value="" size="4" maxlength="4" datatype="Require"  msg="请不要非法提交！"  style="height:18px"/>
              &nbsp;<IMG 
                              style="POSITION: relative; TOP: 6px; MARGIN-RIGHT: 4px;cursor:pointer;" 
                              id=login_captcha class=captchaimg 
                              onclick="this.src='randomCode.aspx?secode=ecisp_seccode&amp;' + Math.random()" 
                              border=0 
                              src="randomCode.aspx">
            <input name="Submit" type="submit" class="top-so"    value="登录" />
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
                  <a href="index.aspx" class="left" >
                  首页</a>                </td>
              </tr>
          </table>
          <!--导航 -->
		  </td>
          
          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="indexItemInfo.aspx" class="left" target=_blank>巡检设备</a></td>
              </tr>
          </table>
		  </td>
		  
		  <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="indexKaoQin.aspx" class="left" target=_blank>考勤统计</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="indexPaiGong.aspx" class="left" target=_blank>派工统计</a></td>
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
                <td height="38" align="center" style="display:none;color: #FFFFFF;text-decoration: none;font-size: 14px;font-weight: bold;">通知： <marquee scrollamount=5 width=400 onmouseover=stop() onmouseout=start()>
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
    <td>
    <table width="1004" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#000000" style="border: 5px solid #000000;">
  <tr>
    <td width="120" height="60" align="center" background="css/images/timebg.gif" class="white18">
	
<span id=localtime></span>
<script type="text/javascript">
    function showLocale(objD) {
        var str, colorhead, colorfoot;
        var yy = objD.getYear();
        if (yy < 1900) yy = yy + 1900;
        var MM = objD.getMonth() + 1;
        if (MM < 10) MM = '0' + MM;
        var dd = objD.getDate();
        if (dd < 10) dd = '0' + dd;
        var hh = objD.getHours();
        if (hh < 10) hh = '0' + hh;
        var mm = objD.getMinutes();
        if (mm < 10) mm = '0' + mm;
        var ss = objD.getSeconds();
        if (ss < 10) ss = '0' + ss;
        var ww = objD.getDay();
        if (ww == 0) colorhead = "<font color=\"#FF5300\">";
        if (ww > 0 && ww < 6) colorhead = "<font color=\"#FF5300\">";
        if (ww == 6) colorhead = "<font color=\"#FF5300\">";
        if (ww == 0) ww = "星期日";
        if (ww == 1) ww = "星期一";
        if (ww == 2) ww = "星期二";
        if (ww == 3) ww = "星期三";
        if (ww == 4) ww = "星期四";
        if (ww == 5) ww = "星期五";
        if (ww == 6) ww = "星期六";
        colorfoot = "</font>"
        str = colorhead + hh + ":" + mm + ":" + ss + "<br><font style='font-size: 24px':font-family: '微软雅黑';>" + ww + colorfoot;
        return (str);
    }
    function tick() {
        var today;
        today = new Date();
        document.getElementById("localtime").innerHTML = showLocale(today);
        window.setTimeout("tick()", 1000);
    }
    tick();
</script>
	
	</td>
    <td align="left" valign="top" background="css/images/timebg.gif"><table height="8" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <marquee scrollamount=5 width=870 height="50"onmouseover=stop() onmouseout=start()><span id="toptongzhi" >  </span></marquee></td>
  </tr>
</table>
       </td>
  </tr>
</table>
    

<!--滚动栏插件 -->
<!--导航-->
<!-- 这里开始签收文件栏-->
 
 <table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="kk5">
  <tbody><tr>
    <td colspan="2" valign="top" class="kk"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/news_bg.gif">
      <tbody><tr>
        <td width="120" height="29" align="center" class="white14B">巡检设备</td>
        <td align="right">&nbsp;&nbsp;</td>
         <td width="60"><a href="login.aspx" target=_blank>登陆 &gt;&gt; </a></td>
      </tr>
    </tbody></table>   </td>
  </tr>
  <tr>
	<td valign="top" class="kk" width="40%">
    <div id='sbinfo' runat=server></div>
	     </td>
	  <td valign="top" class="kk" width="40%">
      <iframe id="sbiframe" name="sbiframe" frameborder="0" style='border:none;width: 100%;height:400px;'></iframe>
      <!--调用窗口--></td>
  </tr>
</tbody></table>
<!-- 这里结束签收文件栏-->	
<table width="1004" border="0" align="center" cellpadding="15" cellspacing="0" background="images/nzcms/end_bg.gif" bgcolor="#FFFFFF"">
  <tr>
    <td align="center" valign="top" class="end"><span runat="server" id="down"></span>&nbsp; &nbsp; 本站最佳浏览效果：1024*768分辨率/建议使用微软公司浏览器IE6.0以上&nbsp;&nbsp;
<br />
<script language="JavaScript" src="count.asp" type="text/javascript"></script>
<br />
<table border="0" cellpadding="3" cellspacing="0">
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;&nbsp;&nbsp;<a href="index.aspx" target="_blank"><font color="#FFFFFF">本站由：致群智能工程有限公司搭建</font></a>&nbsp;&nbsp;&nbsp;</td>
    <td align="center" bgcolor="#006600">&nbsp;&nbsp;&nbsp;<a href="login.aspx" target="_blank"><font color="#FFFFFF">进入后台管理</font></a>&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></td>
  </tr>
</table>
</BODY>
</html>