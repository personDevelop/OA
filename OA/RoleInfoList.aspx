<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleInfoList.aspx.cs" Inherits="OA.RoleInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>用户角色</title>
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <style type="text/css">
        .readonly
        {
            background-color: #FCF7F4;
        }
    </style>
    <style type="text/css">
        .icon-listNew li
        {
            float: left;
        }
        .icon-listNew li:first-child a
        {
            border-left: solid 1px #dbdbdb;
        }
        .icon-listNew li a i
        {
            display: inline-block;
            margin-right: 0px;
            width: 17px;
            height: 17px;
            text-indent: -999em;
            vertical-align: middle;
        }
        
        .icon-listNew li a.allright i
        {
            background: url(Script/styles/images/metro-icon-last.png) no-repeat;
        }
        .icon-listNew li a.right i
        {
            background: url(Script/styles/images/metro-icon-right.png) no-repeat;
        }
        .icon-listNew li a.allleft i
        {
            background: url(Script/styles/images/metro-icon-first.png) no-repeat;
        }
        .icon-listNew li a.left i
        {
            background: url(Script/styles/images/metro-icon-left.png) no-repeat;
        }
        .icon-listNew li a span
        {
            display: inline-block;
            vertical-align: middle;
        }
        .icon-listNew li a:hover
        {
            color: #2A72C5;
        }
        .icon-listNew li a
        {
            line-height: 20px;
            color: #333;
            font-size: 12px;
        }
        .icon-listNew
        {
            margin-right: 10px;
        }
        .icon-listNew li a
        {
            display: inline-block;
            padding: 5px 10px 5px 8px;
            line-height: 20px;
            height: 20px;
            border: solid 1px #e1e1e1;
            border-left: none;
            color: #333;
            font-size: 12px;
            text-decoration: none;
            background: #fafafa;
        }
        .icon-listNew li a
        {
            line-height: 20px;
            color: #333;
            font-size: 12px;
        }
    </style>
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
{ name: 'RoleClass', type: 'string' },
{ name: 'IsEnable', type: 'string' },
{ name: 'Note', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/RoleInfoListHandler.ashx'
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
                width: "65%",
                height: "440px",
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
{ text: '角色分类', align: 'center', dataField: 'RoleClass', minWidth: 100, width: 150 },
{ text: '启用', align: 'center', dataField: 'IsEnable', minWidth: 40, width: 50 },
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 },

                   {
                       text: '操作', align: 'center', width: 150, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value, data) {
                           return "<a href='RoleInfoEdit.aspx?ID=" + data.ID + "'>修改</a> <a onclick='return deleteRoleInfo();'   href='#'>删除</a><a onclick='return SetPerson(\"" + data.ID + "\");'   href='#'>设置人员</a>";
                       }
                   }
                ]
            });

        });

        var RoleID = "";
        function SetPerson(roleID) {
            RoleID = roleID;
            if (!datatablePeroson) {
                CreateDataGrid();
            } else {

                     unselectdataAdapter.dataBind();
            }
            $('#window').jqxWindow('open');
        }
        function deleteRoleInfo() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/RoleInfoDeleteHandler.ashx?";

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
                            Msg.ShowSuccess("删除成功");
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
    <script type="text/javascript">
        var unselectdataAdapter;
        var datatablePeroson;
        $(function () {



        });
        function CreateDataGrid() {


            //获取数据

            var unselectsource =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'RealName', type: 'string' },
{ name: 'RolePersonID', type: 'string' },
{ name: 'RoleID', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/GetRolePersonHandler.ashx'
            };

            unselectdataAdapter = new $.jqx.dataAdapter(unselectsource,
                {
                    formatData: function (data) {
                        if (unselectsource.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }

                        data.RoleID = RoleID;
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        if (!unselectsource.totalRecords) {
                            unselectsource.totalRecords = data.totalRecords;
                            data.value = data.rows;
                        }
                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );

            //绑定树

           datatablePeroson= $("#datatablePeroson").jqxGrid(
            {
                selectionmode: 'checkbox',
                width: "100%",
                height: "400",
                source: unselectdataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                pageSize: 20,
                pagesizeoptions: ['20', '50', '100'],
                columns: [
                { text: '用户名', align: 'center', dataField: 'UserName', minWidth: 100, width: "50%" },
{ text: '姓名', align: 'center', dataField: 'RealName', minWidth: 100, width: "50%" }
                ]
            });
            $("#datatablePeroson").on("bindingcomplete", function (event) {

                debugger;
                $('#datatablePeroson').jqxGrid('selectrow', 10);


            });
         }

        var selectID = "";
        $(function () {


            $('#window').jqxWindow({
                showCollapseButton: true, maxHeight: 600, isModal: true, okButton: $('#okButton'),
                cancelButton: $('#cancel'), maxWidth: 700, minHeight: 200, minWidth: 200, height: 500, width: 470,
                autoOpen: false
            });
            $('#cancel').jqxButton({ width: '65px' });
            $('#okButton').jqxButton({ width: '65px' }).on("click", function () {


            });
        })
      

       
    </script>
</head>
<body>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>用户角色</span>
    </div>
    <div style='margin-top: 20px; margin-left: 10px;'>
        <ul class="icon-list">
            <li><a class="add" href="RoleInfoEdit.aspx"><i></i><span>新增</span></a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <form id="form1" runat="server" style='margin-left: 10px;'>
    <div id="treeGrid">
    </div>
    </form>
    <div id="window">
        <div id="windowHeader">
            <span>
                <img src="Script/styles/images/star.png" alt="" style="margin-right: 15px" />选择人员
            </span>
        </div>
        <div style="overflow: hidden;" id="windowContent">
            <div id="datatablePeroson" style='margin-top: 20px;'>
            </div>
            <div style="float: right; margin-top: 5px;">
                <input type="button" id="okButton" value="确定" style="margin-right: 10px" />
                <input type="button" id="cancel" value="取消" />
            </div>
        </div>
    </div>
</body>
</html>
