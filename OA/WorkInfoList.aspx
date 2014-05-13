<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkInfoList.aspx.cs" Inherits="OA.WorkInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>派工管理</title>
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script src="Script/globalization/globalize.js" type="text/javascript"></script>
    <script src="Script/globalization/globalize.culture.zh-Hans.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {


            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
                  { name: 'Name', type: 'string' },
                    { name: 'Code', type: 'string' },
                      { name: 'GuiGe', type: 'string' }, 
                { name: 'SbID', type: 'string' },
            { name: 'GuZhangXx', type: 'string' },
             { name: 'Guzhang', type: 'string' },
                { name: 'ChuLiYiJian', type: 'string' },
                { name: 'PlanTime', type: 'date' },
                { name: 'Status', type: 'string' },
                { name: 'CurrentUser', type: 'string' },
                { name: 'RealTime', type: 'date' },
                { name: 'Note', type: 'string' },
                { name: 'City', type: 'string' },
                { name: 'Xian', type: 'string' },
                { name: 'Zhen', type: 'string' },
                { name: 'Address', type: 'string' },
                { name: 'Tel', type: 'string' },
                { name: 'CreaterID', type: 'string' },
                { name: 'CreaterName', type: 'string' },
                { name: 'CreateDate', type: 'date' }
                ],
                id: 'ID',
                url: 'handler/WorkInfoListHandler.ashx'
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {
                    formatData: function (data) {
                        if (source.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        data.IsDaiBan=$("#hidIsDaiBan").val();
                        //                        data.Workstatus = "制单";
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        //                        if (!source.totalRecords) {
                        source.totalRecords = data.totalRecords;
                        data.value = data.rows;
                        //                        }
                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );
            var handlogsource1 = {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
                { name: 'WorkID', type: 'string' },
                { name: 'CurrentStaus', type: 'string' },
                { name: 'ChuliYj', type: 'string' },
                { name: 'UpName', type: 'string' },
                { name: 'DownName', type: 'string' },
                { name: 'HandDate', type: 'date' },
                { name: 'HandResult', type: 'string' },
                { name: 'HandSequence', type: 'string'}],
                id: 'ID', async: false,
                url: 'handler/WorkHandLogListHandler.ashx'
            };
            var handlogDataAdapter = new $.jqx.dataAdapter(handlogsource1, {
                formatData: function (data) {
                    if (source.totalRecords) {

                        data.$skip = data.pagenum * data.pagesize;
                        data.$top = data.pagesize;
                    }
                    //                        data.Workstatus = "制单";
                    return data;
                },
                downloadComplete: function (data, status, xhr) {
                    //                        if (!source.totalRecords) {
                    source.totalRecords = data.totalRecords;
                    data.value = data.rows;
                    //                        }
                },
                loadError: function (xhr, status, error) {
                    throw new Error("http://services.odata.org: " + error.toString());
                }
            });
            
            var nestedTables = new Array();
            var initRowDetails = function (id, row, element, rowinfo) {
                element.append($("<div style='margin: 10px;'></div>"));
                var nestedDataTable = $(element.children()[0]);
                
                
                if (nestedDataTable != null) {
                    handlogDataAdapter = new $.jqx.dataAdapter(handlogsource1, {
                        formatData: function (data) {
                            if (source.totalRecords) {

                                data.$skip = data.pagenum * data.pagesize;
                                data.$top = data.pagesize;
                            }
                            data.WorkID=  id;//                     data.Workstatus = "制单";
                            return data;
                        },
                      
                    });
                    nestedDataTable.jqxDataTable({

                        source: handlogDataAdapter,
                        width: "80%",
                        height:"180px",
                        autoRowHeight: true,
                        columns: [
{ text: '当前状态', align: 'center', dataField: 'CurrentStaus', minWidth: 80, width:  80 },
{ text: '处理信息', align: 'center', dataField: 'ChuliYj', minWidth: 100, width: 420 },
{ text: '处理人', align: 'center', dataField: 'DownName', minWidth: 80, width: 80 }, 
{ text: '处理时间', align: 'center', dataField: 'HandDate', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd'},
{ text: '处理结果', align: 'center', dataField: 'HandResult', minWidth: 80, width: 80 }
                       ]
                    });
                    // store the nested Data Tables and use the Employee ID as a key.
                    nestedTables[id] = nestedDataTable;
                }
            }
            //绑定树 
            $("#treeGrid").jqxDataTable(
            {
                width: "98%",
                height: "490px",
                source: dataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,
                pageable: true,
                columnsResize: true,
                rowDetails: true,
                initRowDetails: initRowDetails,
                pageSize: 20, 
                pagesizeoptions: ['20', '50', '100'],
                columns: [
                {
                    text: '操作', pinned: true, align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                    dataField: null, cellsRenderer: function (rowindex, column, value,row) {
                              if (row.Status=="制单") {
           return "<a  onclick='return FPrenWu();'   href='#'>分派</a>    ";
    }
    else if (row.Status=="完成") {
    return "   ";
    }
    else
    {
    return "  <a href='WorkHandLogEdit.aspx?ID=" + row.ID+ "'>办理</a>  ";
    }
                    }
                },
                    { text: '设备', align: 'center', dataField: 'Name', minWidth: 100, width: 100 },
                    { text: '故障信息', align: 'center', dataField: 'GuZhangXx', minWidth: 100, width: 150 },
                    { text: '故障类别', align: 'center', dataField: 'Guzhang', minWidth: 10,width: 150 },
                    { text: '处理意见', align: 'center', dataField: 'ChuLiYiJian', minWidth: 100, width: 150 },
                    { text: '计划解决时间', align: 'center', cellsAlign: 'center', dataField: 'PlanTime', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd' },
                    { text: '状态', align: 'center', dataField: 'Status', minWidth: 10, width: 50 },
                    { text: '当前指派人', align: 'center', dataField: 'CurrentUser', minWidth: 30, width: 80 },
              { text: '实际完成时间', align: 'center', cellsAlign: 'center', dataField: 'RealTime', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd' },

//                    { text: '市', align: 'center', dataField: 'City', minWidth: 10, width: 50 },
//                    { text: '县、区', align: 'center', dataField: 'Xian', minWidth: 10, width: 50 },
//                    { text: '镇', align: 'center', dataField: 'Zhen', minWidth: 10, width: 50 },
                    { text: '详细地址', align: 'center', dataField: 'Address', minWidth: 100, width: 150 },
                    { text: '填报人联系电话', align: 'center', dataField: 'Tel', minWidth: 50, width: 100 },
                    { text: '填报人', align: 'center', dataField: 'CreaterName', minWidth: 50, width: 50 },
                    { text: '填报时间', align: 'center', dataField: 'CreateDate', cellsAlign: 'center', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd' }

                ]
            });

        });
       var guzlb={
            "0":"供电故障",
            "1":"光纤故障",
            "2":"设备故障",
            "3":"其他故障"
       };
        function FPrenWu() { 
            var selection = $("#treeGrid").jqxDataTable('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                if (rowData.Status=="完成") {
                  parent.art.dialog({
                                title: '系统提示',
                                content: "任务已完成，不能再分配！",
                                icon: 'succeed',
                                lock: true,
                                ok: function () {
                                return;
                                }
                            });
      
     return;
}
                $("#unselectperson").jqxDataTable('updateBoundData');
                $("#selectPerson").jqxDataTable('updateBoundData');
                $('#window').jqxWindow('open');
            } else {
              parent.art.dialog({
                                title: '系统提示',
                                content: "请先选择要分配的设备故障，且只能选择一个！",
                                icon: 'succeed',
                                lock: true,
                                ok: function () {

                                }
                            });
               

            }

        }
        function deleteWorkInfo() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/WorkInfoDeleteHandler.ashx?";

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
                            var rows = $("#treeGrid").jqxDataTable('getRows');
                            var rowIndex = -1;
                            for (var i = 0; i < rows.length; i++) {
                                if (rows[i].ID == rowData.ID) {
                                    rowIndex = i;
                                    break;
                                }

                            }
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
    <script type="text/javascript">

        $(function () {
            $('#mainSplitter').jqxSplitter({ width: 550, splitBarSize: 1, height: 420, panels: [{ size: 200 }, { size: 350}] });
            $('#spliter').jqxSplitter({ width: 350, splitBarSize: 1, height: 420, panels: [{ size: 50 }, { size: 300}] });
            $('#ok').jqxButton({ width: '65px' }).on("click", function () {

                var selection = $("#selectPerson").jqxDataTable('getRows');

                if (selection.length > 0) {
                    var zprenarray = [];
                    for (var i = 0; i < selection.length; i++) {
                        zprenarray.push(selection[i].ID);
                    }

                    var rewuid = $("#treeGrid").jqxDataTable('getSelection')[0].ID;
                    var selection = $("#selectPerson").jqxDataTable('getRows');
                    var fpdata = { rwid: rewuid, zpren: zprenarray };
                    $.ajax({
                        url: "handler/FenPaiHandler.ashx",
                        type: "POST",
                        dataType: "json",
                        data: fpdata,
                        success: function (data) {
                            if (data.success == "true") {
                                //修改状态，后重新加载处理
                                $("#treeGrid").jqxDataTable('updateBoundData');
                                parent.art.dialog({
                                    title: '系统提示',
                                    content: '分配成功！',
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

                    //                    $(to).jqxDataTable('addRow', rowData.ID, rowData);
                    //                    var rows = $(from).jqxDataTable('getRows');
                    //                    var rowIndex = -1;
                    //                    for (var i = 0; i < rows.length; i++) {
                    //                        if (rows[i].ID == rowData.ID) {
                    //                            rowIndex = i;
                    //                            break;
                    //                        }
                    //                    }
                    //                    $(from).jqxDataTable('deleteRow', rowIndex);
                    $('#window').jqxWindow('close');

                } else {

                    parent.art.dialog({
                        title: '系统提示',
                        content: "请给当前工作指派人员",
                        icon: 'succeed',
                        lock: true,
                        ok: function () {

                        }
                    });

                }


            });
            $('#cancel').jqxButton({ width: '65px' });
            //获取数据
            var unselectsource =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'RealName', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/PersonInfoListHandler.ashx'
            };

            var Selectesource =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'RealName', type: 'string' }
                ],
                id: 'ID'
            };
            var SelectdataAdapter = new $.jqx.dataAdapter(Selectesource);
            var unselectdataAdapter = new $.jqx.dataAdapter(unselectsource,
                {
                    formatData: function (data) {
                        if (unselectsource.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        //                        if (!unselectsource.totalRecords) {
                        unselectsource.totalRecords = data.totalRecords;
                        data.value = data.rows;
                        //                        }
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
            $("#unselectperson").jqxDataTable
                (
            {
                width: "100%",
                height: "100%",
                source: unselectdataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,
                pageable: true,
                filterable: true,
                filterMode: 'simple',
                columnsResize: true,
                pageSize: 20,
                pagesizeoptions: ['20', '50', '100'],
                columns: [
{ text: '待选人员', align: 'center', dataField: 'RealName', minWidth: 100, width: "100%" },
                ]
            });
            $("#selectPerson").jqxDataTable
                (
            {
                width: "200px",
                height: "100%",
                source: SelectdataAdapter,
                autoRowHeight: false,
                altRows: true,
                columns: [
{ text: '已指派人员', align: 'center', dataField: 'RealName', minWidth: 100, width: "100%" },
                ]
            });

            $('#window').jqxWindow({
                showCollapseButton: true, maxHeight: 600, isModal: true, okButton: $('#okButton'),
                cancelButton: $('#cancel'), maxWidth: 700, minHeight: 200, minWidth: 200, height: 500, width: 470,
                autoOpen: false, initContent: function () {

                    //                    SelectdataAdapter.dataBind();
                    //                    unselectdataAdapter.dataBind();
                }
            });
        });

        function select(selcttype) {

            var from = "", to = "";
            switch (selcttype) {
                case 'allright':
                    from = "";
                    to = "";
                    break;
                case "right":
                    from = "#unselectperson";
                    to = "#selectPerson";


                    break;
                case "left":
                    from = "#selectPerson";
                    to = "#unselectperson";
                    break;
                case "allleft":
                    from = "";
                    to = "";
                    break;
            }
            var selection = $(from).jqxDataTable('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                $(to).jqxDataTable('addRow', rowData.ID, rowData);
                var rows = $(from).jqxDataTable('getRows');
                var rowIndex = -1;
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].ID == rowData.ID) {
                        rowIndex = i;
                        break;
                    }
                }
                $(from).jqxDataTable('deleteRow', rowIndex);

            } else {
                parent.art.dialog({
                    title: '系统提示',
                    content: "请先选择要移动的人员，且只能选择一个！",
                    icon: 'succeed',
                    lock: true,
                    ok: function () {

                    }
                });


            }
        }
    </script>
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
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>派工管理</span>
    </div>
    <div style='margin-top: 20px; margin-left: 10px;'>
        <ul class="icon-list">
            <li><a class="add" onclick='return FPrenWu();' href='#'><i></i><span>分派任务</span></a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <form id="form1" runat="server" style="margin-left: 10px;">
    <input type="hidden" id="hidIsDaiBan" name="hidIsDaiBan" runat="server" />
    <div id="treeGrid" style='margin-top: 10px;'>
    </div>
    </form>
    <div id="window">
        <div id="windowHeader">
            <span>
                <img src="Script/styles/images/star.png" alt="" style="margin-right: 15px" />人员选择
            </span>
        </div>
        <div style="overflow: hidden;" id="windowContent">
            <div id="mainSplitter">
                <div class="splitter-panel">
                    <div id="unselectperson">
                    </div>
                </div>
                <div class="splitter-panel">
                    <div id="spliter">
                        <div class="splitter-panel">
                            <div style='margin: 200px 10px;'>
                                <ul class="icon-listNew">
                                    <%--<li><a class="allright" onclick="return select('allright');" href="#"><i></i></a>
                            </li>--%>
                                    <li><a class="right" onclick="return select('right');" href="#"><i></i></a></li>
                                    <li><a class="left" onclick="return select('left');" href="#"><i></i></a></li>
                                    <%--<li><a class="allleft" onclick="return select('allleft');" href="#"><i></i></a></li>--%>
                                </ul>
                            </div>
                        </div>
                        <div class="splitter-panel">
                            <div id="selectPerson">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float: right; margin-top: 5px;">
                <input type="button" id="ok" value="确定" style="margin-right: 10px" />
                <input type="button" id="cancel" value="取消" />
            </div>
        </div>
    </div>
</body>
</html>
