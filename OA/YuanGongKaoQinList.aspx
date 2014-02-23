<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YuanGongKaoQinList.aspx.cs"
    Inherits="OA.YuanGongKaoQinList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>员工考勤</title>
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script src="Script/globalization/globalize.js" type="text/javascript"></script>
    <script src="Script/globalization/globalize.culture.zh-Hans.js" type="text/javascript"></script>
    <script type="text/javascript">
        var kqdata = null;
        function saveList(rowindex) {
            if (!data) {

            }
            else {
                kqdata = $('#jqxGrid').jqxGrid('getrowdata', rowindex); 
            }
        }
        $(function () {
            $('#form1').submit(function ()//提交表单 
            {
                var options = {
                    url: 'handler/RoleInfoSaveHandler.ashx', //提交给哪个执行 
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        if (data.success == "true") {
                            $("#txtID").val(data.ID);
                            Msg.ShowSuccess("保存成功");
                        }
                        else {
                            Msg.ShowError(base64decode(data.msg));
                        }
                    }
                };
                $('#form1').ajaxSubmit(options);
                return false; //为了不刷新页面,返回false
            });
        }
    )
    </script>
    <script type="text/javascript">

        $(function () {

            $("#txtKQRQ").jqxDateTimeInput({ width: '250px', height: '25px', culture: 'zh-Hans', formatString: 'd' })
            .on('valuechanged', function (event) {
                $("#treeGrid").jqxGrid('updateBoundData');
            });
            var sbzt = [
                 { value: "正常", label: "正常" },
                 { value: "迟到", label: "迟到" },
                 { value: "早退", label: "早退" },
                 { value: "请假", label: "请假" },
                 { value: "旷工", label: "旷工" },
                 { value: "其他", label: "其他"}];
            var countriesSource =
            {
                datatype: "array",
                datafields: [
                 { name: 'label', type: 'string' },
                     { name: 'value', type: 'string' }
                 ],
                localdata: sbzt
            };
            var countriesAdapter = new $.jqx.dataAdapter(countriesSource, {
                autoBind: true
            });
            //获取数据
            var source =
            {
                dataType: "json",
                dataFields: [
            { name: 'ID', type: 'string' },
{ name: 'UserID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'StartTime', type: 'string' },
{ name: 'EndTime', type: 'string' },
{ name: 'KQRQ', type: 'string' },
{ name: 'Status', type: 'string', values: { source: countriesAdapter.records, value: 'value', name: 'label'} },
{ name: 'CreaterID', type: 'string' },
{ name: 'UpdaterID', type: 'string' },
{ name: 'Updatedate', type: 'string' },
{ name: 'Note', type: 'string' },
{ name: 'CreateDate', type: 'string' },
{ name: 'RealName', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/YuanGongKaoQinListHandler.ashx'
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {
                    formatData: function (data) {

                        data.KQRQ = $("#txtKQRQ").jqxDateTimeInput('getText');
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        if (!source.totalRecords) {
                            source.totalRecords = data.totalRecords;
                            data.value = data.rows;
                        }
                    },
                    loadError: function (xhr, status, error) {
                        Msg.ShowError(error);

                    }
                }
            );

            //绑定树

            $("#treeGrid").jqxGrid
(
            {
                editable: true,
                width: "90%",
                height: "460px",
                source: dataAdapter,
                autoRowHeight: false,
                selectionmode: 'singlecell',
                altRows: true,
                columnsResize: true,
                columns: [

{ text: '员工姓名', align: 'center', dataField: 'RealName', minWidth: 100, width: 150 },
{ text: '上班时间', align: 'center', dataField: 'StartTime', minWidth: 100, width: 150 },
{ text: '下班时间', align: 'center', dataField: 'EndTime', minWidth: 100, width: 150 },
{ text: '状态', align: 'center', dataField: 'Status', columntype: 'dropdownlist', minWidth: 100, width: 150,
    createeditor: function (row, value, editor) {
        editor.jqxDropDownList({ source: countriesAdapter, displayMember: 'label', valueMember: 'value' });
    }
},
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 100, width: 150 },

                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value, data) {
                           return "<a href='#' onclick='return saveList(" + row + ")' >保存</a> ";
                       }
                   }
                ]
            });

        }); 
    </script>
</head>
<body>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>员工考勤</span>
    </div>
    <div style='margin-left: 10px; margin-top: 20px;'>
        <ul class="icon-list">
            <li><a class="add" onclick="return saveList()" href="#"><i></i><span>保存</span></a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <form id="form1" runat="server" style="margin-left: 10px;">
    <div id='txtKQRQ'>
    </div>
    <div id="treeGrid">
    </div>
    </form>
</body>
</html>
