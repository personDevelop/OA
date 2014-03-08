<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShebeiInfoList.aspx.cs" Inherits="OA.ShebeiInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>设备信息表</title>
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
{ name: 'Code', type: 'string' },
{ name: 'Name', type: 'string' },
{ name: 'GuiGe', type: 'string' },
{ name: 'IsEnable', type: 'string' },
{ name: 'Note', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/ShebeiInfoListHandler.ashx'
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
                width: "80%",
                height: "410px",
                source: dataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                pageSize: 2,

                columns: [
{ text: '设备编号', align: 'center', dataField: 'Code', minWidth: 100, width: 150 },
{ text: '设备名称', align: 'center', dataField: 'Name', minWidth: 100, width: 200 },
{ text: '规格型号', align: 'center', dataField: 'GuiGe', minWidth: 100, width: 200 },
{ text: '是否启用', align: 'center', dataField: 'IsEnable', minWidth: 90, width: 90 },
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 },

                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value,data) {
                           return "<a href='ShebeiInfoEdit.aspx?ID=" + data.ID + "'>修改</a> <a onclick='return deleteShebeiInfo();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

       
        function deleteShebeiInfo() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/ShebeiInfoDeleteHandler.ashx?";

                var selection = $("#treeGrid").jqxDataTable('getSelection');
                if (selection.length == 1) {
                    var rowData = selection[0];
                    url += "ID=" + rowData.ID;
                    $.ajax(
                {
                    url: url,
                    dataType: 'json',
                    success: function (data) {
                        var rows = $("#treeGrid").jqxDataTable('getRows');
                        var rowIndex = -1;
                        for (var i = 0; i < rows.length; i++) {
                            if (rows[i].ID == rowData.ID) {
                                rowIndex = i;
                                break;
                            }

                        }
                        if (data.success == "true") {
                            $("#treeGrid").jqxDataTable('deleteRow', rowIndex);
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
    </script>
</head>
<body style='padding:0 30px;padding-top:20px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>设备列表</span>  
    </div>
    <div style='margin-top: 20px;'>
        <ul class="icon-list">
            <li><a class="add" href="ShebeiInfoEdit.aspx"><i></i><span>新增</span></a></li>
            <li><a onclick="return deleteShebeiInfo();" id="btnDelete" class="del" href="#"><i></i><span>
                删除</span></a></li>
        </ul>
    </div>
    <div style=" clear:both;"></div>
    <form id="form1" runat="server">
    <div id="treeGrid" style='margin-top: 20px;'>
    </div>
    </form>
</body>
</html>


