<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShebeiInfoEdit.aspx.cs"
    Inherits="OA.ShebeiInfoEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>设备信息表</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <link href="Script/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="css/file.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/uploadify/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script src="Script/Uploaderone.js" type="text/javascript"></script>
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
            var vsData = GetSbList();
            $("#txtFILEID").uploadone({ "loadData": vsData });
            $("#uploadify").css("margin-left", "15px");
            $('#form1').submit(function ()//提交表单 
            {
                var issuccess = $('#form1').jqxValidator('validate');
                if (issuccess) {
                    var options = {
                        url: 'handler/ShebeiInfoSaveHandler.ashx', //提交给哪个执行 
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
                                Msg.ShowError(base64decode(data.msg));
                            }
                        }
                    };
                    $('#form1').ajaxSubmit(options);
                }
                return false; //为了不刷新页面,返回false  
            });



        });

        function GetSbList() {
            var resobj = null;
            var sid = $("#txtID").val();
            var vsJsonData = { "sid": sid };
            $.ajax({
                url: "handler/FileInfoListHandler.ashx",
                type: "post",
                data: vsJsonData,
                dataType: "json",
                async: false,
                success:
                function (reval) {
                    resobj = reval;
                },
                error: function (err) {
                    throw err.responseText;
                    return false;
                }
            });
            return resobj;

        }

        function tabs(ele) {
            var id = ele.id;
            if (id == "pic") {
                $("#basic_wrap").hide();
                $("#pic_wrap").show();
                $("#pic").addClass("selected");
                $("#basic").removeClass("selected");

            }
            if (id == "basic") {
                $("#pic_wrap").hide();
                $("#basic_wrap").show();
                $("#basic").addClass("selected");
                $("#pic").removeClass("selected");
            }
        }

        
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>设备信息表</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li><a href="javascript:;" id='basic' onclick="tabs(this);" class="selected">基本信息</a></li>
                    <li><a href="javascript:;" id='pic' onclick="tabs(this);" class="">设备图片</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content" id='pic_wrap' style="display: none; height: 350px;">
        <input name="txtFILEID" type="text" id="txtFILEID" runat="server" />
    </div>
    <div class="tab-content" id='basic_wrap' style="display: block;">
        <input name="txtID" type="hidden" id="txtID" runat="server" />
        <dl>
            <dl>
                <dt>设备编号</dt>
                <dd>
                    <input name="txtCode" type="text" id="txtCode" runat="server" class="input small"
                        datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>设备名称</dt>
                <dd>
                    <input name="txtName" type="text" id="txtName" runat="server" class="input small"
                        datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>规格型号</dt>
                <dd>
                    <input name="txtGuiGe" type="text" id="txtGuiGe" runat="server" class="input small"
                        datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>是否启用</dt>
                <dd>
                    <input name="txtIsEnable" type="checkbox" id="txtIsEnable" checked="checked" runat="server"
                        class="input small" datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>设备状态</dt>
                <dd>
                    <input name="txtState" type="text" id="txtState" readonly="readonly" runat="server" class="input small"
                        datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>设备外链地址</dt>
                <dd>
                    <input name="txtPATH" type="text" id="txtPATH" style='width: 600px;' runat="server"
                        class="input small" datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>备注</dt>
                <dd>
                    <textarea name="txtNote" id="txtNote" runat="server" style='width: 600px;' rows="6"
                        class="input big"></textarea>
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
