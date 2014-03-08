<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrativeRegionsEdit.aspx.cs"
    Inherits="OA.AdministrativeRegionsEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>行政区域</title>
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
                        url: 'handler/AdministrativeRegionsSaveHandler.ashx', //提交给哪个执行 
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
        </i><span>行政区域</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <input name="txtID" type="hidden" id="txtID" runat="server" />
            <input name="txtParentID" type="hidden" runat="server" id="txtParentID" />
            <dl>
              <dl>
                    <dt>上级行政区域</dt>
                    <dd>
                      <input name="txtParentName" type="text" id="txtParentName" readonly="readonly" runat="server" />
                    </dd>
                </dl>
                <dl>
                    <dt>编码</dt>
                    <dd>
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
                    <dt>简称</dt>
                    <dd>
                        <input name="txtShortName" type="text" id="txtShortName" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>邮政编码</dt>
                    <dd>
                        <input name="txtZipCode" type="text" id="txtZipCode" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>所属电话号码段</dt>
                    <dd>
                        <input name="txtPhone" type="text" id="txtPhone" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>备注</dt>
                    <dd>
                        <input name="txtNote" type="text" id="txtNote" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
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
