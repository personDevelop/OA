<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeInfoEdit.aspx.cs"
    Inherits="OA.NoticeInfoEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>公告信息</title>
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
    <script type="text/javascript" charset="utf-8" src="Script/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="Script/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="Script/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#txtPUBDATE").jqxDateTimeInput({ width: '250px', height: '25px', culture: 'zh-Hans', formatString: 'd' });
            if ($("#hidPUBDATE").val()) {
                $("#txtPUBDATE").jqxDateTimeInput('setDate', $("#hidPUBDATE").val());
            }
            $('#form1').jqxValidator({
                rules: [
                                  { input: '#txtTITLE', message: '标题必填!', action: 'keyup, blur', rule: 'required' }

                                   ]
            });
            UE.getEditor('txtCONTENT');
            //$("#txtPUBDATE").jqxDateTimeInput({ width: '300px', height: '25px', culture: 'zh-Hans', formatString: 'd' });
            //$("#txtPUBDATE").jqxDateTimeInput('setDate', "");
            $('#form1').submit(function ()//提交表单 
            {
                var issuccess = true;
                if (issuccess) {
                    var options = {
                        url: 'handler/NoticeInfoSaveHandler.ashx', //提交给哪个执行 
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
                    return false; //为了不刷新页面,返回false  
                }
            });
        }); 
    </script>
</head>
<style>
    .edui-default
    {
        padding: 0;
        border: none;
    }
</style>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>公告信息</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li><a href="javascript:;" id='basic' onclick="tabs(this);" class="selected">基本信息</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content" style="display: block;">
        <input name="txtID" type="hidden" id="txtID" runat="server" />
        <dl>
            <dl style="display: none;">
                <dt>编号</dt>
                <dd>
                    <input name="txtCODE" type="text" id="txtCODE" runat="server" class="input small"
                        style='width: 300px;' datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>标题</dt>
                <dd>
                    <input name="txtTITLE" type="text" id="txtTITLE" runat="server" class="input small"
                        style='width: 800px;' datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl style="display: none;">
                <dt>来源</dt>
                <dd>
                    <input name="txtSOURCE" type="text" id="txtSOURCE" runat="server" style='width: 300px;'
                        class="input small" datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>发布日期</dt>
                <dd>
                    <div id='txtPUBDATE'>
                    </div>
                    <input type="hidden" runat="server" name="hidPUBDATE" id="hidPUBDATE" value=" " />
                </dd>
            </dl>
            <dl>
                <dt>发布人</dt>
                <dd>
                    <input name="txtPUBUSER" type="text" id="txtPUBUSER" runat="server" class="input small"
                        style='width: 300px;' datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd>
                    <input name="txtISTOP" type="checkbox" checked="checked" id="txtISTOP" runat="server"
                        class="input small" datatype="n" sucmsg=" ">是否置顶
                    <input name="txtISUSED" type="checkbox" checked="checked" id="txtISUSED" runat="server"
                        class="input small" datatype="n" sucmsg=" ">是否启用
                </dd>
            </dl>
            <dl>
                <dt>内容</dt>
                <dd>
                    <textarea name="txtCONTENT" id="txtCONTENT" runat="server" style='width: 800px;'
                        class="input big"></textarea>
                </dd>
            </dl>
            <dl style='display: none;'>
                <dt>备注</dt>
                <dd>
                    <input name="txtNOTE" type="hidden" id="txtNOTE" runat="server" class="input small"
                        style='width: 600px;' datatype="n" sucmsg=" ">
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
