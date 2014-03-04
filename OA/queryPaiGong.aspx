<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="queryPaiGong.aspx.cs" Inherits="OA.queryPaiGong" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>派工统计</title>
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">

   
    </script>
    <script>
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
                url: 'handler/WorkInfoQueryHandler.ashx'
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
                            //
                            //data.USER = $("#username").val();
                        }
                        data.RQ = $("#txtTime1").val() + "@" + $("#txtTime2").val();
                        data.USERNAME = $("#USERNAME").val();
                        data.SBNAME = $("#SBNAME").val();
                        data.SBZT = $("#SBZT").val(); 
                        data.GZXX = $("#GZXX").val(); 
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
                height: "400px",
                source: dataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                altRows: true,
                rowDetails: true,
                initRowDetails: initRowDetails,
                pageSize: 20,

                columns: [
                    { text: '设备', align: 'center', dataField: 'Name', minWidth: 100, width: 100 },
                                        { text: '填报人', align: 'center', dataField: 'CreaterName', minWidth: 50, width: 50 },
                    { text: '填报时间', align: 'center', dataField: 'CreateDate', cellsAlign: 'center', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd' },
                    { text: '故障信息', align: 'center', dataField: 'GuZhangXx', minWidth: 100, width: 150 },
                    { text: '处理意见', align: 'center', dataField: 'ChuLiYiJian', minWidth: 100, width: 150 },
                    { text: '计划解决时间', align: 'center', cellsAlign: 'center', dataField: 'PlanTime', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd' },
                    { text: '状态', align: 'center', dataField: 'Status', minWidth: 10, width: 50 },
                    { text: '当前指派人', align: 'center', dataField: 'CurrentUser', minWidth: 30, width: 80 },
                    { text: '实际完成时间', align: 'center', cellsAlign: 'center', dataField: 'RealTime', minWidth: 100, width: 100, cellsFormat: 'yyyy-MM-dd' },

//                                    { text: '市', align: 'center', dataField: 'City', minWidth: 10, width: 50 },
//                                    { text: '县、区', align: 'center', dataField: 'Xian', minWidth: 10, width: 50 },
//                                    { text: '镇', align: 'center', dataField: 'Zhen', minWidth: 10, width: 50 },
//                    {text: '详细地址', align: 'center', dataField: 'Address', minWidth: 100, width: 150 },
                    { text: '填报人联系电话', align: 'center', dataField: 'Tel', minWidth: 50, width: 100 }

                ]
            });
        });
        var initRowDetails = function (id, row, element, rowinfo) {
             element.append($("<div style='margin: 10px;'></div>"));
                var nestedDataTable = $(element.children()[0]);
                
        
                if (nestedDataTable != null) {
                    handlogDataAdapter = new $.jqx.dataAdapter(handlogsource1, {
                        formatData: function (data) {
                            if (handlogsource1.totalRecords) {

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
        function search1() {
            $("#treeGrid").jqxDataTable('updateBoundData');
        }
    </script>
</head>
 <style>
     .input-date .date {
width: 170px;
}
.input-date {
position: relative;
display: inline-block;
width: 180px;
height: auto;
vertical-align:none;
}
body{font-size:12px;}
    .input-date i{position: absolute;
top:11px;
right: 8px;
width: 14px;
height: 14px;
text-indent: -99em;
background: url(css/images/skin_icons.png) no-repeat -196px -112px;
overflow: hidden;}
    </style>
<body style='padding:0 30px;padding-top:20px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>派工统计</span>  
    </div>
    <div style='margin-top: 11px;'>
         <div style=" clear:both;">
        <table style="width:100%;">
            <tr>
                <td style='width:50px;'>开始日期</td>
                <td style='width:190px;'>
                    <div class="input-date">
                        <input name="txtAddTime" type="text" id="txtTime1" class="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" ">
                        <i></i>
                    </div>
                </td>
                <td style='width:50px;'>结束日期</td>
                <td style='width:190px;'>
                    <div class="input-date">
                        <input name="txtAddTime" type="text" id="txtTime2" class="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" ">
                        <i></i>
                    </div>
                </td>
                <td style='width:50px;'>填报人</td>
                <td style='width:160px;'><input type=text id='USERNAME' style='width: 170px;' class="input"/></td>
                <td>
                   
                </td>
            </tr>
            <tr>
                <td style='width:50px;'>设备名称</td>
                <td style='width:190px;'>
                    <input type=text id='SBNAME' style='width: 170px;' class="input"/>
                </td>
                <td style='width:50px;'>设备状态</td>
                <td style='width:190px;'>
                    <input type=text id='SBZT'  style='width: 170px;' class="input"/>
                </td>
                <td style='width:50px;'>故障信息</td>
                <td style='width:160px;'><input type=text id='GZXX' style='width: 170px;' class="input"/></td>
                <td>
                    <ul class="icon-list">
                        <li><a class="search" onclick="search1();" href="#"><i></i><span>查询</span></a></li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    </div>
    <form id="form1" runat="server">
    
    <div id="treeGrid" style='margin-top: 20px;'>
    </div>
    </form>
</body>
</html>



