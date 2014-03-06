<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectSheBeiInfo.aspx.cs" Inherits="OA.selectSheBeiInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="base.css" rel="stylesheet">
    <title>选择设备</title>
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
{ name: 'Code', type: 'string' },
{ name: 'Name', type: 'string' },
{ name: 'GuiGe', type: 'string' },
{ name: 'IsEnable', type: 'string' },
{ name: 'Note', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/ShebeiInfoListHandler.ashx'
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
                width: "100%",
                height:"400",
                source: dataAdapter,
                sortable: true,
                pageable: true,
                columnsResize: true,
                serverProcessing: true,
                pageSize: 2,

                columns: [
{ text: '设备编号', align: 'center', dataField: 'Code', minWidth: 100, width: 150 },
{ text: '设备名称', align: 'center', dataField: 'Name', minWidth: 100, width: 150 },
{ text: '规格型号', align: 'center', dataField: 'GuiGe', minWidth: 100, width: 150 }
                ]
            });

        });


        var selectCode = "";
        var selectName = "";
        var selectID = "";
        $(function () {

            $("#treeGrid").on('rowSelect', function (event) {
                // event arguments
                var args = event.args;
                // row index
                var index = args.index;
                // row data
                var rowData = args.row;
                selectCode = args.row["CODE"];
                selectName = args.row["Name"];
                selectID = args.row["ID"];
                 
                // row key
                var rowKey = args.key;

                event.stopPropagation();
            });
            $('#window').jqxWindow({
                showCollapseButton: true, maxHeight: 600, isModal: true, okButton: $('#okButton'),
                cancelButton: $('#cancel'), maxWidth: 700, minHeight: 200, minWidth: 200, height: 500, width: 470,
                autoOpen: false
            });
            $('#cancel').jqxButton({ width: '65px' });
            $('#okButton').jqxButton({ width: '65px' }).on("click", function () {
                $("#txtCode").val(selectName);

            });
        })
        function open1() {
            $('#window').jqxWindow('open');

        }

       
    </script>
</head>
<body style='padding:0 30px;'>
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>系统参数表</span>  
    </div>
 
    <div style=" clear:both;"></div>
    <form id="form1" runat="server">

   

    <div style='float:left;'>
        <input name="txtCode" type="text" id="txtCode"  runat="server"  class="input small" datatype="n" sucmsg=" ">
        <input name="txtCode" type="button" id="Text1" onclick="open1();"  style='font-size: 12px;background:rgb(236, 236, 236);' value='选择设备'  class="input small" datatype="n" sucmsg=" ">
    </div>


     <div id="window">
        <div id="windowHeader">
            <span>
                <img src="Script/styles/images/star.png" alt="" style="margin-right: 15px" />设备选择
            </span>
        </div>
        <div style="overflow: hidden;" id="windowContent">
             <div id="treeGrid" style='margin-top: 20px;'></div>
            <div style="float: right; margin-top: 5px;">
                <input type="button" id="okButton" value="确定" style="margin-right: 10px" />
                <input type="button" id="cancel" value="取消" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>



