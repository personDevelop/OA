<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="indexKaoQin.aspx.cs" Inherits="OA.indexKaoQin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">

     $(function () {


         //获取数据
         var source =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'KQRQ', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'SWStatus', type: 'string' },
{ name: 'Status', type: 'string' },
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
                            data.begindate = $("#begin_date").val();
                            data.enddate = $("#end_date").val();
                            data.USER = $("#username").val();
                            data.swstatus = $("#swstatus").val();
                            data.status = $("#status").val();
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {

                        source.totalRecords = data.total;
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
{ text: '日期', align: 'center', dataField: 'KQRQ', minWidth: 100, width: 150 },
{ text: '人员', align: 'center', dataField: 'UserName', minWidth: 100, width: 150 },
{ text: '上午考勤', align: 'center', dataField: 'SWStatus', minWidth: 80, width: 150 },
{ text: '下午考勤', align: 'center', dataField: 'Status', minWidth: 50, width: 150 },
{ text: '备注', align: 'center', dataField: 'Note', minWidth: 20  }
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
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="kk5">
  <tbody><tr>
    <td colspan="2" valign="top" class="kk"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/news_bg.gif">
      <tbody><tr>
        <td width="120" height="29" align="center" class="white14B">考勤统计</td>
        <td align="right">&nbsp;&nbsp;</td>
        <td width="60"><a href="login.aspx">登陆&gt;&gt;</a></td>
      </tr>
    </tbody></table>   </td>
  </tr>
  <tr>
	<td valign="top" class="kk">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
          <tbody><tr>
            <td height="25" width=30 align="center" bgcolor="#F8F8F8" class="zx">开始<!--选择时间起点，检索框--></td>
            <td height="25" align="center" bgcolor="#F8F8F8" class="zx"><input class="mid"   id='begin_date'  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" type='text'/><!--选择时间起点，检索框--></td>
            <td align="center" width=30 bgcolor="#F8F8F8" class="zx">结束</td>
            <td height="25" align="center" bgcolor="#F8F8F8" class="zx"><input  class="mid"    id='end_date'   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" type='text'/><!--选择时间起点，检索框--></td>
            <td align="center" width=30 bgcolor="#F8F8F8" class="zx">人员<!--选择人员-下拉框--></td>
            <td height="25" align="center" bgcolor="#F8F8F8" class="zx"><input type='text' class="mid"    id='username' /><!--选择时间起点，检索框--></td>
            <td align="center" width=50 bgcolor="#F8F8F8" class="zx"><a title="工作日志或无日志">上午考勤</a><!--考勤为正常上班的title可查阅日志，没有的显示无--></td>
            <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                <select  class="mid"  id='swstatus' >
                    <option value="">全部</option>
                    <option value="正常">正常</option>
                    <option value="迟到">迟到</option>
                    <option value="早退">早退</option>
                    <option value="请假">请假</option>
                    <option value="旷工">旷工</option>
                    <option value="其他">其他</option>
                </select><!--选择时间起点，检索框--></td>
            <td align="center" width=50 bgcolor="#F8F8F8" class="zx"><a title="工作日志或无日志">下午考勤</a><!--考勤为正常上班的title可查阅日志，没有的显示无--></td>
            <td height="25" align="center" bgcolor="#F8F8F8" class="zx">
                <select  class="mid"   id='status'>
                    <option value="">全部</option>
                    <option value="正常">正常</option>
                    <option value="迟到">迟到</option>
                    <option value="早退">早退</option>
                    <option value="请假">请假</option>
                    <option value="旷工">旷工</option>
                    <option value="其他">其他</option>
                </select><!--选择时间起点，检索框--></td>
            <td align="center" bgcolor="#F8F8F8" class="zx"><input  type="button" onclick="search1();" value='查询'/></td>
          </tr>
      </tbody></table> 
	   <div id="grid" style='margin-top: 20px;  width:100%'>
    </div>
    <%--  <div id='kaoqin_wrap' runat=server></div>
	     </td>--%>
	
  </tr>
</tbody></table>
</asp:Content>
