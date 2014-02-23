<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonInfoList.aspx.cs"
    Inherits="OA.PersonInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>员工信息表</title>
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
{ name: 'UserName', type: 'string' },
{ name: 'Pwd', type: 'string' },
{ name: 'Email', type: 'string' },
{ name: 'RealName', type: 'string' },
{ name: 'Location', type: 'string' },
{ name: 'DetailedAddress', type: 'string' },
{ name: 'Sex', type: 'string' },
{ name: 'Telphone', type: 'string' },
{ name: 'IDCardNumber', type: 'string' },
{ name: 'Birthday', type: 'date', format: "d" },
{ name: 'MarryStatus', type: 'string' },
{ name: 'IsSystemAdmin', type: 'string' },
{ name: 'CreateDate', type: 'date', format: "d" },
{ name: 'UpdateDATE', type: 'date', format: "d" },
{ name: 'photo', type: 'string' },
{ name: 'Note', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/PersonInfoListHandler.ashx'
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
                        Msg.ShowError(error);

                    }
                }
            );

            //绑定树

            $("#treeGrid").jqxDataTable
(
            {
                width: "90%",
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

{ text: '用户名', align: 'center', dataField: 'UserName', minWidth: 50, width: 100 },
{ text: '邮箱', align: 'center', dataField: 'Email', minWidth:50, width: 100 },
{ text: '真实姓名', align: 'center', dataField: 'RealName', minWidth: 50, width: 100 },
{ text: '所在地', align: 'center', dataField: 'Location', minWidth: 100, width: 150 },
{ text: '详细地址', align: 'center', dataField: 'DetailedAddress', minWidth: 100, width: 260 },
{ text: '性别', align: 'center', cellsAlign: 'center', dataField: 'Sex', minWidth: 50, width: 50, cellsRenderer: function (row, column, value, rowData) {
    var sex = "保密";
    switch (value) {
        case 1:
            sex = "男";
            break;
        case 0:
            sex = "女";
            break;  
    }
    return sex;
}
},
{ text: '创建日期', align: 'center', cellsAlign: 'center', dataField: 'CreateDate', minWidth: 100, width: 150, cellsFormat: 'yyyy-MM-dd' },

                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value, data) {
                           return "<a href='PersonInfoEdit.aspx?ID=" + data.ID + "'>修改</a> <a onclick='return deletePersonInfo();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

        function AddChild() {
            var url = "PersonInfoEdit.aspx";

            var selection = $("#treeGrid").jqxDataTable('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                url += "?ParentId=" + rowData.ID + "&ParentName=" + rowData.Name;
                location.href = url;
            } else {
                Msg.ShowError("请先选择父节点，且只能选择一个！");

            }

        }
        function deletePersonInfo() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/PersonInfoDeleteHandler.ashx?";

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
</head>
<body>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="dashboard.html" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>员工信息表</span>
    </div>
    <div style='margin-left:10px;margin-top: 20px;'>
        <ul class="icon-list">
            <li><a class="add" href="PersonInfoEdit.aspx"><i></i><span>新增</span></a></li>
            <li><a onclick="return deletePersonInfo();" id="btnDelete" class="del" href="#"><i></i>
                <span>删除</span></a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <form id="form1" runat="server" style=" margin-left:10px;">
    <div id="treeGrid">
    </div>
    </form>
</body>
</html>
