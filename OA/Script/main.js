function logout() {
    var callback = function () {
        window.location.href = "login.aspx";
    }
    var vsasync = false;
    $.ajax({
        url: "handler/clearState.ashx",
        type: "post",
        data: {},
        async: vsasync,
        dataType: "json",
        success: function (reval) {
            if (typeof (callback) == 'function') {
                callback(reval);
            }
            else {
                returnVal = reval;
            }
        },
        error: function (err) {
            throw err.responseText;
            return false;
        }
    });
    return returnVal;
}