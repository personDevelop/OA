<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="indexPaiGong.aspx.cs" Inherits="OA.indexPaiGong" %>

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
{ name: 'CreateDate', type: 'string' },
{ name: 'CreaterName', type: 'string' },
{ name: 'GuZhangXx', type: 'string' },
{ name: 'ChuLiYiJian', type: 'string' },
{ name: 'RealTime', type: 'string' },
{ name: 'CurrentUser', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/indexWorkInfoQueryHandler.ashx'
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
                            data.begindate = $("#begin_date").val();
                            data.enddate = $("#end_date").val();
                            data.username = $("#username").val();
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
{ text: '设备编号', align: 'center', dataField: 'Code', minWidth: 30, width: 70 },
{ text: '设备名称', align: 'center', dataField: 'Name', minWidth: 100 },
{ text: '上报人', align: 'center', dataField: 'CreaterName', minWidth: 30, width: 70 },
{ text: '故障信息', align: 'center', dataField: 'GuZhangXx', minWidth: 100 },
{ text: '处理信息', align: 'center', dataField: 'ChuLiYiJian', minWidth: 100, width: 150 },
 
{ text: '报工时间', align: 'center', dataField: 'CreateDate', minWidth: 80, width: 150 },
{ text: '修复时间', align: 'center', dataField: 'RealTime', minWidth: 50, width: 150 },
{ text: '受理人员', align: 'center', dataField: 'CurrentUser', minWidth: 20, width:70 }
                ]
            });

     });

        function search1() {
            $("#grid").jqxDataTable('updateBoundData');
        }
   
    </script>
    <style type="text/css">
    input
    {
         width:100px;
        
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
                                    派工统计
                                </td>
                                <td align="right">
                                    &nbsp;&nbsp;
                                </td>
                                <td width="60">
                                    <a href="login.aspx">登陆&gt;&gt;</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" class="kk">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
                        <tbody>
                            <tr>
                                <td height="25" width="30" align="center" bgcolor="#F8F8F8" class="zx">
                                    开始<!--选择时间起点，检索框-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input class="mid"  width="60" id='begin_date' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                        type='text' /><!--选择时间起点，检索框-->
                                </td>
                                <td align="center" width="30" bgcolor="#F8F8F8" class="zx">
                                    结束
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input class="mid"  id='end_date' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                        type='text' /><!--选择时间起点，检索框-->
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    受理人员<!--选择人员-下拉框-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid"   id='username' /><!--选择时间起点，检索框-->
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    <a title="工作日志或无日志">设备编号</a><!--考勤为正常上班的title可查阅日志，没有的显示无-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid"   id='sbcode' />
                                </td>
                                <td align="center" width="60" bgcolor="#F8F8F8" class="zx">
                                    <a title="工作日志或无日志">设备名称</a><!--考勤为正常上班的title可查阅日志，没有的显示无-->
                                </td>
                                <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type='text' class="mid"   id='sbname' /><!--选择时间起点，检索框-->
                                </td>
                                <td align="center" bgcolor="#F8F8F8" class="zx">
                                    <input type="button" onclick="search1()" value='查询' />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="grid" style='margin-top: 20px;  width:100%'>
    </div>
                   <%-- <div id='kaoqin_wrap' runat="server">
                    </div>--%>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
