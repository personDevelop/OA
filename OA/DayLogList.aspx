<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DayLogList.aspx.cs" Inherits="OA.DayLogList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>日志信息表</title>
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {

            var userid = $("#hidUserId").val();
            var url = 'handler/DayLogListHandler.ashx';
            if (userid) {
                url = 'handler/DayLogListHandler.ashx?PersonID=' + userid;
            }

            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'Content', type: 'string' },
{ name: 'WordDate', type: 'date', format: "d" },
{ name: 'UserID', type: 'string' },
{ name: 'CreateDate', type: 'date', format: "d" },
{ name: 'UserName', type: 'string' },
{ name: 'GS', type: 'string' }


                ],
                id: 'ID',
                url: url
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {
                    formatData: function (data) {
                        if (source.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        data.RQ1 = $("#txtTime1").val();
                        data.RQ2 = $("#txtTime2").val();
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        
                            source.totalRecords = data.totalRecords;
                            data.value = data.rows;
                       
                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );

            //绑定树

            $("#treeGrid").jqxDataTable
(
            {
                width: "90%",
                height: "400px",
                source: dataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,
                pageable: true,
                columnsResize: true,
                pageSize: 20,
                pagesizeoptions: ['20', '50', '100'],
                columns: [
                 { text: '工作日期', cellsAlign: 'center', align: 'center', dataField: 'WordDate', minWidth: 50, width: 100, cellsFormat: 'yyyy-MM-dd' },
{ text: '工作内容', align: 'center', dataField: 'Content', minWidth: 100, width: 450 },
{ text: '工时', align: 'center', cellsAlign: 'center', dataField: 'GS', minWidth: 50, width: 80 },
{ text: '填报时间', align: 'center', cellsAlign: 'center', dataField: 'CreateDate', minWidth: 50, width: 100, cellsFormat: 'yyyy-MM-dd' },
{ text: '填报人', align: 'center', cellsAlign: 'center', dataField: 'UserName', minWidth: 50, width: 80 },

                   {
                       text: '操作', align: 'center', cellsAlign: 'center', width: 150, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value, d) {
                           return "<a href='DayLogEdit.aspx?ID=" + d.ID + "'>修改</a> <a onclick='return deleteDayLog();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

        function deleteDayLog() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/DayLogDeleteHandler.ashx?";

                var selection = $("#treeGrid").jqxDataTable('getSelection');
                if (selection.length == 1) {
                    var rowData = selection[0];
                    url += "ID=" + rowData.ID;
                    $.ajax(
                {
                    url: url,
                    dataType: 'json',
                    success: function (data) {
                        if (data.success == "true") {
                            $("#treeGrid").jqxDataTable('deleteRow', rowData.ID);
                            parent.art.dialog({
                                title: '系统提示',
                                content: '删除成功！',
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
                }
                );
                } else {
                    parent.art.dialog({
                        title: '系统提示',
                        content: "请先选择要删除的节点，且只能选择一个！",
                        icon: 'succeed',
                        lock: true,
                        ok: function () {

                        }
                    });

                }
            });

        }
        function search1() {

            $("#treeGrid").jqxDataTable('updateBoundData');
        }
        function exprot() {

            $.get("handler/ExpaortDayExcle.ashx", { personid: $("#hidUserId").val(), rq1: $("#txtTime1").val(), rq2: $("#txtTime2").val() }, function (data) {
              
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
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>日志信息表</span>
    </div>
    <div style='margin-top: 20px;'>
        <ul class="icon-list">
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <div style='margin-top: 11px; margin-bottom: 10px'>
        <div style="clear: both;">
            <table style="width: 100%;">
                <tr>
                    <td style='width: 80px;'>
                        开始日期
                    </td>
                    <td style='width: 190px;'>
                        <div class="input-date">
                            <input runat="server" name="txtTime1" type="text" id="txtTime1" class="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期"
                                sucmsg=" ">
                            <i></i>
                        </div>
                    </td>
                    <td style='width: 80px;'>
                        结束日期
                    </td>
                    <td style='width: 190px;'>
                        <div class="input-date">
                            <input runat="server" name="txtTime2" type="text" id="txtTime2" class="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期"
                                sucmsg=" ">
                            <i></i>
                        </div>
                    </td>
                    <td>
                        <ul class="icon-list">
                            <li><a class="search" onclick="search1();" href="#"><i></i><span>查询</span></a></li>
                            <li><a class="search" onclick="exprot();" href="#"><i></i><span>导出</span></a></li>
                        </ul>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hidUserId" runat="server" />
    <div id="treeGrid">
    </div>
    </form>
</body>
</html>
