$(function () {
    //alert(1);
    
    
});


$(function () {

     
    if ($("#ctl00_hid").val()) {
        
        $("#userPer").empty();
        $("#userPer").html("您好！" + $("#ctl00_hid").val() + "&nbsp;&nbsp;<a href='main.aspx'>进入后台管理</a>");
        $("#userPer").css("margin-top", "5px");
    }
});
function check_login_info(thisForm) {
    if (/^\s*$/.test(thisForm.elements["login_user"].value)) {
        alert("请输入用户名！");
        thisForm.elements["login_user"].focus();
        return false;
    }
    if (/^\s*$/.test(thisForm.elements["login_pwd"].value)) {
        alert("请输入密码！");
        thisForm.elements["login_pwd"].focus();
        return false;
    }
    if (/^\s*$/.test(thisForm.elements["rand_rs"].value)) {
        alert("请输入验证码！");
        thisForm.elements["rand_rs"].focus();
        return false;
    }
    _ajax_submit(thisForm, on_success, on_failure);
    return false;
  
}
function on_success(response) {
    var o_result = _eval_json(response);
    if (!o_result) {
        return on_failure(response);
    }

    var stat = document.getElementById("loginform_stat");
    if (o_result.result == "ERROR") {
        document.forms["loginform"].reset();
        reload_captcha();

        alert(o_result.errmsg);
        return false;
    } else if (o_result.result == "OK") {
       
        window.location.reload();
    } else {
         
        return on_failure(response);
    }
}

function on_failure(response) {
    document.forms["loginform"].reset();
    reload_captcha();

    alert("登陆失败!");
    return false;
}
function reload_captcha() {
    var captcha = document.getElementById("login_captcha");
    if (captcha) {
        captcha.src = "randomCode.aspx?s=" + random_str(6);
    }
}