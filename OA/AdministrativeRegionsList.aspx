<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrativeRegionsList.aspx.cs"
    Inherits="OA.AdministrativeRegionsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>部门信息</title>
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
{ text: '电话', align: 'center', dataField: 'Phone', minWidth: 100, width: 150 },
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 },

                   {
                       text: '操作', align: 'center', width: 150, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value) {
                           return "<a href='AdministrativeRegionsEdit.aspx?ID=" + row + "'>修改</a> <a onclick='return deleteAdministrativeRegions();'   href='#'>删除</a>&nbsp;&nbsp;<a onclick='return SetPerson(\"" + row + "\");'   href='#'>添加人员</a>";
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
                parent.art.dialog({
                    title: '系统提示',
                    content: "请先选择父节点，且只能选择一个！",
                    icon: 'succeed',
                    lock: true,
                    ok: function () {

                    }
                });


            }

        }
        currentDepartID;
        function SetPerson(roleID) {
            currentDepartID = roleID;
            if (!datatablePeroson) {
                CreateDataGrid(roleID);
            } else {
                datatablePeroson.jqxDataTable('updatebounddata');

            }
            $('#window').jqxWindow('open');
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
    <script type="text/javascript">

        function tabs(ele) {
            var id = ele.id;
            if (id == "pic") {


                var selection = $("#treeGrid").jqxTreeGrid('getSelection');



                if (  selection.length == 1) {
                    $("#basic_wrap").hide();
                    $("#pic_wrap").show();
                    $("#pic").addClass("selected");
                    $("#basic").removeClass("selected");
                    var rowData = selection[0];
                    currentDepartID = rowData.ID;
                    BindPerson();
                } else {
                    parent.art.dialog({
                        title: '系统提示',
                        content: "请选择一个部门！",
                        icon: 'succeed',
                        lock: true,
                        ok: function () {

                        }
                    });

                }
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
        var unselectdataAdapter;
        var datatablePeroson;
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
                url: 'handler/GetDepartPersonHandler.ashx'
            };

            unselectdataAdapter = new $.jqx.dataAdapter(unselectsource,
                {
                    formatData: function (data) {
                        if (unselectsource.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }



                        data.DepartID = currentDepartID;
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

            datatablePeroson = $("#datatablePeroson").jqxDataTable(
            {

                width: "100%",
                height: "400",
                source: unselectdataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                filterable: true,
                filterMode: 'simple',
                pageSize: 20,
                pagesizeoptions: ['20', '50', '100'],
                columns: [
                { text: '用户名', align: 'center', dataField: 'UserName', minWidth: 100, width: "50%" },
{ text: '姓名', align: 'center', dataField: 'RealName', minWidth: 100, width: "50%" }
                ]
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
            $('#okButton').jqxButton({ width: '65px' }).on("click",
             function () {

                 var selectPerson = datatablePeroson.jqxDataTable('getSelection');

                 if (selectPerson && selectPerson.length > 0) {
                     var selectPersonID = "";
                     for (var i = 0; i < selectPerson.length; i++) {
                         selectPersonID += selectPerson[i].ID + ",";
                     }
                     var selection = $("#treeGrid").jqxTreeGrid('getSelection');
                     var rowData = selection[0];
                     var selectAjaxData = { roleID: rowData.ID, person: selectPersonID };
                     $.ajax({
                         url: "handler/SetDepartPerson.ashx",
                         async: false,
                         data: selectAjaxData,
                         dataType: 'json',
                         type: "POST",
                         success: function (data) {
                             if (data.success == "true") {
                                 datatablePeroson.jqxDataTable('clearSelection');
                                 parent.art.dialog({
                                     title: '系统提示',
                                     content: '设置成功！',
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

                     });
                 }
             });
        })
      

       
    </script>
    <script type="text/javascript">
        var persondatatable;
        var personhassource;
        var personhasdataAdapter;
        function BindPerson() {

            if (persondatatable) {

                personhassource.hierarchy = [];
                $("#person").jqxGrid('updatebounddata');
            }
            //获取数据
            personhassource =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'DepartPersonID', type: 'string' },
{ name: 'RealName', type: 'string' } 
                ],
                hierarchy: [],
                id: 'ID',
                url: 'handler/GetDepartHasPersonHandler.ashx'
            };
            personhasdataAdapter = new $.jqx.dataAdapter(personhassource,
                {
                    formatData: function (data) {
                        if (personhassource.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        data.departid = currentDepartID;
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        if (!personhassource.totalRecords) {
                            personhassource.totalRecords = data.totalRecords;
                            data.value = data.rows;
                        }
                    },
                    loadError: function (xhr, status, error) {
                        parent.art.dialog({
                            title: '系统提示',
                            content: error,
                            icon: 'succeed',
                            lock: true,
                            ok: function () {

                            }
                        });

                    }
                }
            );

            //绑定树

            persondatatable = $("#person").jqxGrid
(
            {
                width: "90%",
                height: "490px",
                source: personhasdataAdapter,
                autoRowHeight: false,
                altRows: true,
                columnsResize: true,
                columns: [

{ text: '用户名', align: 'center', dataField: 'UserName', minWidth: 50, width: 100 },
{ text: '真实姓名', align: 'center', dataField: 'RealName', minWidth: 50, width: 100 },

                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, d, dd, value, data) {
                           return "  <a onclick='return deleteRolePersonInfo(\"" + data.DepartPersonID + "\"," + row + ");'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        }
        function deleteRolePersonInfo(DepartPersonID,rindex) {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/DepartPersonInfoDeleteHandler.ashx?ID=" + DepartPersonID;
                $.ajax(
                {
                    url: url,
                    dataType: 'json',
                    success: function (data) {

                        if (data.success == "true") {


                            
                            parent.art.dialog({
                                title: '系统提示',
                                content: '删除成功！',
                                icon: 'succeed',
                                lock: true,
                                ok: function () {
                                    BindPerson();
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
                });

            });

        }
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>部门信息</span>
    </div>
    <div style='margin-left: 10px; margin-top: 20px;'>
        <ul class="icon-list">
            <li><a class="add" href="AdministrativeRegionsEdit.aspx"><i></i><span>新增</span></a></li>
            <li><a class="add" onclick="AddChild();" href="#"><i></i><span>新增子节点</span></a></li>
            <li><a onclick="return deleteAdministrativeRegions();" id="btnDelete" class="del"
                href="#"><i></i><span>删除</span></a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <form id="form1" runat="server" style="margin-left: 10px;">
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li><a href="javascript:;" id='basic' onclick="tabs(this);" class="selected">部门信息列表</a></li>
                    <li><a href="javascript:;" id='pic' onclick="tabs(this);" class="">部门人员</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content" id='pic_wrap' style="display: none; height: 390px;">
        <div id="person">
        </div>
    </div>
    <div class="tab-content" id='basic_wrap' style="display: block; height: 390px;">
        <div id="treeGrid">
        </div>
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
