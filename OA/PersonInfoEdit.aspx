<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonInfoEdit.aspx.cs"
    Inherits="OA.PersonInfoEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>员工信息表</title>
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
            $("#txtBirthday").jqxDateTimeInput({ width: '250px', height: '25px', culture: 'zh-Hans', formatString: 'd' });
            if (!$("#hidBirthday").val()) {
                $("#txtBirthday").jqxDateTimeInput('setDate', null);
            } else {

                $("#txtBirthday").val($("#hidBirthday").val());
            }
            $('#form1').jqxValidator({
                rules: [
           { input: '#txtUserName', message: '用户名必填!', action: 'keyup, blur', rule: 'required' },
           
            { input: '#txtUserName', message: '用户名必须介于3-20个字符之间!', action: 'keyup, blur', rule: 'length=3,12' },
            { input: '#txtRealName', message: '真实姓名必填!', action: 'keyup, blur', rule: 'required' },
             { input: '#txtTelphone', message: '手机号必填!', action: 'keyup, blur', rule: 'required' },
             { input: '#txtEmail', message: '邮箱必填!', action: 'keyup, blur', rule: 'required' },
             { input: '#txtEmail', message: '无效的邮箱格式!', action: 'keyup', rule: 'email' }
           ]
            });
            $('#form1').submit(function ()//提交表单 
            {
                var issuccess = $('#form1').jqxValidator('validate');
                if (issuccess) {
                    var options = {
                        url: 'handler/PersonInfoSaveHandler.ashx', //提交给哪个执行 
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
                  showCollapseButton: true, maxHeight: 800, isModal: true, okButton: $('#okButton'),
                  cancelButton: $('#cancel'), maxWidth: 800, minHeight: 600, minWidth: 200, height: 600, width: 570,
                  autoOpen: false
              });
              $('#cancel').jqxButton({ width: '65px' });
              $('#okButton').jqxButton({ width: '65px' }).on("click", function () {
                  $("#txtSocrceDepart").val(selectName);
                  $("#txtDepartID").val(selectID);

              });
          });


          function open1() {

              $('#window').jqxWindow('open');

          }
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>员工信息表</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <input name="txtID" type="hidden" id="txtID" runat="server" />
            <input name="txtDepartID" type="hidden" id="txtDepartID" runat="server" />
            <dl>
                <dl>
                    <dt>用户名</dt>
                    <dd>
                        <input name="txtUserName" type="text" id="txtUserName" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>所属默认部门</dt>
                    <dd>
                        <input name="txtSocrceDepart" type="text" id="txtSocrceDepart" readonly="readonly"
                            runat="server" class="input small" datatype="n" sucmsg=" ">
                        <input name="selectDepart" type="button" id="selectDepart" onclick="open1();" style='font-size: 12px;
                            background: rgb(236, 236, 236);' value='选择部门' class="input small" datatype="n"
                            sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>手机号码</dt>
                    <dd>
                        <input name="txtTelphone" type="text" id="txtTelphone" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>真实姓名</dt>
                    <dd>
                        <input name="txtRealName" type="text" id="txtRealName" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>邮箱</dt>
                    <dd>
                        <input name="txtEmail" type="text" placeholder="someone@mail.com" id="txtEmail" runat="server"
                            class="input small" datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>所在地</dt>
                    <dd>
                        <input name="txtLocation" type="text" id="txtLocation" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>详细地址</dt>
                    <dd>
                        <input name="txtDetailedAddress" type="text" id="txtDetailedAddress" runat="server"
                            class="input small" datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>性别</dt>
                    <dd>
                        <asp:RadioButtonList ID="txtSex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="男" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="女" Value="0"></asp:ListItem>
                            <asp:ListItem Text="保密" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </dd>
                </dl>
                <dl>
                    <dt>身份证号</dt>
                    <dd>
                        <input name="txtIDCardNumber" type="text" id="txtIDCardNumber" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                <dl>
                    <dt>生日</dt>
                    <dd>
                        <div id="txtBirthday">
                        </div>
                        <input type="hidden" name="hidBirthday" runat="server" id="hidBirthday" />
                    </dd>
                </dl>
                <dl>
                    <dt>婚姻状况</dt>
                    <dd>
                        <asp:RadioButtonList ID="txtMarryStatus" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="未婚" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="已婚" Value="1"></asp:ListItem>
                            <asp:ListItem Text="离异" Value="2"></asp:ListItem>
                            <asp:ListItem Text="保密" Value="3" Selected="True"></asp:ListItem>
                        </asp:RadioButtonList>
                    </dd>
                </dl>
                <dl>
                    <dt>备注</dt>
                    <dd>
                        <textarea name="txtNote" type="text" id="txtNote" runat="server" class="input small"
                            style="width: 450px;" datatype="n" sucmsg=" " />
                    </dd>
                </dl>
            </dl>
        </div>
        <div class="page-footer">
            <div class="btn-list">
                <asp:Button ID="Button1" runat="server" class="btn" Text="提交保存" />
                <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
            </div>
            <div class="clear">
            </div>
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
