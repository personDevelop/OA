<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OA.login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>OA系统登录</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/images/all.css">
<LINK rel=stylesheet type=text/css href="css/images/login.css">
<SCRIPT language=javascript type=text/javascript src="css/images/jquery.min.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript src="css/images/helper.js"></SCRIPT>

<SCRIPT type=text/javascript>
    $(document).ready(function () {
        var h = $(window).height();
        $('#centerlogin').css({ height: h });
    });
    var resizeTimer = null;

    function sizewindow() {
        var h = $(window).height();
        $('#centerlogin').css({ height: h });
    }

    window.onresize = sizewindow;
    var adminuser_login_login_error = "请输入用户名和密码";
    var adminuser_login_incorrect = "用户名或者密码输入错误";
    var adminuser_login_seccode_error = "验证码输入错误";
    var ie_cookie_err = "浏览器禁用COOKIE";
		</SCRIPT>
<!--[if IE 6]> 
		<style type="text/css" media="screen"> 
		body {behavior:url("template/css/csshover.htc"); } 
		</style>
		<![endif]-->
<META name=GENERATOR content="MSHTML 8.00.6001.23532"></HEAD>
<BODY>
<SCRIPT language=javascript type=text/javascript> 
<!--
    function on_success(response) {
        var o_result = _eval_json(response);
        if (!o_result) {
            return on_failure(response);
        }

        var stat = document.getElementById("loginform_stat");
        if (o_result.result == "ERROR") {
            document.forms["loginform"].reset();
            reload_captcha();

            stat.innerHTML = o_result.errmsg;
            return false;
        } else if (o_result.result == "OK") {
            stat.innerHTML = "OK，正在重定向......";

            window.location.href = o_result.forward;
        } else {
            return on_failure(response);
        }
    }

    function on_failure(response) {
        document.forms["loginform"].reset();
        reload_captcha();

        document.getElementById("loginform_stat").innerHTML = "请求失败！";
        return false;
    }

    function reload_captcha() {
        var captcha = document.getElementById("login_captcha");
        if (captcha) {
            captcha.src = "randomCode.aspx?s=" + random_str(6);
        }
    }

    $(document).ready(function () {
        $("#login_user").focus();
    });
//-->
</SCRIPT>

<DIV class=login-div>
<TABLE style="BORDER-COLLAPSE: collapse" id=centerlogin border=0 cellPadding=0 
width="100%">
  <TBODY>
  <TR>
    <TD style="WIDTH: 564px" vAlign=center align=middle>
      <DIV class=login-form>
      <TABLE style="BORDER-COLLAPSE: collapse" border=0 cellPadding=0 
        width=564><TBODY>
        <TR>
          <TD class=login-top></TD></TR>
        <TR>
          <TD class=login-bg>
            <TABLE style="WIDTH: 100%">
              <TBODY>
              <TR>
                <TD class=login></TD></TR>
              <TR>
                <TD>
                  <TABLE style="WIDTH: 100%">
                    <TBODY>
                    <TR>
                      <TD class=login-title>
                        <TABLE style="WIDTH: 100%">
                          <TBODY>
                          <TR>
                            <TD><IMG title=admin 
                              src="css/images/login_title.png"></TD></TR>
                          <TR>
                            <TD 
                              class=loigntitle>OA系统.加您的管理和推广,必能带来客户和订单！</TD></TR></TBODY></TABLE></TD>
                      <TD class=loign-line><IMG alt=line 
                        src="css/images/login_line.png"></TD>
                      <TD class=login-form-center><!--from-->
                        <FORM id=loginform 
                        onsubmit="javascript:return check_login_info(this);" 
                        method=post name=loginform action=handler/VerifyUser.ashx><INPUT id=_m 
                        value=frontpage type=hidden name=_m><INPUT id=_a 
                        value=dologin type=hidden name=_a><INPUT id=_r 
                        value=_ajax type=hidden name=_r> 
                        <TABLE border=0 cellPadding=0>
                          <TBODY>
                          <TR>
                            <TD class=logintd></TD>
                            <TD class=logintd2>
                              <DIV class=loginwanntile>
                              <UL>
                                <LI><SPAN 
                              id=loginform_stat>请输入用户名和密码</SPAN></LI></UL></DIV></TD></TR>
                          <TR>
                            <TD class=logintd>用户名</TD>
                            <TD class=logintd2><INPUT style="WIDTH: 175px" 
                              id=login_user class=infoInput type=text 
                              name=login_user></TD></TR>
                          <TR>
                            <TD class=logintd>密　码</TD>
                            <TD class=logintd2><INPUT style="WIDTH: 175px" 
                              id=login_pwd class=infoInput type=password 
                              name=login_pwd></TD></TR>
                          <TR>
                            <TD class=logintd>安全问题</TD>
                            <TD class=logintd2 style="POSITION: relative;"><IMG 
                              style="POSITION: relative; TOP: 6px; MARGIN-RIGHT: 4px;cursor:pointer;" 
                              id=login_captcha class=captchaimg 
                              onclick="this.src='randomCode.aspx?secode=ecisp_seccode&amp;' + Math.random()" 
                              border=0 
                              src="randomCode.aspx"><INPUT 
                              style="WIDTH: 52px" id=rand_rs class=infoInput 
                              type=text name=rand_rs></TD></TR>
                          <TR>
                            <TD class=logintd></TD>
                            <TD class=logintd2><INPUT class=buttonface value=登陆管理平台 type=submit name=button></TD></TR></TBODY></TABLE></FORM><!--form_end--></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD 
class=login-down></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></DIV>
<SCRIPT language=javascript type=text/javascript> 
<!--
    function check_login_info(thisForm) {
        if (/^\s*$/.test(thisForm.elements["login_user"].value)) {
            alert("请输入用户名！");
            thisForm.elements["login_user"].focus();
            return false;
        }
        if (/^\s*$/.test(thisForm.elements["login_pwd"].value)) {
            alert("请输入密码！");
            thisForm.elements["login_pwd"].focus();
            return false;
        }
        if (/^\s*$/.test(thisForm.elements["rand_rs"].value)) {
            alert("请输入答案！");
            thisForm.elements["rand_rs"].focus();
            return false;
        }
        $("#loginform_stat").css({ "display": "block" });
        $("#loginform_stat").html("正在检查用户......");
        _ajax_submit(thisForm, on_success, on_failure);
        return false;
        return true;
    }
-->
</SCRIPT>
<DIV id=footer></DIV><!--likai-->
</BODY>
</HTML>