﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemCodeEdit.aspx.cs"
    Inherits="OA.SystemCodeEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>系统参数设置</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Script/JqueryForm.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //            $("#txtIsEnable").jqxCheckBox({ width: 120, height: 25, checked: true });
            $('#form1').jqxValidator({
                rules: [
                       { input: '#txtCode', message: '编码必填!', action: 'keyup, blur', rule: 'required' },
                       { input: '#txtName', message: '名称必填!', action: 'keyup, blur', rule: 'required'}]
            });
            $('#form1').submit(function ()//提交表单 
            {
                var issuccess = $('#form1').jqxValidator('validate');
                if (issuccess) {
                    var options = {
                        url: 'handler/SystemCodeSaveHandler.ashx', //提交给哪个执行 
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
        </i><span>系统参数表</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <dl>
                <dl>
                    <dt>父名称</dt>
                    <dd>
                        <input name="txtParentName" type="text" id="txtParentName" readonly="readonly" runat="server" />
                    </dd>
                </dl>
                <dl>
                    <dt>编码</dt>
                    <dd>
                        <input name="txtID" type="hidden" id="txtID" runat="server" />
                        <input name="txtParentId" type="hidden" runat="server" id="txtParentId" />
                        <input name="txtCode" type="text" id="txtCode" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>名称</dt>
                    <dd>
                        <input name="txtName" type="text" id="txtName" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>启用</dt>
                    <dd>
                        <input id='txtIsEnable' type="checkbox" checked="checked" name="txtIsEnable" runat="server"
                            style='margin-left: 10px; float: left;' />
                        <span>启用</span>
                    </dd>
                </dl>
                <dl>
                    <dt>对应值</dt>
                    <dd>
                        <textarea name="txtResValue" id="txtResValue" runat="server" class="input big"></textarea>
                    </dd>
                </dl>
                <dl>
                    <dt>备注</dt>
                    <dd>
                        <textarea name="txtNode" id="txtNode" runat="server" rows="6" class="input big"></textarea>
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
