<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemCodeList.aspx.cs"
    Inherits="OA.SystemCodeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>系统参数</title>
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
                     { name: 'ParentId', type: 'string' },
                    { name: 'ParentName', type: 'string' },
                    { name: 'IsEnable', type: 'bool' },
                    { name: 'ResValue', type: 'string' },
                    { name: 'Node', type: 'string' }
                ],
                hierarchy:
                {
                    keyDataField: { name: 'ID' },
                    parentDataField: { name: 'ParentId' }
                },
                id: 'ID',
                url: 'handler/SystemCodeListHandler.ashx'
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            //绑定树

            $("#treeGrid").jqxTreeGrid(
            {
                width: "80%",
                source: dataAdapter,
                height:"490px",
                columnsResize: true,

                columns: [
                  { text: '编码', align: 'center', dataField: 'Code', minWidth: 100, width: 150 },
                  { text: '名称', align: 'center', dataField: 'Name', width: 150 },
                  { text: '对应值', align: 'center', dataField: 'ResValue', width: 250 },
                   { text: '可用', align: 'center', cellsAlign: 'center', dataField: 'IsEnable', width: 50, cellsRenderer: function (row, column, value) {
                       if (value) {
                           return "<input   type='checkbox' checked='checked' />";
                       }
                       else
                       { return "<input   type='checkbox'   />"; }

                   }
                   },
                  { text: '备注', align: 'center', dataField: 'Node', width: 196},
                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value) {
                           return "<a href='SystemCodeEdit.aspx?ID=" + row + "'>修改</a> <a onclick='return deleteSystem();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

        function AddChild() {
            var url = "SystemCodeEdit.aspx";

            var selection = $("#treeGrid").jqxTreeGrid('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                url += "?ParentId=" + rowData.ID + "&ParentName=" + rowData.Name;
                location.href = url;
            } else {
                Msg.ShowError("请先选择父节点，且只能选择一个！");

            }

        }
        function deleteSystem() {
            Msg.Query("确认要删除该条数据?", function () {
                var url = "handler/SystemCodeDeleteHandler.ashx?";

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
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>系统参数表</span>
    </div>
    <div style='margin-top: 20px;;margin-left:10px;'>
        <ul class="icon-list">
            <li><a class="add" href="SystemCodeEdit.aspx"><i></i><span>新增</span></a></li>
            <li><a class="add" onclick="AddChild();" href="#"><i></i><span>新增子节点</span></a></li>
            <li><a onclick="return deleteSystem();" id="btnDelete" class="del" href="#"><i></i><span>
                删除</span></a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <form id="form1" runat="server" style=" margin-left:10px;">
    <div id="treeGrid" style='margin-top:10px;'>
    </div>
    </form>
</body>
</html>
