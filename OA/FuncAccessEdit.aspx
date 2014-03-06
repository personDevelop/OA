<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FuncAccessEdit.aspx.cs"
    Inherits="OA.FuncAccessEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>功能角色授权</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Script/JqueryForm.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {

            $('#contentSplitter').jqxSplitter({ width: '1000px', height: '500px',
                panels: [{ size: 300, min: 100 },
              { min: 400}]
            });

        }); 
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
{ name: 'RoleClass', type: 'string' }

                ],
                id: 'ID',
                url: 'handler/RoleInfoListHandler.ashx'
            };
            //绑定树
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#Role").jqxDataTable
(
            {
                width: "100%",
                height: "100%",
                source: dataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,
                columnsResize: true,
                columns: [

{ text: '角色编号', align: 'center', dataField: 'Code', minWidth: 100, width: 150 },
{ text: '角色名称', align: 'center', dataField: 'Name', minWidth: 100, width: 150 }
                ]
            });
            $("#Role").on('rowSelect',
function (event) {
    LoadPermison(event.args.row.ID);
});
        }); 
    </script>
    <script type="text/javascript">
        function LoadPermison(roleID) {
            if (!funDataTable) {
                LoadDataTable(roleID);
            } else {
                FuncdataAdapter.dataBind();
                //                funDataTable.jqxDataTable('updatebounddata'); 
            }
        }
    
    
    </script>
    <script type="text/javascript">
        var funDataTable;
        var FuncdataAdapter;
        function LoadDataTable(roleID) {


            //获取数据
            var sourceFunc =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'Code', type: 'string' },
{ name: 'Name', type: 'string' },
{ name: 'FaccIsEnable', type: 'string' },
{ name: 'IsView', type: 'string' },
 { name: 'ParentID', type: 'string' },
                    { name: 'ParentName', type: 'string' },

                ],
                hierarchy:
                {
                    keyDataField: { name: 'ID' },
                    parentDataField: { name: 'ParentID' }
                },
                id: 'ID',
                url: 'handler/FuncAccessListHandler.ashx'
            };
            FuncdataAdapter = new $.jqx.dataAdapter(sourceFunc,
                {
                    formatData: function (data) {
                        var selection = $("#Role").jqxDataTable('getSelection');
                        if (!selection || selection.length == 0) {
                            Msg.ShowError("请先选择一个角色");
                            return;
                        }
                        
                        data.roleID = selection[0].ID;
                        return data;
                    }

                }
            );

            //绑定树

            funDataTable = $("#treeFunc").jqxTreeGrid(
            {
                width: "100%",
                height: "100%",
                source: FuncdataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,

                columnsResize: true,
                columns: [

{ text: '功能编号', align: 'center', dataField: 'Code', minWidth: 100, width: 250 },
{ text: '功能名称', align: 'center', dataField: 'Name', minWidth: 100, width: 250 },
{ text: '可用', align: 'center', dataField: 'FaccIsEnable', editable:true,minWidth: 10, width: 50,
    cellsRenderer: function (row, column, value, rowData) {

        if (value) {
            return "<input onchange=' setIsenable(true,\""+row+"\")'   type='checkbox' checked='checked' />";
        }
        else
        { return "<input  onchange='  setIsenable(false,\"" + row + "\")'   type='checkbox'   />"; }

    }
},
{ text: '可见', align: 'center', dataField: 'IsView', editable: true, minWidth: 10, width: 50,
    cellsRenderer: function (row, column, value, rowData) {
        if (value) {
            return "<input  onchange=' setIsView(true,\"" + row + "\")'   type='checkbox' checked='checked' />";
        }
        else
        { return "<input   onchange='  setIsView(false,\"" + row + "\")' type='checkbox'   />"; }


    }
}


                ]
            });

}

function setIsenable(ischecked, rowid) {
    for (var i = 0; i < FuncdataAdapter.records.length; i++) {
        if (FuncdataAdapter.records[i].ID==rowid) {
            FuncdataAdapter.records[i].FaccIsEnable = !ischecked;
            break;
        }
    }


}

function setIsView(ischecked, rowid) {
    for (var i = 0; i < FuncdataAdapter.records.length; i++) {
        if (FuncdataAdapter.records[i].ID == rowid) {
            FuncdataAdapter.records[i].IsView = !ischecked;
            break;
        }
    }


}

    </script>
    <script type="text/javascript">

        function submitdatas() {


            var selection = $("#Role").jqxDataTable('getSelection');
            if (!selection || selection.length == 0) {
                Msg.ShowError("请先选择一个角色");
                return;
            }
            var roleID = selection[0].ID;

            var accdata = { roleID: roleID, count: FuncdataAdapter.records.length, acc: FuncdataAdapter.records };
            options = {
                url: 'handler/FuncAccessSaveHandler.ashx', //提交给哪个执行 
                type: 'POST',
                data: accdata,
                dataType: 'json',
                success: function (data) {
                    if (data.success == "true") {
                        //$('#treeGrid').jqxGrid('refresh'); 
                        parent.art.dialog({
                            title: '系统提示',
                            content: '保存成功！',
                            icon: 'succeed',
                            lock: true,
                            ok: function () {

                            }
                        });

                    }
                    else {
                        Msg.ShowError(base64decode(data.msg));
                    }
                },
                error: function (df) {

                    Msg.ShowError('sd');
                
                }
            }
            $.ajax(options);
            return false;

        }
    
    
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>功能角色授权</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <div id="contentSplitter">
                <div>
                    <div id="Role">
                    </div>
                </div>
                <div>
                    <div id="treeFunc">
                    </div>
                    <div class="page-footer">
                        <div class="btn-list">
                            <input type="button" name="submitdata" class="btn" value="提交保存" onclick="return submitdatas();" />
                             
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
