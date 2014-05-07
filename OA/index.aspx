<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="OA.index" %>

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
{text: '故障统计', align: 'center', dataField: 'GZTJ', minWidth: 10, width: 78, cellsRenderer: function (row, column, value, rowData) {
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
    return value;

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
{text: '故障统计', align: 'center', dataField: 'GZTJ', minWidth: 10, width: 78, cellsRenderer: function (row, column, value, rowData) {
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="1004" border="0" align="center" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
        <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF" class="kk">
                <table width="100%" height="6" border="0" cellpadding="0" cellspacing="1" background="images/nzcms/nzcms_left_bg.gif"
                    bgcolor="#F9F9F9">
                    <tr>
                        <td width="65" height="20" align="center">
                            工单状态
                        </td>
                        <td align="center">
                            故障申报内容
                        </td>
                        <td width="100" align="center">
                            受理人
                        </td>
                        <td width="140" align="center">
                            处理结果
                        </td>
                        <td width="120" align="center">
                            时间
                        </td>
                    </tr>
                </table>
                <div id="workinfo" runat="server">
                </div>
            </td>
            <td width="250" align="center" valign="top" class="kk">
                <!-- 这里开始通知通告栏-->
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                    class="right_kq">
                    <tr>
                        <td width="30" height="27" align="center" background="images/nzcms/left.gif">
                            <img src="css/images/laba.gif" />
                        </td>
                        <td width="80" align="left" background="images/nzcms/left.gif" class="title12b">
                            通知通告
                        </td>
                        <td align="right" class="p12">
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <marquee scrollamount="2" width="240" height="100" direction="up" onmouseover="stop()"
                    onmouseout="start()">
<div id="news_wrap" runat=server></div></marquee>
                <!-- 这里结束通知通告栏-->
            </td>
        </tr>
    </table>
    <table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
        class="kk5">
        <tbody>
            <tr>
                <td colspan="2" valign="top" class="kk" style='border-bottom: none;'>
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
                                    <a href="indexXjsb.aspx" target="_blank">更多 &gt;&gt; </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" class="kk" width="40%" style='border-right: none;'>
                   <div id="grid" style='margin-top: 20px; width: 100%'>
                    </div>
                </td>
                <td valign="top" class="kk" width="40%">
                 <div id="gridnb" style='margin-top: 20px; width: 100%'>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
