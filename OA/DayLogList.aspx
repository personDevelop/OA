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
    <script type="text/javascript">

        $(function () {


            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'Content', type: 'string' },
{ name: 'WordDate', type: 'string' },
{ name: 'UserID', type: 'string' },
{ name: 'CreateDate', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'GS', type: 'string' }


                ],
                id: 'ID',
                url: 'handler/DayLogListHandler.ashx'
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
                 { text: '工作日期', align: 'center', dataField: 'WordDate', minWidth: 100, width: 150 },
{ text: '工作内容', align: 'center', dataField: 'Content', minWidth: 100, width: 350 },
{ text: '工时', align: 'center', dataField: 'GS', minWidth: 100, width: 150 },
{ text: '填报时间', align: 'center', dataField: 'CreateDate', minWidth: 100, width: 150 },
{ text: '填报人', align: 'center', dataField: 'UserName', minWidth: 100, width: 150 },

                   {
                       text: '操作', align: 'center', width: 150, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value) {
                           return "<a href='DayLogEdit.aspx?ID=" + row + "'>修改</a> <a onclick='return deleteDayLog();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

        function AddChild() {
            var url = "DayLogEdit.aspx";

            var selection = $("#treeGrid").jqxDataTable('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                url += "?ParentId=" + rowData.ID + "&ParentName=" + rowData.Name;
                location.href = url;
            } else {
                Msg.ShowError("请先选择父节点，且只能选择一个！");

            }

        }
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
                            Msg.ShowError(base64decode(data.msg));
                        }
                    }
                }
                );
                } else {
                    Msg.ShowError("请先选择要删除的节点，且只能选择一个！");

                }
            });

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
    <form id="form1" runat="server">
    <div id="treeGrid">
    </div>
    </form>
</body>
</html>
