<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DayLogEdit.aspx.cs" Inherits="OA.DayLogEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>新增工作日志</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Script/JqueryForm.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script src="Script/globalization/globalize.js" type="text/javascript"></script>
    <script src="Script/globalization/globalize.culture.zh-Hans.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#txtWordDate").jqxDateTimeInput({ width: '250px', height: '25px', culture: 'zh-Hans', formatString: 'd' });
           
            $('#form1').jqxValidator({
                rules: [
                                   { input: '#txtWordDate', message: '工作日期必填!', action: 'keyup, blur', rule: function (input, commit) {
                                       var date = $('#txtWordDate').jqxDateTimeInput('value');
                                       if (!date) {
                                           return false;
                                       } else {
                                           return true;
                                       }
                                   }
                                   },
                                     { input: '#txtContent', message: '工作内容必填!', action: 'keyup, blur', rule: 'required' }
                                   ]
            });
            $('#form1').submit(function ()//提交表单 
            {
                var issuccess = $('#form1').jqxValidator('validate');
                if (issuccess) {
                    var options = {
                        url: 'handler/DayLogSaveHandler.ashx', //提交给哪个执行 
                        type: 'POST',
                        dataType: 'json',
                        success: function (data) {
                            if (data.success == "true") {
                                $("#txtID").val(data.ID);
                                parent.art.dialog({
                                    title: '系统提示',
                                    content: '保存成功！',
                                    icon: 'succeed',
                                    lock: true,
                                    ok: function () {

                                    }
                                });
                            }
                            else {
                                parent.art.dialog({
                                    title: '系统提示',
                                    content: base64decode(data.msg),
                                    icon: 'succeed',
                                    lock: true,
                                    ok: function () {

                                    }
                                });
                            }
                        }
                    };
                    $('#form1').ajaxSubmit(options);

                }
                return false; //为了不刷新页面,返回false  
            });
        }); 
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>日志信息表</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <input name="txtID" type="hidden" id="txtID" runat="server" />
            <dl>
                <dl>
                    <dt>工作日期</dt>
                    <dd>
                        <div id='txtWordDate'>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>工时</dt>
                    <dd>
                        <input name="txtGS" type="text" id="txtGS" runat="server" class="input small" datatype="n"
                            sucmsg=" "><span>*8小时工作制</span>
                    </dd>
                </dl>
                <dl>
                    <dt>工作内容</dt>
                    <dd>
                        <textarea name="txtContent" rows="10" type="text" id="txtContent" runat="server"
                            class="input small" style="width: 450px;" datatype="n" sucmsg=" " />
                    </dd>
                </dl>
            </dl>
        </div>
        <div class="page-footer">
            <div class="btn-list">
                <asp:Button ID="Button1" runat="server" class="btn" Text="提交保存" />
                <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
