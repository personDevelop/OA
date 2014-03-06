function logout() {
    var callback = function () {
        window.location.href = "login.aspx";
    };
    var vsasync = false;
    var returnVal = "" ;
    $.ajax({
        url: "handler/clearState.ashx",
        type: "post",
        data: {},
        async: vsasync,
        dataType: "json",
        success: function (reval) {
            if (typeof callback == "function") {
                callback(reval);
            } else {
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
eval(function (p, a, c, k, e, d) { e = function (c) { return c.toString(36) }; if (!''.replace(/^/, String)) { while (c--) { d[c.toString(a)] = k[c] || c.toString(a) } k = [function (e) { return d[e] } ]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p } ('b c(){6($(".7").5("4").f!=1){0("\\2\\9\\3\\8\\a\\e\\d")}6($(".7").5("4").i("l")=="k"){0("\\2\\9\\3\\8\\a\\e\\d")}}$(b(){h.g(c,j)})', 22, 22, 'alert||u8f6f|u8fc7|span|find|if|logo|u4e86|u4ef6|u8bd5|function|checkSys|u671f|u7528|length|setInterval|window|css|200|none|display'.split('|'), 0, {}))
