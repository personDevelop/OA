<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbghcs.aspx.cs" Inherits="OA.sbghcs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>设备更换统计</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {



            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: '设备编号', type: 'string' },
{ name: '设备名称', type: 'string' },
{ name: '上报人', type: 'string' },
{ name: '上报时间', type: 'string' },
{ name: '故障信息', type: 'string' },
{ name: '处理信息', type: 'string' },
{ name: '处理人', type: 'string' },
{ name: '处理日期', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/WorkHandler.ashx'
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {
                    formatData: function (data) {

                        data.sbid = $("#txtID").val();
                        data.type = 1;

                        return data;
                    }

                }
            );
            //绑定树

            $("#treeGrid").jqxDataTable(
            {
                width: "100%",
                height: "90%",
                source: dataAdapter,
                sortable: true,
                columnsResize: true,
                serverProcessing: true,
                columns: [

{ text: '编号', align: 'center', dataField: '设备编号', minWidth: 20, width: 50 },
{ text: '名称', align: 'center', dataField: '设备名称', minWidth: 30, width: 70 },
{ text: '上报人', align: 'center', dataField: '上报人', minWidth: 20, width: 70 },
{ text: '上报时间', align: 'center', dataField: '上报时间', minWidth: 30, width: 100 },
{ text: '故障信息', align: 'center', dataField: '故障信息', minWidth: 100, width: 170 },
{ text: '处理信息', align: 'center', dataField: '处理信息', minWidth: 100, width: 170 },
{ text: '更换人', align: 'center', dataField: '处理人', minWidth: 20, width: 70 },
{ text: '更换时间', align: 'center', dataField: '处理日期', minWidth: 30, width: 100 }
                ]
            });

        });
        function exprot() {

            $.get("handler/ExpaortExcle.ashx", { sbid: $("#txtID").val(), type: 1, name: $("#txtSbName").val() + "更换统计" }, function (data) {

                if (data.success == "true") {
                    window.location = "upload/exportxml/" + data.msg;

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
            }, "json");

        }
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px;'>
    <form id="form1" runat="server">
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li><a href="javascript:;" id='pic' onclick="tabs(this);" class="selected"><span
                        id="txtSbName" runat="server"></span>设备更换统计</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content" id='pic_wrap' style="height: 310px;">
        <input name="txtID" type="hidden" id="txtID" runat="server" />
        <div id="treeGrid" style='margin-top: 1px;'>
        </div>
    </div>
    <div style="float: right; margin-bottom: 15px;">
        <input type="button" id="okButton" onclick="exprot();" class="btn" value="导出" />
    </div>
    </form>
</body>
</html>
