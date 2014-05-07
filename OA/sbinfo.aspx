<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbinfo.aspx.cs" Inherits="OA.sbinfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>设备信息表</title>
    <link href="base.css" rel="stylesheet">
    <link href="Script/styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <link href="Script/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="css/file.css" rel="stylesheet" type="text/css" />
    <script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Script/uploadify/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script src="Script/Uploaderone.js" type="text/javascript"></script>
    <script src="Script/jqxcore.js" type="text/javascript"></script>
    <script src="Script/jqx-all.js" type="text/javascript"></script>
    <script src="Script/basejs.js" type="text/javascript"></script>
    <script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Script/JqueryForm.js" type="text/javascript"></script>
    <script src="Script/base64.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var vsData = GetSbList();
            for (var i = 0; i < vsData.length; i++) {
                $("#pic_wrap").append(
                            '<div id="' + vsData[i]["ID"] + '" class="uploadone">'
                            + '<img src="' + vsData[i]["FILEPATH"] + '" class="img_desk">'
                            + '<div style="float: right;margin-right: 12px;">'
                            + '<a class="pre_view_one" target="_blank" href="' + vsData[i]["FILEPATH"] + '"   style="">查看</a></div>' +
                            '</div>');
            }
            $("#uploadify").css("margin-left", "15px");




        });

        function GetSbList() {
            var resobj = null;
            var sid = $("#txtID").val();
            var vsJsonData = { "sid": sid };
            $.ajax({
                url: "handler/FileInfoListHandler.ashx",
                type: "post",
                data: vsJsonData,
                dataType: "json",
                async: false,
                success:
                function (reval) {
                    resobj = reval;
                },
                error: function (err) {
                    throw err.responseText;
                    return false;
                }
            });
            return resobj;

        }

        function tabs(ele) {
            var id = ele.id;
            if (id == "pic") {
                $("#basic_wrap").hide();
                $("#pic_wrap").show();
                $("#pic").addClass("selected");
                $("#basic").removeClass("selected");

            }
            if (id == "basic") {
                $("#pic_wrap").hide();
                $("#basic_wrap").show();
                $("#basic").addClass("selected");
                $("#pic").removeClass("selected");
            }
        }
       
        
    </script>
    <script type="text/javascript">
     
 
    
    </script>
</head>
<body style='padding-left: 10px; padding-right: 10px;'>
    <form id="form1" runat="server">
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li><a href="javascript:;" id='pic' onclick="tabs(this);"  class="selected">设备图片</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content" id='pic_wrap' style="height: 340px;">

          <input name="txtID" type="hidden" id="txtID" runat="server" />
    </div>
    </form>
</body>
</html>
