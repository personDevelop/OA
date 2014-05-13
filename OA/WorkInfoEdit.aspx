<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkInfoEdit.aspx.cs" Inherits="OA.WorkInfoEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>设备故障上报</title>
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
            $("#txtPlanTime").jqxDateTimeInput({ width: '250px', height: '25px', culture: 'zh-Hans', formatString: 'd' });

            $('#form1').submit(function ()//提交表单 
            {

                var options = {
                    url: 'handler/WorkInfoSaveHandler.ashx', //提交给哪个执行 
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
                return false; //为了不刷新页面,返回false  

            });
        }); 
    </script>
    <script type="text/javascript">

        $(function () {
            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'Code', type: 'string' },
{ name: 'Name', type: 'string' },
{ name: 'GuiGe', type: 'string' },
{ name: 'Address', type: 'string' },
{ name: 'IsEnable', type: 'string' },
{ name: 'Note', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/ShebeiInfoListHandler.ashx?status=正常'
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {
                    formatData: function (data) {
                        if (source.totalRecords) {
                            // update the $skip and $top params of the OData service.
                            // data.pagenum - page number starting from 0.
                            // data.pagesize - page size
                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        if (!source.totalRecords) {
                            source.totalRecords = data.total;
                            source.value = data.rows;

                        }
                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );
            //绑定树

            $("#treeGrid").jqxDataTable(
            {
                width: "100%",
                height: "400",
                source: dataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                filterable: true,
                filterMode: 'simple',
                pageSize: 20,
                columns: [
{ text: '编号', align: 'center', dataField: 'Code', minWidth: 40, width: 80 },
{ text: '名称', align: 'center', dataField: 'Name', minWidth: 40, width: 100 },
{ text: '地址', align: 'center', dataField: 'Address', minWidth: 100, width: 150 },
{ text: '型号', align: 'center', dataField: 'GuiGe', minWidth: 40, width: 80 }
                ]
            });

        });

        var selectCode = "";
        var selectName = "";
        var selectID = "";
        var selectAddress = "";
        $(function () {

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
                selectAddress = args.row["Address"];
                // row key
                var rowKey = args.key;

                event.stopPropagation();
            }); $('#treeGrid').on('rowDoubleClick',
function (event) {
    $('#okButton').click( );
});
            $('#window').jqxWindow({
                showCollapseButton: true, maxHeight: 600, isModal: true, okButton: $('#okButton'),
                cancelButton: $('#cancel'), maxWidth: 700, minHeight: 200, minWidth: 200, height: 500, width: 470,
                autoOpen: false
            });
            $('#cancel').jqxButton({ width: '65px' });
            $('#okButton').jqxButton({ width: '65px' }).on("click", function () {
                $("#txtSbName").val(selectName);
                $("#txtSbID").val(selectID);
                $("#txtAddress").val(selectAddress);
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
        </i><span>设备故障上报</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <input name="txtID" type="hidden" id="txtID" runat="server" />
            <input name="txtSbID" type="hidden" id="txtSbID" runat="server" />
            <dl>
                <dl>
                    <dt>设备</dt>
                    <dd>
                        <input name="txtSbName" type="text" id="txtSbName" readonly="readonly" runat="server"
                            class="input small" datatype="n" sucmsg=" ">
                        <input name="selectshebei" type="button" id="selectshebei" onclick="open1();" style='font-size: 12px;
                            background: rgb(236, 236, 236);' value='选择设备' class="input small" datatype="n"
                            sucmsg=" ">
                    </dd>
                </dl>
                <%--  <dl>
                    <dt>市</dt>
                    <dd>
                        <input name="txtCity" type="text" id="txtCity" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                        县、区<input name="txtXian" type="text" id="txtXian" runat="server" class="input small"
                            datatype="n" sucmsg=" ">镇
                        <input name="txtZhen" type="text" id="txtZhen" runat="server" class="input small"
                            datatype="n" sucmsg=" ">
                    </dd>
                </dl>--%>
                <dl>
                    <dt>详细地址</dt>
                    <dd>
                        <input name="txtAddress" type="text" id="txtAddress" runat="server" class="input small"
                            style="width: 450px;" datatype="n" sucmsg=" ">
                    </dd>
                </dl>
                 <dl>
                    <dt>故障分类</dt>
                    <dd>
                        <select name="txtGuzhang" id="txtGuzhang" runat="server" class="input small">
                            <option value='供电故障'>供电故障</option>
                            <option value='光纤故障'>光纤故障</option>
                            <option value='设备故障'>设备故障</option>
                            <option value='其他故障'>其他故障</option>
                        </select>
                       
                    </dd>
                </dl>
                <dl>
                    <dt>故障信息</dt>
                    <dd>
                        <textarea name="txtGuZhangXx" rows="10" type="text" id="txtGuZhangXx" runat="server"
                            class="input small" style="width: 450px;" datatype="n" sucmsg=" " />
                    </dd>
                </dl>
                <dl>
                    <dt>处理意见</dt>
                    <dd>
                        <textarea name="txtChuLiYiJian" type="text" id="txtChuLiYiJian" runat="server" class="input small"
                            style="width: 450px;" datatype="n" sucmsg=" " />
                    </dd>
                </dl>
                <dl>
                    <dt>计划修复完时间</dt>
                    <dd>
                        <div id='txtPlanTime'>
                        </div>
                    </dd>
                </dl>
                
                <dl>
                    <dt>填报人联系电话</dt>
                    <dd>
                        <input name="txtTel" type="text" id="txtTel" runat="server" class="input small" datatype="n"
                            sucmsg=" ">
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
                <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div id="window">
        <div id="windowHeader">
            <span>
                <img src="Script/styles/images/star.png" alt="" style="margin-right: 15px" />选择设备
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
