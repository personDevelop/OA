<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="indexXjsb.aspx.cs" Inherits="OA.indexXjsb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
{ name: 'State', type: 'string' }, 
{ name: 'PATH', type: 'string' },
{ name: 'GHTJ', type: 'string' },
{ name: 'GZTJ', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/IndexShebeiInfoListHandler.ashx?nb=0'
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
                            data.sbzt = $("#sbzt").val();
                            data.sbcode = $("#sbcode").val();
                            data.sbname = $("#sbname").val();
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {

                        source.totalRecords = data.totalRecords;
                        source.value = data.rows;


                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );
            //绑定树

            $("#grid").jqxDataTable(
            {
                width: "100%",
                //                height: "410px",
                source: dataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                pageSize: 50,

                columns: [
                { text: '状态', align: 'center', dataField: 'State', minWidth: 10, width: 70, cellsRenderer: function (row, column, value, rowData) {
                    var s = "&nbsp;<font class='book_kk'>" + value + "</font>";
                    return s;
                }
                },
{ text: '设备编号', align: 'center', dataField: 'Code', minWidth: 10, width: 70, cellsRenderer: function (row, column, value, rowData) {

    var s = "<a href='javascript:void(0);' style='color:blue;' onclick='openurl(\"" + rowData.ID + "\");'>" + value + "</a>"
    return s;
//    if (!rowData.PATH) {
//        return value;
//    } else {
//        var s = "<a href='" + rowData.PATH + "' target='sbiframe'>" + value + "</a>"

//        return s;
//    }
}
},
{ text: '设备名称', align: 'center', dataField: 'Name', minWidth: 10, cellsRenderer: function (row, column, value, rowData) {
    return value;
    if (!rowData.PATH) {
        return value;
    } else {
        var s = "<a href='" + rowData.PATH + "' target='sbiframe'>" + value + "</a>"

        return s;
    }
}
},
//{ text: '缩略图', align: 'center', dataField: 'FilePath', minWidth: 10 },
{ text: '故障统计', align: 'center', dataField: 'GZTJ', minWidth: 10, width: 78, cellsRenderer: function (row, column, value, rowData) {
    var s = "共<span class='title12b'>" + value + "</span>次故障";

    return s;
}
},
{ text: '更换统计', align: 'center', dataField: 'GHTJ', minWidth: 10, width: 78, cellsRenderer: function (row, column, value, rowData) {
    var s = "共<span class='title12b'>" + value + "</span>次更换";

    return s;
}
}
                ]
            });

        });

        function search1() {
            $("#grid").jqxDataTable('updateBoundData');
        }
   
    </script>
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
{ name: 'State', type: 'string' },
 
{ name: 'PATH', type: 'string' },
{ name: 'GHTJ', type: 'string' },
{ name: 'GZTJ', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/IndexShebeiInfoListHandler.ashx?nb=1'
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
                            data.sbzt = $("#sbzt").val();
                            data.sbcode = $("#sbcode").val();
                            data.sbname = $("#sbname").val();
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {

                        source.totalRecords = data.totalRecords;
                        source.value = data.rows;


                    },
                    loadError: function (xhr, status, error) {
                        throw new Error("http://services.odata.org: " + error.toString());
                    }
                }
            );
            //绑定树

            $("#gridnb").jqxDataTable(
            {
                width: "100%",
                //                height: "410px",
                source: dataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                pageSize: 50,

                columns: [
                { text: '状态', align: 'center', dataField: 'State', minWidth: 10, width: 70, cellsRenderer: function (row, column, value, rowData) {
                    var s = "&nbsp;<font class='book_kk'>" + value + "</font>";
                    return s;
                }
                },
{ text: '设备编号', align: 'center', dataField: 'Code', minWidth: 10, width: 70, cellsRenderer: function (row, column, value, rowData) {
    var s = "<a href='javascript:void(0);' style='color:blue;' onclick='openurl(\"" + rowData.ID + "\");'>" + value + "</a>"
    return s;

    if (!rowData.PATH) {
        return value;
    } else {
        var s = "<a href='" + rowData.PATH + "' target='sbiframe'>" + value + "</a>"

        return s;
    }
}
},
{ text: '设备名称', align: 'center', dataField: 'Name', minWidth: 10, cellsRenderer: function (row, column, value, rowData) {
    return value;
    if (!rowData.PATH) {
        return value;
    } else {
        var s = "<a href='" + rowData.PATH + "' target='sbiframe'>" + value + "</a>"

        return s;
    }
}
},
//{ text: '缩略图', align: 'center', dataField: 'FilePath', minWidth: 10 },
{ text: '故障统计', align: 'center', dataField: 'GZTJ', minWidth: 10, width: 78, cellsRenderer: function (row, column, value, rowData) {
    var s = "共<span class='title12b'>" + value + "</span>次故障";

    return s;
}
},
{ text: '更换统计', align: 'center', dataField: 'GHTJ', minWidth: 10, width: 78, cellsRenderer: function (row, column, value, rowData) {
    var s = "共<span class='title12b'>" + value + "</span>次更换";

    return s;
}
}
                ]
            });

        });

        function searchnb() {
            $("#gridnb").jqxDataTable('updateBoundData');
        }
   
    </script>
    <style type="text/css">
        input
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
        class="kk5">
        <tbody>
            <tr>
                <td colspan="2" valign="top" class="kk">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/news_bg.gif">
                        <tbody>
                            <tr>
                                <td width="120" height="29" align="center" class="white14B">
                                    巡检设备
                                </td>
                                <td align="right">
                                    &nbsp;&nbsp;
                                </td>
                                <td width="60">
                                    <a href="login.aspx" target="_blank">登陆 &gt;&gt; </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" class="kk" width="40%">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
                        <tbody>
                            <tr>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    <a title="工作日志或无日志">设备编号</a><!--考勤为正常上班的title可查阅日志，没有的显示无-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid" id='sbcode' />
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    <a title="工作日志或无日志">设备名称</a><!--考勤为正常上班的title可查阅日志，没有的显示无-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid" id='sbname' /><!--选择时间起点，检索框-->
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    设备状态<!--选择人员-下拉框-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <select class="mid" id='sbzt'>
                                        <option value="">全部</option>
                                        <option value="正常">正常</option>
                                        <option value="故障报修">故障报修</option>
                                        <option value="处理中">处理中</option>
                                    </select>
                                </td>
                                <td align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type="button" onclick="search1()" value='查询' />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="grid" style='margin-top: 20px; width: 100%'>
                    </div>
                </td>
                <td valign="top" class="kk" width="40%">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
                        <tbody>
                            <tr>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    <a title="工作日志或无日志">设备编号</a><!--考勤为正常上班的title可查阅日志，没有的显示无-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid" id='sbcodenb' />
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    <a title="工作日志或无日志">设备名称</a><!--考勤为正常上班的title可查阅日志，没有的显示无-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid" id='sbnamenb' /><!--选择时间起点，检索框-->
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    设备状态<!--选择人员-下拉框-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <select class="mid" id='sbztnb'>
                                        <option value="">全部</option>
                                        <option value="正常">正常</option>
                                        <option value="故障报修">故障报修</option>
                                        <option value="处理中">处理中</option>
                                    </select>
                                </td>
                                <td align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type="button" onclick="searchnb()" value='查询' />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="gridnb" style='margin-top: 20px; width: 100%'>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
