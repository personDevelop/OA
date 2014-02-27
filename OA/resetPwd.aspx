<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPwd.aspx.cs" Inherits="OA.resetPwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>修改密码</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <link href="Script/artDialog/skins/simple.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="Script/artDialog/plugins/iframeTools.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Script/JqueryForm.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script type="text/javascript">
        function sub() {
            if ($("#txtPassBefore").val() == "") {
                parent.art.dialog.alert('请输入原密码！');
                return false;
            }
            if ($("#txtPassNew").val() == "") {
                parent.art.dialog.alert('请输入新密码！');
                return false;
            }
            if ($("#txtPassNew").val() == $("#txtPassBefore").val()) {
                parent.art.dialog.alert('新密码不能与旧密码相同！');
                return false;
            }
            if ($("#txtPassAgain").val() == "") {
                parent.art.dialog.alert('请再次输入新密码！');
                return false;
            }
            if ($("#txtPassAgain").val() !== $("#txtPassNew").val()) {
                parent.art.dialog.alert('两次输入密码不一致！');
                return false;
            }
            resetPwd();
            // 
        }

        function resetPwd() {
            var vsasync = true;
            var vsdata = { "p1": $("#txtPassBefore").val(), "p2": $("#txtPassNew").val(), "p3": $("#txtPassAgain").val() }
            $.ajax({
                url: "handler/resetPass.ashx",
                type: "post",
                data: vsdata,
                async: vsasync,
                dataType: "text",
                success: function (reval) {
                    if (reval == "") {
                        parent.art.dialog({
                            title: '系统提示',
                            content: '修改成功！',
                            icon: 'succeed',
                            lock: true,
                            ok: function () {
                            }
                        });
                        window.setTimeout(function () { parent.logout(); }, 2000);
                        return;
                    }
                    parent.art.dialog.alert(reval);
                },
                error: function (err) {
                    throw err.responseText;
                    return false;
                }
            });
        }
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>重置密码</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
     <div class="content-tab-wrap">
      <div id="floatHead" class="content-tab">
        <div class="content-tab-ul-wrap">
          <ul>
            <li><a href="javascript:;" id='basic' onclick="tabs(this);" class="selected">修改密码</a></li>
          </ul>
        </div>
      </div>
    </div>
        <div class="tab-content" style="display: block;">
            <dl>
                <dl>
                    <dt>用户名</dt>
                    <dd>
                         <input name="txtUserName" type="text" id="txtUserName" runat="server" readonly=readonly class="input mid" style='width:250px;' >
                    </dd>
                </dl>
                <dl>
                    <dt>原密码</dt>
                    <dd>
                          <input name="txtPassBefore" type=password id="txtPassBefore" runat="server" class="input small" style='width:250px;'>
                    </dd>
                </dl>
                <dl>
                    <dt>新密码</dt>
                    <dd>
                        <input name="txtPassNew" type=password id="txtPassNew" runat="server" class="input small" style='width:250px;'>
                    </dd>
                </dl>
                <dl>
                    <dt>重复密码</dt>
                    <dd>
                         <input name="txtPassAgain" type=password id="txtPassAgain" runat="server" class="input small" style='width:250px;'>
                    </dd>
                </dl>
            </dl>
            <div class="page-footer">
            <div class="btn-list" style='margin-left: 166px;bottom:auto;' >
                <input name="btnReturn" type="button" value="修改密码" class="btn" onclick="sub();">
                <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
            </div>
            <div class="clear">
            </div>
        </div>
        </div>
        
    </div>
    </form>
</body>
</html>
