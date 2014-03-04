<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrativeRegionsList.aspx.cs"
    Inherits="OA.AdministrativeRegionsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>行政区域</title>
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
{ text: '邮政编码', align: 'center', dataField: 'ZipCode', minWidth: 100, width: 150 },
{ text: '所属电话号码段', align: 'center', dataField: 'Phone', minWidth: 100, width: 150 }, 
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 }, 

                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value) {
                           return "<a href='AdministrativeRegionsEdit.aspx?ID=" + row + "'>修改</a> <a onclick='return deleteAdministrativeRegions();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

        function AddChild() {
            var url = "AdministrativeRegionsEdit.aspx";

            var selection = $("#treeGrid").jqxTreeGrid('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                url += "?ParentID=" + rowData.ID + "&ParentName=" + rowData.Name;
                location.href = url;
            } else {
                Msg.ShowError("请先选择父节点，且只能选择一个！");

            }

        }
        function deleteAdministrativeRegions() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/AdministrativeRegionsDeleteHandler.ashx?";

                var selection = $("#treeGrid").jqxTreeGrid('getSelection');
                if (selection.length == 1) {
                    var rowData = selection[0];
                    url += "ID=" + rowData.ID;
                    $.ajax(
                {
                    url: url,
                    dataType: 'json',
                    success: function (data) {
                        if (data.success == "true") {
                            $("#treeGrid").jqxTreeGrid('deleteRow', rowData.ID);
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
<body  style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>行政区域</span>  
    </div>
    <div style=' margin-left:10px;margin-top: 20px;'>
        <ul class="icon-list">
            <li><a class="add" href="AdministrativeRegionsEdit.aspx"><i></i><span>新增</span></a></li>
            <li><a class="add" onclick="AddChild();" href="#"><i></i><span>新增子节点</span></a></li>
            <li><a onclick="return deleteAdministrativeRegions();" id="btnDelete" class="del" href="#"><i></i><span>
                删除</span></a></li>
        </ul>
    </div>
    <div style=" clear:both;"></div>
    <form id="form1" runat="server"  style=" margin-left:10px;">
    <div id="treeGrid" style='margin-top: 10px;'>
    </div>
    </form>
</body>
</html>

