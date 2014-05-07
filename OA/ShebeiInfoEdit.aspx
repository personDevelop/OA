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
    <script type="text/javascript">
        var selectCode = "";
        var selectName = "";
        var selectID = "";
        $(function () {


            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'Code', type: 'string' },
{ name: 'Name', type: 'string' },
{ name: 'ParentID', type: 'string' },
{ name: 'ZipCode', type: 'string' },
{ name: 'Phone', type: 'string' },
{ name: 'ClassCode', type: 'string' },
{ name: 'Note', type: 'string' },
{ name: 'ShortName', type: 'string' },

                ],
                hierarchy:
                {
                    keyDataField: { name: 'ID' },
                    parentDataField: { name: 'ParentID' }
                },
                id: 'ID',
                url: 'handler/AdministrativeRegionsListHandler.ashx'
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {
                    formatData: function (data) {
                        if (source.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        if (!source.totalRecords) {
                            source.totalRecords = data.totalRecords;
                            data.value = data.rows;
                        }
                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );

            //绑定树

            $("#treeGrid").jqxTreeGrid
(
            {
                width: "89%",
                height: "490px",
                source: dataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,
                pageable: true,
                columnsResize: true,
                pageSize: 20,
                pagesizeoptions: ['20', '50', '100'],
                columns: [

{ text: '编码', align: 'center', dataField: 'Code', minWidth: 100, width: 150 },
{ text: '名称', align: 'center', dataField: 'Name', minWidth: 100, width: 150 },
 { text: '简称', align: 'center', dataField: 'ShortName', minWidth: 100, width: 150 },

{ text: '所属电话号码段', align: 'center', dataField: 'Phone', minWidth: 100, width: 150 },
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 }
                ]
            });



            $("#treeGrid").on('rowSelect', function (event) {
                // event arguments
                var args = event.args;
                // row index
                var index = args.index;
                // row data
                var rowData = args.row;
                selectCode = args.row["CODE"];
                selectName = args.row["Name"];
                selectID = args.row["ID"];

                // row key
                var rowKey = args.key;

                event.stopPropagation();
            });
            $('#treeGrid').on('rowDoubleClick',
                    function (event) {
                        $('#okButton').click();
                    });
            $('#window').jqxWindow({
                showCollapseButton: true, maxHeight: 600, isModal: true, okButton: $('#okButton'),
                cancelButton: $('#cancel'), maxWidth: 700, minHeight: 200, minWidth: 200, height: 500, width: 470,
                autoOpen: false
            });
            $('#cancel').jqxButton({ width: '65px' });
            $('#okButton').jqxButton({ width: '65px' }).on("click", function () {
                $("#txtSocrceDepart").val(selectName);
                $("#txtDepartID").val(selectID);

            });
        });


        function open1() {
         
            if ($("#txtIsNeiWai_0")[0].checked) {

                parent.art.dialog({
                    title: '系统提示',
                    content: '外部设备不能选择所属部门！',
                    icon: 'succeed',
                    lock: true,
                    ok: function () {
                        return;
                    }
                });
            } else {

                $('#window').jqxWindow('open');
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
        <input name="txtDepartID" type="hidden" id="txtDepartID" runat="server" />
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
                <dt>内部设备</dt>
                <dd>
                    <asp:RadioButtonList ID="txtIsNeiWai" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="外部设备" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="内部设备" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl>
                <dt>内部设备所属部门</dt>
                <dd>
                    <input name="txtSocrceDepart" type="text" id="txtSocrceDepart" readonly="readonly"
                        runat="server" class="input small" datatype="n" sucmsg=" ">
                    <input name="selectDepart" type="button" id="selectDepart" onclick="open1();" style='font-size: 12px;
                        background: rgb(236, 236, 236);' value='选择部门' class="input small" datatype="n"
                        sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>设备状态</dt>
                <dd>
                    <input name="txtState" type="text" id="txtState" readonly="readonly" runat="server"
                        class="input small" datatype="n" sucmsg=" ">
                </dd>
            </dl>
            <dl>
                <dt>地址</dt>
                <dd>
                    <input name="txtAddress" type="text" id="txtAddress" style='width: 600px;' runat="server"
                        class="input small" datatype="n" sucmsg=" ">
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
    <div id="window">
        <div id="windowHeader">
            <span>
                <img src="Script/styles/images/star.png" alt="" style="margin-right: 15px" />选择部门
            </span>
        </div>
        <div style="overflow: hidden;" id="windowContent">
            <div id="treeGrid" style='margin-top: 20px;'>
            </div>
            <div style="float: right; margin-top: 5px;">
                <input type="button" id="okButton" value="确定" style="margin-right: 10px" />
                <input type="button" id="cancel" value="取消" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
