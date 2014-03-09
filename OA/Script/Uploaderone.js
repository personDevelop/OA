// JavaScript Document
(function ($) {
    $.fn.uploadone = function (options) {
        var fileData = "";
        var fileValue = "";
        var defaults = {
            loadData: "",
            fileValue: "",
            handler: false,
            opacity: 0.5
        };
        var opts = $.extend(defaults, options); //扩展默认配置
        fileData = opts.loadData;
        fileValue = opts.fileValue;
        var _self = this; //获取当前对象 为upload的container
        var ExtenObj = {
            render: function () {
                this.p = opts; // 配置缓存在p上
                this.fileData = fileData;
                this.g = _self; //dom缓存在g上
                this.initWrap();
                this.renderid = _self.attr("id");
                this.initUploadCtrl();
                this.initIamgePreview();
                this.addEvent();
                this.initData(this.fileData, this.fileValue);
                //this.filepath = fileValue;

            },
            initData: function (data, fileValue) {
                //加载数据
                var fileques = this.file_queue;
                //for (var item in data) {
                for (var item = 0; item < data.length; item++) {

                    fileques.append(
                            '<div id="' + data[item]["ID"] + '" class="uploadone">'
                            + '<img src="' + data[item]["FILEPATH"] + '" class="img_desk">'
                            + '<div style="float: right;margin-right: 12px;">'
                            + '<a class="del_File_One" href="#" databind="' + data[item]["ID"] + '" onclick="flieDel(this)" style="margin-right: 4px;">删除</a>'
                            + '<a class="pre_view_one" target="_blank" href="' + data[item]["FILEPATH"] + '"   style="">查看</a></div>' +
                            '</div>');
                }

            },
            initWrap: function () {
                var render_dom = this.g;
                var Wrap = $("<div class='upload'></div>"); //upload的外侧包裹
                this.wrap = $(render_dom).wrap(Wrap); //包裹
                //$(_self).parent().append("<div><div class='progress' ><div class='pecent' ></div></div><div class='detail'></div></div>"); //创建文件队列区域。
                $(_self).parent().append("<div class='file_queueone' ></div>"); //创建文件队列区域。
                this.file_queue = $(".file_queueone", $(_self).parent()); //获取文件区域dom
            },
            initUploadCtrl: function () {
                var render_dom = this.g;
                var fileques = this.file_queue;
                var g = this;
                var gg = $(render_dom).uploadify({
                    auto: true,
                    height: 30,
                    swf: 'Script/uploadify/uploadify.swf',
                    uploader: 'handler/uploadHandler.ashx?sid=' + $("#txtID").val(),
                    width: 120,
                    buttonText: '选择图片',
                    fileTypeExts: '*.gif;*.jpg;*.jpeg;*.png',
                    'fileSizeLimit': '6000KB',
                    removeCompleted: false,
                    'formData': {
                        "id": "1"
                    },
                    file_queued_handler: function (file) {

                    },
                    upload_start_handler: function (file) {

                    },
                    upload_progress_handler: function (file, bytesLoaded, bytesTotal) {
                         
                        //$(".detail").html((bytesLoaded / 1024).toFixed(2) + "KB/" + (bytesTotal / 1024).toFixed(2) + "KB"); //百分比
                    },
                    onUploadSuccess: function (file, data, response) {//上传完成时触发（每个文件触发一次） 
                        if (data.indexOf('错误提示') > -1) {
                            alert(data);
                        }
                        else {
                            //alert(data);
                            //render_dom.val("admin/" + data);

                            g.filepath = data.split(";")[0];
                            var fileUid = data.split(";")[1];
                            //alert( render_dom.val());
                            g.fileData = {};
                            g.fileData[file.id] = { name: file.name, path: data };
                            fileques.append(
                            '<div id="' + fileUid + '" class="uploadone">'
                            + '<img src="' + g.filepath + '" class="img_desk">'
                            + '<div style="float: right;margin-right: 12px;">'
                            + '<a class="del_File_One" href="#" databind="' + fileUid + '" onclick="flieDel(this)"  style="margin-right: 4px;">删除</a>'
                            + '<a class="pre_view_one" target="_blank" href="' + g.filepath + '" >查看</a>'
                            + '</div>'
                            + '</div>');
                        }
                        
                    },
                    onUploadError: function (file, errorCode, errorMsg, errorString) {//当单个文件上传出错时触发 
                        alert('文件：' + file.name + ' 上传失败: ' + errorString);
                    }
                });
            },
            initIamgePreview: function () {
                this.imgPreView = $('<div class="imgPreview" style="display:none;"><img style="border:none;"  src="" ></img></div>');
                $("body").append(this.imgPreView);
            },
            getValue: function () {
                if ($("#" + this.renderid).parent().find(".uploadone").length == 0) {
                    return "";
                } else {
                    return this.filepath;
                }
            },
            addEvent: function () {
                var imgPreView = this.imgPreView;
                var g = this;
            },
            getFile: function () {
                //return this.
            }
        };
        // 覆盖默认配置
        ExtenObj.render();
        return ExtenObj;
    };
})(jQuery);

function flieDel(ele) {
    //alert($(ele).attr("databind"));
    var fid = $(ele).attr("databind");
    var resobj = null;
    var vsJsonData = { "fid": fid };
    $.ajax({
        url: "handler/FileDel.ashx",
        type: "post",
        data: vsJsonData,
        dataType: "text",
        async: true,
        success:
                function (reval) {
                    if (reval == "sucess") {
                        parent.art.dialog({
                            title: '系统提示',
                            content: '删除成功！',
                            icon: 'succeed',
                            lock: true,
                            ok: function () {

                            }
                        });
                        $("#" + fid).remove();
                    } else {
                        parent.art.dialog({
                            title: '系统提示',
                            content: "删除失败！",
                            icon: 'succeed',
                            lock: true,
                            ok: function () {

                            }
                        });
                        
                    }
                },
        error: function (err) {
            throw err.responseText;
            return false;
        }
    });
    return resobj;
}

var uploadifySettings = function (obj) {


    var url = 'handler/uploadHandler.ashx?sid=' + $("#txtID").val();
    obj.setUploadURL(url); //重新设置后台处理地址
    //obj.setFileSizeLimit(maxLength); //设置允许上传的文件大小
}