<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkHandLogEdit.aspx.cs"
    Inherits="OA.WorkHandLogEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>设备故障处理</title>
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
            $('#btnSelectPerson').hide();

            $("input[name='txtHandResult']").change(function () {
                $('#btnSelectPerson').hide();
                var date = $('input[name="txtHandResult"]:checked').val();
                if (!date) {

                } else {
                    if (date == "处理中") {
                        $('#btnSelectPerson').show();
                    }
                }

                // 这里可以写些验证代码
            });
            $('#form1').jqxValidator({
                rules: [
                 { input: '#txtHandType', message: '必须选择一个处理方式!', action: 'keyup, blur', rule: function () {
                     var date = $('input[name="txtHandType"]:checked').val();
                     if (!date && $('input[name="txtHandResult"]:checked').val() == "完成") {
                                           return false;
                                       } else {
                                           return true;
                                       }

                                   }
                                   },
                                   { input: '#txtHandResult', message: '必须选择一个状态!', action: 'keyup, blur', rule: function () {
                                       var date = $('input[name="txtHandResult"]:checked').val();
                                       if (!date) {
                                           return false;
                                       } else {
                                           return true;
                                       }

                                   }
                                   },
 { input: '#btnSelectPerson', message: '必须选择指派人!', action: 'keyup, blur', rule: function () {
     var date = $('input[name="txtHandResult"]:checked').val();
     if (date == "处理中") {
         var date = $('#txtZprID').val();
         if (!date) {
             return false;
         }
     }
     return true;

 }
 }
                                   ]
            });
            $('#form1').submit(function ()//提交表单 
            {

                if ($("#txtCurrentStaus").val() == "完成") {
                    Msg.ShowError("任务已完成，不能再重复办理！");
                    return false;
                }
                var issuccess = $('#form1').jqxValidator('validate');
                if (issuccess) {
                    var options = {
                        url: 'handler/WorkHandLogSaveHandler.ashx', //提交给哪个执行 
                        type: 'POST',
                        dataType: 'json',
                        success: function (data) {
                            if (data.success == "true") {
                                parent.art.dialog({
                                    title: '系统提示',
                                    content: '保存成功！',
                                    icon: 'succeed',
                                    lock: true,
                                    ok: function () {

                                    }
                                });

                                history.back(-1);
                            }
                            else {
                                Msg.ShowError(base64decode(data.msg));
                            }
                        }
                    };
                    $('#form1').ajaxSubmit(options);

                }
                return false; //为了不刷新页面,返回false  
            });
        });


        function FPrenWu() {
            $('#window').jqxWindow('open');
        }
    </script>
    <script type="text/javascript">

        $(function () {
            $('#mainSplitter').jqxSplitter({ width: 550, splitBarSize: 1, height: 420, panels: [{ size: 200 }, { size: 350}] });
            $('#spliter').jqxSplitter({ width: 350, splitBarSize: 1, height: 420, panels: [{ size: 50 }, { size: 300}] });
            $('#ok').jqxButton({ width: '65px' }).on("click", function () {

                var selection = $("#selectPerson").jqxDataTable('getRows');
                var zprid = ""; zprname = "";
                if (selection.length > 0) {

                    for (var i = 0; i < selection.length; i++) {
                        if (i > 0) {
                            zprid += ",";
                            zprname += ",";
                        }
                        zprid += selection[i].ID;
                        zprname += selection[i].RealName;
                    }
                    $('#window').jqxWindow('close');

                }
                $('#txtZprID').val(zprid);
                $('#txtZprName').val(zprname);
            });
            $('#cancel').jqxButton({ width: '65px' });
            //获取数据
            var unselectsource =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'RealName', type: 'string' }
                ],
                id: 'ID',
                url: 'handler/PersonInfoListHandler.ashx'
            };

            var Selectesource =
            {
                dataType: "json",
                dataFields: [
                { name: 'ID', type: 'string' },
{ name: 'UserName', type: 'string' },
{ name: 'RealName', type: 'string' }
                ],
                id: 'ID'
            };
            var SelectdataAdapter = new $.jqx.dataAdapter(Selectesource);
            var unselectdataAdapter = new $.jqx.dataAdapter(unselectsource,
                {
                    formatData: function (data) {
                        if (unselectsource.totalRecords) {

                            data.$skip = data.pagenum * data.pagesize;
                            data.$top = data.pagesize;
                        }
                        return data;
                    },
                    downloadComplete: function (data, status, xhr) {
                        //                        if (!unselectsource.totalRecords) {
                        unselectsource.totalRecords = data.totalRecords;
                        data.value = data.rows;
                        //                        }
                    },
                    loadError: function (xhr, status, error) {
                        Msg.ShowError(error);

                    }
                }
            );
            $("#unselectperson").jqxDataTable
                (
            {
                width: "100%",
                height: "100%",
                source: unselectdataAdapter,
                serverProcessing: true,
                autoRowHeight: false,
                altRows: true,
                pageable: true,
                columnsResize: true,
                pageSize: 20,
                pagesizeoptions: ['20', '50', '100'],
                columns: [
{ text: '待选人员', align: 'center', dataField: 'RealName', minWidth: 100, width: "100%" },
                ]
            });
            $("#selectPerson").jqxDataTable
                (
            {
                width: "200px",
                height: "100%",
                source: SelectdataAdapter,
                autoRowHeight: false,
                altRows: true,
                columns: [
{ text: '已指派人员', align: 'center', dataField: 'RealName', minWidth: 100, width: "100%" },
                ]
            });

            $('#window').jqxWindow({
                showCollapseButton: true, maxHeight: 600, isModal: true, okButton: $('#okButton'),
                cancelButton: $('#cancel'), maxWidth: 700, minHeight: 200, minWidth: 200, height: 500, width: 470,
                autoOpen: false
            });
        });

        function select(selcttype) {

            var from = "", to = "";
            switch (selcttype) {
                case 'allright':
                    from = "";
                    to = "";
                    break;
                case "right":
                    from = "#unselectperson";
                    to = "#selectPerson";


                    break;
                case "left":
                    from = "#selectPerson";
                    to = "#unselectperson";
                    break;
                case "allleft":
                    from = "";
                    to = "";
                    break;
            }
            var selection = $(from).jqxDataTable('getSelection');
            if (selection.length == 1) {
                var rowData = selection[0];
                $(to).jqxDataTable('addRow', rowData.ID, rowData);
                var rows = $(from).jqxDataTable('getRows');
                var rowIndex = -1;
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].ID == rowData.ID) {
                        rowIndex = i;
                        break;
                    }
                }
                $(from).jqxDataTable('deleteRow', rowIndex);

            } else {
                Msg.ShowError("请先选择要移动的人员，且只能选择一个！");

            }
        }
    </script>
    <style type="text/css">
        .readonly
        {
            background-color: #FCF7F4;
        }
    </style>
    <style type="text/css">
        .icon-listNew li
        {
            float: left;
        }
        .icon-listNew li:first-child a
        {
            border-left: solid 1px #dbdbdb;
        }
        .icon-listNew li a i
        {
            display: inline-block;
            margin-right: 0px;
            width: 17px;
            height: 17px;
            text-indent: -999em;
            vertical-align: middle;
        }
        
        .icon-listNew li a.allright i
        {
            background: url(Script/styles/images/metro-icon-last.png) no-repeat;
        }
        .icon-listNew li a.right i
        {
            background: url(Script/styles/images/metro-icon-right.png) no-repeat;
        }
        .icon-listNew li a.allleft i
        {
            background: url(Script/styles/images/metro-icon-first.png) no-repeat;
        }
        .icon-listNew li a.left i
        {
            background: url(Script/styles/images/metro-icon-left.png) no-repeat;
        }
        .icon-listNew li a span
        {
            display: inline-block;
            vertical-align: middle;
        }
        .icon-listNew li a:hover
        {
            color: #2A72C5;
        }
        .icon-listNew li a
        {
            line-height: 20px;
            color: #333;
            font-size: 12px;
        }
        .icon-listNew
        {
            margin-right: 10px;
        }
        .icon-listNew li a
        {
            display: inline-block;
            padding: 5px 10px 5px 8px;
            line-height: 20px;
            height: 20px;
            border: solid 1px #e1e1e1;
            border-left: none;
            color: #333;
            font-size: 12px;
            text-decoration: none;
            background: #fafafa;
        }
        .icon-listNew li a
        {
            line-height: 20px;
            color: #333;
            font-size: 12px;
        }
    </style>
</head>
<body style='padding-left: 10px; padding-right: 10px; padding-top: 10px;'>
    <form id="form1" runat="server">
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
        <a href="AdminIndex.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow">
        </i><span>设备故障处理</span>
    </div>
    <div style='margin-top: 20px;'>
    </div>
    <div class="content-tab-wrap">
        <div class="tab-content" style="display: block;">
            <input name="txtID" type="hidden" id="txtID" runat="server" />
            <input name="txtWorkID" type="hidden" id="txtWorkID" runat="server" />
            <input name="txtZprID" type="hidden" id="txtZprID" />
            <input name="txtZprName" type="hidden" id="txtZprName" />
            <dl>
                <dl>
                    <dt>设备名称</dt>
                    <dd>
                        <input name="txtShebei" type="text" id="txtShebei" runat="server" class="input small readonly"
                            datatype="n" sucmsg=" " readonly="readonly">
                    </dd>
                </dl>
                <dl>
                    <dt>故障信息</dt>
                    <dd>
                        <textarea name="txtGZXX" rows="5" cols="100" type="text" id="txtGZXX" runat="server"
                            class="input small readonly" datatype="n" sucmsg=" " readonly="readonly" />
                    </dd>
                </dl>
                <dl>
                    <dt>最后处理信息</dt>
                    <dd>
                        <textarea name="txtLastHandle" rows="5" cols="100" type="text" id="txtLastHandle"
                            runat="server" class="input small readonly" datatype="n" sucmsg=" " readonly="readonly" />
                    </dd>
                </dl>
                <dl>
                    <dt>当前状态</dt>
                    <dd>
                        <input name="txtCurrentStaus" type="text" id="txtCurrentStaus" runat="server" class="input small readonly"
                            datatype="n" readonly="readonly">
                    </dd>
                </dl>
                <dl>
                    <dt>处理信息</dt>
                    <dd>
                        <textarea name="txtChuliYj" rows="5" cols="100" type="text" id="txtChuliYj" runat="server"
                            class="input small" datatype="n" sucmsg=" " />
                    </dd>
                </dl>
                  <dl>
                    <dt>处理结果</dt>
                    <dd>
                        <asp:RadioButtonList ID="txtHandResult" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="处理中" Text="转给他人处理"></asp:ListItem>
                            <asp:ListItem Value="完成" Text="处理完成"></asp:ListItem>
                        </asp:RadioButtonList>
                        <input id="btnSelectPerson" type="button" value="指派他人" class="btn yellow" onclick=" return FPrenWu();">
                    </dd>
                </dl>
                <dl>
                    <dt>处理方式</dt>
                    <dd>
                        <asp:RadioButtonList ID="txtHandType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0" Text="维修"></asp:ListItem>
                            <asp:ListItem Value="1" Text="更换设备"></asp:ListItem>
                        </asp:RadioButtonList>
                    </dd>
                </dl>
              
            </dl>
        </div>
        <div class="page-footer">
            <div class="btn-list">
                <asp:Button ID="Button1" runat="server" class="btn" Text="提交保存" />
                <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </form>
    <div id="window">
        <div id="windowHeader">
            <span>
                <img src="Script/styles/images/star.png" alt="" style="margin-right: 15px" />人员选择
            </span>
        </div>
        <div style="overflow: hidden;" id="windowContent">
            <div id="mainSplitter">
                <div class="splitter-panel">
                    <div id="unselectperson">
                    </div>
                </div>
                <div class="splitter-panel">
                    <div id="spliter">
                        <div class="splitter-panel">
                            <div style='margin: 200px 10px;'>
                                <ul class="icon-listNew">
                                    <%--<li><a class="allright" onclick="return select('allright');" href="#"><i></i></a>
                            </li>--%>
                                    <li><a class="right" onclick="return select('right');" href="#"><i></i></a></li>
                                    <li><a class="left" onclick="return select('left');" href="#"><i></i></a></li>
                                    <%--<li><a class="allleft" onclick="return select('allleft');" href="#"><i></i></a></li>--%>
                                </ul>
                            </div>
                        </div>
                        <div class="splitter-panel">
                            <div id="selectPerson">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float: right; margin-top: 5px;">
                <input type="button" id="ok" value="确定" style="margin-right: 10px" />
                <input type="button" id="cancel" value="取消" />
            </div>
        </div>
    </div>
</body>
</html>
