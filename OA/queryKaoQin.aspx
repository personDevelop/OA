<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="queryKaoQin.aspx.cs" Inherits="OA.queryKaoQin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>考勤统计</title>
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
{ name: 'UserName', type: 'string' },
{ name: 'KQRQ', type: 'date', format: "d" },
{ name: 'Status', type: 'string' },
{ name: 'EndTime', type: 'string' },
{ name: 'Note', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/YuanGongKaoQinQueryHandler.ashx'
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
                            data.KQRQ = $("#txtTime1").val()+"@"+$("#txtTime2").val();;
                            data.USER = $("#username").val();
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
                pageSize: 20,

                columns: [
{ text: '员工姓名', align: 'center', dataField: 'UserName', minWidth: 100, width: 150 },
{ text: '考勤时间', align: 'center', dataField: 'KQRQ', minWidth: 100, width: 200, cellsFormat: 'yyyy-MM-dd' },
{ text: '上午状态', align: 'center', dataField: 'Status', minWidth: 100, width: 200 },
{ text: '下午状态', align: 'center', dataField: 'EndTime', minWidth: 90, width: 90 },
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 }
                ]
            });
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
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>考勤统计</span>  
    </div>
    <div style='margin-top: 20px;'>
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
                <td style='width:50px;'>员工姓名</td>
                <td style='width:160px;'><input type=text id='username' class="input"/></td>
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



