<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeInfoList.aspx.cs"
    Inherits="OA.NoticeInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>公告信息</title>
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
{ name: 'CODE', type: 'string' },
{ name: 'TITLE', type: 'string' },
{ name: 'SOURCE', type: 'string' },
{ name: 'PUBDATE', type: 'string' },
{ name: 'CONTENT', type: 'string' },
{ name: 'PUBUSER', type: 'string' },
{ name: 'NOTE', type: 'string' },
{ name: 'ISTOP', type: 'string' },
{ name: 'ISUSED', type: 'string' },

                ],
                id: 'ID',
                url: 'handler/NoticeInfoListHandler.ashx'
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
                width: "90%",
                source: dataAdapter,
                height: "410px",
                columnsResize: true,
                pageable: true,
                serverProcessing: true,
                pageSize: 20,
                columns: [
//{ text: '编号', align: 'center', dataField: 'CODE', minWidth: 150, width: 150 },
{ text: '标题', align: 'center', dataField: 'TITLE', minWidth: 200, width: 200 },
//{ text: '来源', align: 'center', dataField: 'SOURCE', minWidth: 90, width: 90 },
{ text: '发布日期', align: 'center', dataField: 'PUBDATE', minWidth: 90, width: 90 },
{ text: '发布人', align: 'center', dataField: 'PUBUSER', minWidth: 90, width: 90 },
{ text: '是否置顶', align: 'center', dataField: 'ISTOP', minWidth: 80, width: 80 },
{ text: '是否启用', align: 'center', dataField: 'ISUSED', minWidth: 80, width: 80 },

                   {
                       text: '操作', align: 'center', width: 100, cellsAlign: 'center', align: "center", columnType: 'none', editable: false, sortable: false,
                       dataField: null, cellsRenderer: function (row, column, value,data) {
                           return "<a href='NoticeInfoEdit.aspx?ID=" + data.ID + "'>修改</a> <a onclick='return deleteNoticeInfo();'   href='#'>删除</a>";
                       }
                   }
                ]
            });

        });

        function AddChild() {
            var url = "NoticeInfoEdit.aspx";

            var selection = $("#treeGrid").jqxTreeGrid('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                url += "?ParentId=" + rowData.ID + "&ParentName=" + rowData.Name;
                location.href = url;
            } else {
                Msg.ShowError("请先选择父节点，且只能选择一个！");

            }

        }
        function deleteNoticeInfo() {
            Msg.Query("确认要删除该条数据?", function () {

                var url = "handler/NoticeInfoDeleteHandler.ashx?";

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
<body style='padding:0 30px;padding-top:20px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>公告列表</span>  
    </div>
    <div style='margin-top: 20px;'>
        <ul class="icon-list">
            <li><a class="add" href="NoticeInfoEdit.aspx"><i></i><span>新增</span></a></li>
            <li><a onclick="return deleteNoticeInfo();" id="btnDelete" class="del" href="#"><i></i><span>
                删除</span></a></li>
        </ul>
    </div>
    <div style=" clear:both;"></div>
    <form id="form1" runat="server">
    <div id="treeGrid"  style='margin-top: 20px;'>
    </div>
    </form>
</body>
</html>


