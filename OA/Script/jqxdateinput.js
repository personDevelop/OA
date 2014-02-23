﻿/*
jQWidgets v3.1.0 (2013-Dec-23)
Copyright (c) 2011-2014 jQWidgets.
License: http://jqwidgets.com/license/
*/

(function (a) {
    a.jqx.jqxWidget("jqxDateTimeInput", "", {});
    a.extend(a.jqx._jqxDateTimeInput.prototype, {
        defineInstance: function () {
            if (this.value == undefined) {
                this.value = a.jqx._jqxDateTimeInput.getDateTime(new Date());
                this.value._setHours(0);
                this.value._setMinutes(0);
                this.value._setSeconds(0);
                this.value._setMilliseconds(0)
            }
            if (this.minDate == undefined) {
                this.minDate = a.jqx._jqxDateTimeInput.getDateTime(new Date());
                this.minDate._setYear(1900);
                this.minDate._setMonth(1);
                this.minDate._setDay(1);
                this.minDate._setHours(1);
                this.minDate._setMinutes(1);
                this.minDate._setSeconds(1);
                this.minDate._setMilliseconds(1)
            }
            this.defaultMinDate = this.minDate;
            if (this.maxDate == undefined) {
                this.maxDate = a.jqx._jqxDateTimeInput.getDateTime(new Date());
                this.maxDate._setYear(2100);
                this.maxDate._setMonth(1);
                this.maxDate._setDay(1);
                this.maxDate._setHours(1);
                this.maxDate._setMinutes(1);
                this.maxDate._setSeconds(1);
                this.maxDate._setMilliseconds(1)
            }
            this.defaultMaxDate = this.maxDate;
            this.min = new Date(1900, 0, 1);
            this.max = new Date(2100, 0, 1);
            this.rowHeaderWidth = 25;
            this.columnHeaderHeight = 20;
            this.titleHeight = 25;
            if (this.firstDayOfWeek == undefined) {
                this.firstDayOfWeek = 0
            }
            if (this.showWeekNumbers == undefined) {
                this.showWeekNumbers = false
            }
            this.cookies = false;
            this.cookieoptions = null;
            this.showFooter = false;
            if (this.formatString === undefined) {
                this.formatString = "dd/MM/yyyy"
            }
            if (this.width === undefined) {
                this.width = null
            }
            if (this.height === undefined) {
                this.height = null
            }
            if (this.dayNameFormat === undefined) {
                this.dayNameFormat = "firstTwoLetters"
            }
            if (this.textAlign === undefined) {
                this.textAlign = "left"
            }
            if (this.readonly === undefined) {
                this.readonly = false
            }
            if (this.culture === undefined) {
                this.culture = "default"
            }
            this.activeEditor = this.activeEditor || null;
            if (this.showCalendarButton === undefined) {
                this.showCalendarButton = true
            }
            if (this.openDelay == undefined) {
                this.openDelay = 250
            }
            if (this.closeDelay === undefined) {
                this.closeDelay = 300
            }
            if (this.closeCalendarAfterSelection === undefined) {
                this.closeCalendarAfterSelection = true
            }
            this.isEditing = false;
            this.enableBrowserBoundsDetection = false;
            this.dropDownHorizontalAlignment = "left";
            this.enableAbsoluteSelection = false;
            this.disabled = false;
            this.buttonSize = 18;
            this.animationType = "slide";
            this.dropDownWidth = "205px";
            this.dropDownHeight = "205px";
            this.selectionMode = "default";
            this.rtl = false;
            this._editor = false;
            this.todayString = "Today";
            this.clearString = "Clear";
            this.popupZIndex = 100000;
            this.allowNullDate = true;
            this.allowKeyboardDelete = true;
            this.localization = {
                backString: "Back",
                forwardString: "Forward",
                todayString: "Today",
                clearString: "Clear",
                calendar: {
                    name: "Gregorian_USEnglish",
                    "/": "/",
                    ":": ":",
                    firstDay: 0,
                    days: {
                        names: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                        namesAbbr: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                        namesShort: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                    },
                    months: {
                        names: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""],
                        namesAbbr: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""]
                    },
                    AM: ["AM", "am", "AM"],
                    PM: ["PM", "pm", "PM"],
                    eras: [{
                        name: "A.D.",
                        start: null,
                        offset: 0
                    }],
                    twoDigitYearMax: 2029,
                    patterns: {
                        d: "M/d/yyyy",
                        D: "dddd, MMMM dd, yyyy",
                        t: "h:mm tt",
                        T: "h:mm:ss tt",
                        f: "dddd, MMMM dd, yyyy h:mm tt",
                        F: "dddd, MMMM dd, yyyy h:mm:ss tt",
                        M: "MMMM dd",
                        Y: "yyyy MMMM",
                        S: "yyyy\u0027-\u0027MM\u0027-\u0027dd\u0027T\u0027HH\u0027:\u0027mm\u0027:\u0027ss",
                        ISO: "yyyy-MM-dd hh:mm:ss"
                    }
                }
            };
            this.events = ["valuechanged", "textchanged", "mousedown", "mouseup", "keydown", "keyup", "keypress", "open", "close", "change"];
            this.aria = {
                "aria-valuenow": {
                    name: "getDate",
                    type: "date"
                },
                "aria-valuetext": {
                    name: "getText",
                    type: "string"
                },
                "aria-valuemin": {
                    name: "min",
                    type: "date"
                },
                "aria-valuemax": {
                    name: "max",
                    type: "date"
                },
                "aria-disabled": {
                    name: "disabled",
                    type: "boolean"
                }
            }
        },
        createInstance: function (c) {
            var e = "";
            if (!this.host.jqxCalendar) {
                throw new Error("jqxDateTimeInput: Missing reference to jqxcalendar.js.")
            }
            if (this.host.attr("value")) {
                e = true;
                var g = this.host.attr("value");
                if (this.selectionMode != "range") {
                    var b = new Date(g);
                    if (b != undefined && !isNaN(b)) {
                        this.value = a.jqx._jqxDateTimeInput.getDateTime(b)
                    }
                }
            }
            if (this.value != null && this.value instanceof Date) {
                this.value = a.jqx._jqxDateTimeInput.getDateTime(this.value)
            } else {
                if (this.value != null && typeof (this.value) == "string") {
                    var b = new Date(this.value);
                    if (b != undefined && !isNaN(b)) {
                        this.value = a.jqx._jqxDateTimeInput.getDateTime(b)
                    }
                }
            }
            this.host.attr("data-role", "input");
            this.render();
            a.jqx.aria(this);
            if (this.getDate() != null) {
                a.jqx.aria(this, "aria-label", "Current focused date is " + this.getDate().toLocaleString())
            } else {
                a.jqx.aria(this, "aria-label", "Current focused date is Null")
            }
            if (this.minDate !== this.defaultMinDate) {
                this.min = this.minDate
            }
            if (this.maxDate !== this.defaultMaxDate) {
                this.max = this.maxDate
            }
            this.setMaxDate(this.max, false);
            this.setMinDate(this.min, false);
            if (this.selectionMode == "range") {
                if (e) {
                    var g = this.host.attr("value");
                    var f = g.substring(0, g.indexOf("-"));
                    var d = g.substring(g.indexOf("-") + 1);
                    var j = new Date(f);
                    var h = new Date(d);
                    if (j != undefined && !isNaN(j)) {
                        if (h != undefined && !isNaN(h)) {
                            this.setRange(j, h)
                        }
                    }
                } else {
                    if (this.getDate() != null) {
                        this.setRange(this.getDate(), this.getDate())
                    }
                }
            }
        },
        _format: function (d, e, b) {
            var f = false;
            try {
                if (Globalize != undefined) {
                    f = true
                }
            } catch (c) { }
            if (a.global) {
                return a.global.format(d, e, this.culture)
            } else {
                if (f) {
                    try {
                        var e = Globalize.format(d, e, this.culture);
                        return e
                    } catch (c) {
                        return Globalize.format(d, e)
                    }
                } else {
                    if (a.jqx.dataFormat) {
                        if (d instanceof Date) {
                            return a.jqx.dataFormat.formatdate(d, e, this.localization.calendar)
                        } else {
                            if (typeof d === "number") {
                                return a.jqx.dataFormat.formatnumber(d, e, this.localization.calendar)
                            } else {
                                return a.jqx.dataFormat.formatdate(d, e, this.localization.calendar)
                            }
                        }
                    } else {
                        throw new Error("jqxDateTimeInput: Missing reference to globalize.js.")
                    }
                }
            }
        },
        render: function () {
            this._removeHandlers();
            this.element.innerHTML = "";
            this.host.attr({
                role: "textbox"
            });
            this.id = a.jqx.utilities.createId();
            var f = a.jqx.utilities.createId();
            var k = a.jqx.utilities.createId();
            var b = a("<div class='jqx-datetimeinput-container' style='overflow: hidden; border: 0px;'><div id='dateTimeWrapper' style='float: none; position: relative; width: 100%; height: 100%;'><div class='jqx-datetimeinput-content' id='dateTimeContent" + f + "' style='position: relative; overflow: hidden; float: left;'/><div id='dateTimeButton" + k + "' style='position: relative; float: right;'/></div></div>");
            this.host.css("overflow", "hidden");
            this._setSize();
            if (this.width == null) {
                this.width = this.host.width();
                this.host.width(this.width)
            }
            this.touch = a.jqx.mobile.isTouchDevice();
            this.host.append(b);
            this.dateTimeWrapper = this.host.find("#dateTimeWrapper");
            this.inputElement = this.host.find("#dateTimeContent" + f);
            this.calendarElement = this.host.find("#dateTimeButton" + k);
            this.dateTimeInput = a("<input autocomplete='off' style='position: relative; border: none; margin: 0; padding: 0;' id='inputElement' class='jqx-input-content' type='textarea'/>").appendTo(this.inputElement);
            this.dateTimeInput[0].id = "input" + this.element.id;
            this.dateTimeInput.removeClass(this.toThemeProperty("jqx-input-content"));
            this.dateTimeInput.addClass(this.toThemeProperty("jqx-input-content"));
            this.dateTimeInput.addClass(this.toThemeProperty("jqx-widget-content"));
            this.dateTimeInput.addClass(this.toThemeProperty("jqx-rc-all"));
            var c = this.host.attr("name");
            if (!c) {
                c = this.element.id
            }
            this.dateTimeInput.attr("name", c);
            if (this.rtl) {
                this.dateTimeInput.css("direction", "rtl");
                this.dateTimeInput.addClass("jqx-rtl");
                this.inputElement.css("float", "right");
                this.calendarElement.css("float", "left")
            }
            this.inputElement.addClass(this.toThemeProperty("jqx-input"));
            this.inputElement.addClass(this.toThemeProperty("jqx-widget-content"));
            this.inputElement.addClass(this.toThemeProperty("jqx-rc-all"));
            this.inputElement.height(this.host.height() - 2);
            this.calendarButton = a("<div style='padding: 0px; margin: 0px; top: 0; font-size: 3px; position: relative;' class='jqx-input-button-header'><div style='position: relative; font-size: 3px;' class='jqx-input-button-innerheader'></div></div><div style='padding: 0px; margin: 0px; top: 0; position: relative;' class='jqx-input-button-content'/>").appendTo(this.calendarElement);
            this.calendarButtonContent = this.host.find(".jqx-input-button-content");
            this.calendarButtonHeader = this.host.find(".jqx-input-button-header");
            this.calendarButtonInnerHeader = this.host.find(".jqx-input-button-innerheader");
            this.calendarButtonContent.removeClass(this.toThemeProperty("jqx-input-button-content"));
            this.calendarButtonContent.addClass(this.toThemeProperty("jqx-input-button-content"));
            this.calendarButtonContent.removeClass(this.toThemeProperty("jqx-widget-content"));
            this.calendarButtonContent.addClass(this.toThemeProperty("jqx-widget-content"));
            this.calendarButtonHeader.removeClass(this.toThemeProperty("jqx-input-button-header"));
            this.calendarButtonHeader.addClass(this.toThemeProperty("jqx-input-button-header"));
            this.calendarButtonHeader.removeClass(this.toThemeProperty("jqx-widget-header"));
            this.calendarButtonHeader.addClass(this.toThemeProperty("jqx-widget-header"));
            this.calendarButtonInnerHeader.removeClass(this.toThemeProperty("jqx-input-button-innerHeader"));
            this.calendarButtonInnerHeader.addClass(this.toThemeProperty("jqx-input-button-innerHeader"));
            var m = this;
            this._arrange();
            this.addHandler(this.host, "loadContent",
            function (e) {
                m._arrange()
            });
            if (this.showCalendarButton) {
                this.calendarButton.css("display", "block")
            } else {
                this.calendarButton.css("display", "none")
            }
            if (a.jqx._jqxCalendar != null && a.jqx._jqxCalendar != undefined) {
                try {
                    var j = "calendar" + this.id;
                    var h = a(a.find("#" + j));
                    if (h.length > 0) {
                        h.remove()
                    }
                    a.jqx.aria(this, "aria-owns", j);
                    a.jqx.aria(this, "aria-haspopup", true);
                    a.jqx.aria(this, "aria-readonly", this.selectionMode == "range" ? true : false);
                    var d = a("<div style='overflow: hidden; background: transparent; position: absolute;' id='calendar" + this.id + "'><div id='innerCalendar" + this.id + "'></div></div>");
                    if (a.jqx.utilities.getBrowser().browser == "opera") {
                        d.hide()
                    }
                    d.appendTo(document.body);
                    this.container = d;
                    this.calendarContainer = a(a.find("#innerCalendar" + this.id)).jqxCalendar({
                        rowHeaderWidth: this.rowHeaderWidth,
                        titleHeight: this.titleHeight,
                        columnHeaderHeight: this.columnHeaderHeight,
                        _checkForHiddenParent: false,
                        enableAutoNavigation: false,
                        canRender: false,
                        localization: this.localization,
                        todayString: this.todayString,
                        clearString: this.clearString,
                        dayNameFormat: this.dayNameFormat,
                        rtl: this.rtl,
                        culture: this.culture,
                        showFooter: this.showFooter,
                        selectionMode: this.selectionMode,
                        firstDayOfWeek: this.firstDayOfWeek,
                        showWeekNumbers: this.showWeekNumbers,
                        width: this.dropDownWidth,
                        height: this.dropDownHeight,
                        theme: this.theme
                    });
                    this.calendarContainer.css({
                        position: "absolute",
                        zIndex: this.popupZIndex,
                        top: 0,
                        left: 0
                    });
                    this.calendarContainer.addClass(this.toThemeProperty("jqx-popup"));
                    if (a.jqx.browser.msie) {
                        this.calendarContainer.addClass(this.toThemeProperty("jqx-noshadow"))
                    }
                    this._calendar = a.data(this.calendarContainer[0], "jqxCalendar").instance;
                    var m = this;
                    this._calendar.today = function () {
                        m.today()
                    };
                    this._calendar.clear = function () {
                        m.clear()
                    };
                    if (a.jqx.utilities.getBrowser().browser == "opera") {
                        d.show()
                    }
                    d.height(parseInt(this.calendarContainer.height()) + 25);
                    d.width(parseInt(this.calendarContainer.width()) + 25);
                    if (this.selectionMode == "range") {
                        this.readonly = true
                    }
                    if (this.animationType == "none") {
                        this.container.css("display", "none")
                    } else {
                        this.container.hide()
                    }
                } catch (l) { }
            }
            if (a.global) {
                a.global.preferCulture(this.culture)
            }
            this.selectedText = "";
            this._addHandlers();
            this.self = this;
            this.oldValue = this.getDate();
            this.items = new Array();
            this.editors = new Array();
            if (this.value) {
                this.calendarButtonContent.html("<div style='line-height: 16px;  color: inherit; background: transparent; margin: 0; border: 0; padding: 0px; text-align: center; vertical-align: middle;'><b style='border: 0; padding: 0px; margin: 0px; background: transparent;'>" + this.value.day + "</b></div>")
            }
            this._loadItems();
            this.editorText = "";
            if (this.readonly == true) {
                this.dateTimeInput.css("readonly", this.readonly)
            }
            this.dateTimeInput.css("text-align", this.textAlign);
            this.host.addClass(this.toThemeProperty("jqx-widget"));
            this.propertyChangeMap.disabled = function (e, p, o, q) {
                if (q) {
                    e.host.addClass(m.toThemeProperty("jqx-input-disabled"));
                    e.dateTimeInput.addClass(m.toThemeProperty("jqx-input-disabled"));
                    e.host.addClass(m.toThemeProperty("jqx-fill-state-disabled"))
                } else {
                    e.host.removeClass(m.toThemeProperty("jqx-fill-state-disabled"));
                    e.host.removeClass(m.toThemeProperty("jqx-input-disabled"));
                    e.dateTimeInput.removeClass(m.toThemeProperty("jqx-input-disabled"))
                }
                a.jqx.aria(this, "aria-disabled", q)
            };
            if (this.disabled) {
                this.host.addClass(this.toThemeProperty("jqx-input-disabled"));
                this.host.addClass(this.toThemeProperty("jqx-input-disabled"));
                this.dateTimeInput.addClass(this.toThemeProperty("jqx-input-disabled"))
            }
            if (this.host.parents("form").length > 0) {
                this.addHandler(this.host.parents("form"), "reset",
                function () {
                    setTimeout(function () {
                        m.setDate(new Date())
                    },
                    10)
                })
            }
            if (this.cookies) {
                var g = a.jqx.cookie.cookie("jqxDateTimeInput" + this.element.id);
                if (g != null) {
                    this.setDate(new Date(g))
                }
            }
            if (a.jqx.browser.msie && a.jqx.browser.version < 8) {
                if (this.host.parents(".jqx-window").length > 0) {
                    var n = this.host.parents(".jqx-window").css("z-index");
                    this.container.css("z-index", n + 10);
                    this.calendarContainer.css("z-index", n + 10)
                }
            }
            if (this.culture != "default") {
                this._applyCulture()
            }
        },
        val: function (b) {
            if (arguments.length != 0) {
                if (b == null) {
                    this.setDate(null)
                }
                if (this.selectionMode == "range") {
                    this.setRange(arguments[0], arguments[1]);
                    return this.getText()
                }
                if (b instanceof Date) {
                    this.setDate(b)
                }
                if (typeof (b) == "string") {
                    if (b == "date") {
                        return this.getDate()
                    }
                    this.setDate(b)
                }
            }
            return this.getText()
        },
        _setSize: function () {
            if (this.width != null && this.width.toString().indexOf("px") != -1) {
                this.host.width(this.width)
            } else {
                if (this.width != undefined && !isNaN(this.width)) {
                    this.host.width(this.width)
                }
            }
            if (this.height != null && this.height.toString().indexOf("px") != -1) {
                this.host.height(this.height)
            } else {
                if (this.height != undefined && !isNaN(this.height)) {
                    this.host.height(this.height)
                }
            }
            var e = false;
            if (this.width != null && this.width.toString().indexOf("%") != -1) {
                e = true;
                this.host.width(this.width)
            }
            if (this.height != null && this.height.toString().indexOf("%") != -1) {
                e = true;
                this.host.height(this.height)
            }
            var c = this;
            var d = function () {
                if (c.calendarContainer) {
                    c._arrange();
                    if (c.dropDownWidth == "auto") {
                        var f = c.host.width();
                        c.calendarContainer.jqxCalendar({
                            width: f
                        });
                        c.container.width(parseInt(f) + 25)
                    }
                }
            };
            if (e) {
                if (this.calendarContainer) {
                    this.refresh(false);
                    var b = this.host.width();
                    if (this.dropDownWidth != "auto") {
                        b = this.dropDownWidth
                    }
                    this.calendarContainer.jqxCalendar({
                        width: b
                    });
                    this.container.width(parseInt(b) + 25)
                }
            }
            a.jqx.utilities.resize(this.host,
            function () {
                d()
            })
        },
        _arrange: function () {
            if (this.height == null) {
                this.height = 27;
                this.host.height(27)
            }
            var d = parseInt(this.host.width());
            var l = parseInt(this.host.height());
            this.calendarElement.css("top", "0px");
            var j = this.buttonSize;
            var f = 3;
            this.calendarButtonHeader.width(j);
            this.calendarButtonContent.height(j - f - 1);
            this.calendarButtonContent.width(j);
            this.inputElement.height(l - 2);
            var h = parseInt(this.inputElement.outerHeight()) - parseInt(this.inputElement.height());
            h = 0;
            var b = d - j - 2 - 1 * f;
            if (b > 0) {
                this.inputElement.width(b + "px")
            }
            this.dateTimeInput.width(b - f + "px");
            this.dateTimeInput.css("left", 0);
            this.dateTimeInput.css("top", 0);
            this.inputElement.css("left", 0);
            this.inputElement.css("top", 0);
            var k = parseInt(this.calendarButtonHeader.outerWidth()) / 2 - parseInt(this.calendarButtonInnerHeader.outerWidth()) / 2;
            this.calendarButtonInnerHeader.css("left", k);
            var m = parseInt(this.calendarButtonContent.outerHeight()) + parseInt(this.calendarButtonHeader.outerHeight());
            var g = parseInt(this.inputElement.outerHeight()) / 2 - m / 2;
            this.calendarElement.css("top", parseInt(g) + "px");
            var c = this.dateTimeInput.outerHeight();
            if (c == 0) {
                c = parseInt(this.dateTimeInput.css("font-size")) + 3
            }
            var e = parseInt(this.inputElement.height()) / 2 - parseInt(c) / 2;
            var l = this.host.height() - 2;
            if (l > 16) {
                this.dateTimeInput.height(l)
            }
        },
        _removeHandlers: function () {
            var b = this;
            this.removeHandler(a(document), "mousedown." + this.id);
            if (this.dateTimeInput) {
                this.removeHandler(this.dateTimeInput, "keydown." + this.id);
                this.removeHandler(this.dateTimeInput, "blur");
                this.removeHandler(this.dateTimeInput, "focus");
                this.removeHandler(this.host, "focus");
                this.removeHandler(this.dateTimeInput, "mousedown");
                this.removeHandler(this.dateTimeInput, "mouseup");
                this.removeHandler(this.dateTimeInput, "keydown");
                this.removeHandler(this.dateTimeInput, "keyup");
                this.removeHandler(this.dateTimeInput, "keypress")
            }
            if (this.calendarButton != null) {
                this.removeHandler(this.calendarButton, "mousedown")
            }
            if (this.calendarContainer != null) {
                this.removeHandler(this.calendarContainer, "cellSelected");
                this.removeHandler(this.calendarContainer, "cellMouseDown")
            }
            this.removeHandler(a(window), "resize." + this.id)
        },
        isOpened: function () {
            var c = this;
            var b = a.data(document.body, "openedJQXCalendar" + this.id);
            if (b != null && b == c.calendarContainer) {
                return true
            }
            return false
        },
        wheel: function (d, c) {
            var e = 0;
            if (!d) {
                d = window.event
            }
            if (d.originalEvent && d.originalEvent.wheelDelta) {
                d.wheelDelta = d.originalEvent.wheelDelta
            }
            if (d.wheelDelta) {
                e = d.wheelDelta / 120
            } else {
                if (d.detail) {
                    e = -d.detail / 3
                }
            }
            if (e) {
                var b = c._handleDelta(e);
                if (!b) {
                    if (d.preventDefault) {
                        d.preventDefault()
                    }
                    d.returnValue = false;
                    return b
                } else {
                    return false
                }
            }
            if (d.preventDefault) {
                d.preventDefault()
            }
            d.returnValue = false
        },
        _handleDelta: function (b) {
            if (b < 0) {
                this.spinDown()
            } else {
                this.spinUp()
            }
            return false
        },
        focus: function () {
            try {
                this.dateTimeInput.focus()
            } catch (b) { }
        },
        _addHandlers: function () {
            var e = this.element.id;
            var c = this.element;
            var d = this;
            if (this.host.parents()) {
                this.addHandler(this.host.parents(), "scroll.datetimeinput" + this.element.id,
                function (f) {
                    var g = d.isOpened();
                    if (g) {
                        d.close()
                    }
                })
            }
            this.addHandler(this.host, "mousewheel",
            function (f) {
                d.wheel(f, d)
            });
            this.addHandler(a(document), "mousedown." + this.id, this._closeOpenedCalendar, {
                me: this
            });
            if (a.jqx.mobile.isTouchDevice()) {
                this.addHandler(a(document), a.jqx.mobile.getTouchEventName("touchstart") + "." + this.id, this._closeOpenedCalendar, {
                    me: this
                })
            }
            this.addHandler(this.dateTimeInput, "keydown." + this.id,
            function (h) {
                var g = a.data(document.body, "openedJQXCalendar" + d.id);
                if (g != null && g == d.calendarContainer) {
                    var f = d.handleCalendarKey(h, d);
                    return f
                }
            });
            if (this.calendarContainer != null) {
                this.addHandler(this.calendarContainer, "keydown",
                function (f) {
                    if (f.keyCode == 13) {
                        if (d.isOpened()) {
                            if (!d._calendar._viewAnimating && d._calendar.view == "month") {
                                d.hideCalendar("selected");
                                d.dateTimeInput.focus();
                                return false
                            }
                        }
                        return true
                    } else {
                        if (f.keyCode == 9) {
                            if (d.isOpened()) {
                                d.hideCalendar("selected");
                                return true
                            }
                        } else {
                            if (f.keyCode == 27) {
                                if (d.isOpened()) {
                                    d.hideCalendar();
                                    d.dateTimeInput.focus();
                                    return false
                                }
                                return true
                            }
                        }
                    }
                    if (f.keyCode == 115) {
                        if (d.isOpened()) {
                            d.hideCalendar();
                            d.dateTimeInput.focus();
                            return false
                        } else {
                            if (!d.isOpened()) {
                                d.showCalendar();
                                d.dateTimeInput.focus();
                                return false
                            }
                        }
                    }
                    if (f.altKey) {
                        if (f.keyCode == 38) {
                            if (d.isOpened()) {
                                d.hideCalendar();
                                d.dateTimeInput.focus();
                                return false
                            }
                        } else {
                            if (f.keyCode == 40) {
                                if (!d.isOpened()) {
                                    d.showCalendar();
                                    d.dateTimeInput.focus();
                                    return false
                                }
                            }
                        }
                    }
                });
                this.addHandler(this.calendarContainer, "cellSelected",
                function (g) {
                    if (d.closeCalendarAfterSelection) {
                        var f = a.data(document.body, "openedJQXCalendarValue");
                        if (g.args.selectionType == "mouse") {
                            if (d.selectionMode != "range") {
                                d.hideCalendar("selected")
                            } else {
                                if (d._calendar._clicks == 0) {
                                    d.hideCalendar("selected")
                                }
                            }
                        }
                    }
                });
                this.addHandler(this.calendarContainer, "cellMouseDown",
                function (f) {
                    if (d.closeCalendarAfterSelection) {
                        if (d._calendar.value) {
                            a.data(document.body, "openedJQXCalendarValue", new a.jqx._jqxDateTimeInput.getDateTime(d._calendar.value.dateTime))
                        }
                    }
                })
            }
            this.addHandler(this.dateTimeInput, "blur",
            function (f) {
                if (d.value != null) {
                    d.isEditing = false;
                    d._validateValue();
                    d._updateText();
                    d._raiseEvent(9, f)
                }
                d.inputElement.removeClass(d.toThemeProperty("jqx-fill-state-focus"))
            });
            this.addHandler(this.host, "focus",
            function (f) {
                d.focus()
            });
            this.addHandler(this.dateTimeInput, "focus",
            function (g) {
                if (d.value != null) {
                    if (d.selectionMode != "range") {
                        d._oldDT = new Date(d.value.dateTime)
                    } else {
                        d._oldDT = d.getRange()
                    }
                    var f = d._selection();
                    d.isEditing = true;
                    d._validateValue();
                    d._updateText();
                    d._setSelectionStart(0);
                    d._selectGroup(-1);
                    d.inputElement.addClass(d.toThemeProperty("jqx-fill-state-focus"))
                } else {
                    d._setSelectionStart(0);
                    d._selectGroup(-1);
                    d.inputElement.addClass(d.toThemeProperty("jqx-fill-state-focus"))
                }
                if (g.preventDefault) {
                    g.preventDefault();
                    return false
                }
            });
            var b = "mousedown";
            if (this.touch) {
                b = a.jqx.mobile.getTouchEventName("touchstart")
            }
            this.addHandler(this.calendarButton, b,
            function (g) {
                var h = d.container;
                var f = h.css("display") == "block";
                if (!d.disabled) {
                    if (!d.isanimating) {
                        if (f) {
                            d.hideCalendar();
                            return false
                        } else {
                            d.showCalendar();
                            g.preventDefault()
                        }
                    }
                }
            });
            this.addHandler(this.dateTimeInput, "mousedown",
            function (f) {
                return d._raiseEvent(2, f)
            });
            this.addHandler(this.dateTimeInput, "mouseup",
            function (f) {
                return d._raiseEvent(3, f)
            });
            this.addHandler(this.dateTimeInput, "keydown",
            function (f) {
                return d._raiseEvent(4, f)
            });
            this.addHandler(this.dateTimeInput, "keyup",
            function (f) {
                return d._raiseEvent(5, f)
            });
            this.addHandler(this.dateTimeInput, "keypress",
            function (f) {
                return d._raiseEvent(6, f)
            })
        },
        createID: function () {
            var b = Math.random() + "";
            b = b.replace(".", "");
            b = "99" + b;
            b = b / 1;
            return "dateTimeInput" + b
        },
        setMaxDate: function (b, c) {
            if (b == null) {
                return
            }
            if (b != null && typeof (b) == "string") {
                b = new Date(b);
                if (b == "Invalid Date") {
                    return
                }
            }
            this.maxDate = a.jqx._jqxDateTimeInput.getDateTime(b);
            if (this._calendar != null) {
                this._calendar.setMaxDate(b)
            }
            if (c != false) {
                if (this.getDate() > b) {
                    this.setDate(b)
                }
                a.jqx.aria(this, "aria-valuemax", b);
                this._refreshValue();
                this._updateText()
            }
        },
        getMaxDate: function () {
            if (this.maxDate != null && this.maxDate != undefined) {
                return this.maxDate.dateTime
            }
            return null
        },
        setMinDate: function (b, c) {
            if (b == null) {
                return
            }
            if (b != null && typeof (b) == "string") {
                b = new Date(b);
                if (b == "Invalid Date") {
                    return
                }
            }
            this.minDate = a.jqx._jqxDateTimeInput.getDateTime(b);
            if (this._calendar != null) {
                this._calendar.setMinDate(b)
            }
            if (c != false) {
                if (this.getDate() < b) {
                    this.setDate(b)
                }
                a.jqx.aria(this, "aria-valuemin", b);
                this._refreshValue();
                this._updateText()
            }
        },
        getMinDate: function () {
            if (this.minDate != null && this.minDate != undefined) {
                return this.minDate.dateTime
            }
            return null
        },
        _applyCulture: function () {
            var d = false;
            try {
                if (Globalize != undefined) {
                    d = true
                }
            } catch (c) { }
            try {
                if (a.global) {
                    a.global.preferCulture(this.culture);
                    this.localization.calendar = a.global.culture.calendar
                } else {
                    if (d) {
                        var b = Globalize.culture(this.culture);
                        this.localization.calendar = b.calendar
                    }
                }
                this._loadItems();
                if (this._calendar != null) {
                    this._calendar.culture = this.culture;
                    this._calendar.localization = this.localization;
                    this._calendar.render()
                }
            } catch (c) { }
        },
        propertyMap: function (b) {
            if (b == "value") {
                if (this.selectionMode != "range") {
                    return this.getDate()
                } else {
                    return this.getRange()
                }
            }
            return null
        },
        propertyChangedHandler: function (c, d, f, e) {
            if (c.isInitialized == undefined || c.isInitialized == false) {
                return
            }
            if (d == "popupZIndex") {
                c.calendarContainer.css({
                    zIndex: e
                })
            }
            if (d == "selectionMode") {
                c._calendar.selectionMode = e;
                c.refreshValue()
            }
            if (d == "min") {
                if (typeof (e) == "string") {
                    c.setMinDate(new Date(e))
                } else {
                    c.setMinDate(e)
                }
            }
            if (d == "max") {
                if (typeof (e) == "string") {
                    c.setMaxDate(new Date(e))
                } else {
                    c.setMaxDate(e)
                }
            }
            if (d == "value") {
                if (e != null && e instanceof Date) {
                    if (isNaN(e.getFullYear()) || isNaN(e.getMonth()) || isNaN(e.getDate())) {
                        this.value = f;
                        return
                    }
                    e = a.jqx._jqxDateTimeInput.getDateTime(e)
                } else {
                    if (e != null && typeof (e) == "string") {
                        var b = new Date(e);
                        if (b != undefined && !isNaN(b)) {
                            this.value = a.jqx._jqxDateTimeInput.getDateTime(b)
                        }
                    }
                }
            }
            if (d == "showFooter") {
                c.calendarContainer.jqxCalendar({
                    showFooter: e
                })
            }
            if (d == "rtl") {
                c.calendarContainer.jqxCalendar({
                    rtl: e
                });
                if (e) {
                    c.dateTimeInput.css("direction", "rtl");
                    c.dateTimeInput.addClass("jqx-rtl");
                    c.inputElement.css("float", "right");
                    c.calendarElement.css("float", "left")
                } else {
                    c.dateTimeInput.css("direction", "ltr");
                    c.dateTimeInput.removeClass("jqx-rtl");
                    c.inputElement.css("float", "left");
                    c.calendarElement.css("float", "right")
                }
            }
            if (d == "todayString" || d == "clearString") {
                c.calendarContainer.jqxCalendar({
                    clearString: c.clearString,
                    todayString: c.todayString
                })
            }
            if (d == "dayNameFormat") {
                c.calendarContainer.jqxCalendar({
                    dayNameFormat: e
                })
            }
            if (d == "firstDayOfWeek") {
                c.calendarContainer.jqxCalendar({
                    firstDayOfWeek: e
                })
            }
            if (d == "showWeekNumbers") {
                c.calendarContainer.jqxCalendar({
                    showWeekNumbers: e
                })
            }
            if (d == "culture" || d == "localization") {
                c._applyCulture()
            } else {
                if (d == "formatString") {
                    c._loadItems()
                }
            }
            if (d == "theme") {
                if (c.dateTimeInput) {
                    c.host.removeClass();
                    c.host.addClass(c.toThemeProperty("jqx-widget"));
                    c.dateTimeInput.removeClass();
                    c.dateTimeInput.addClass(c.toThemeProperty("jqx-input-content"));
                    c.dateTimeInput.addClass(c.toThemeProperty("jqx-widget-content"));
                    c.inputElement.removeClass();
                    c.inputElement.addClass(c.toThemeProperty("jqx-input"));
                    c.inputElement.addClass(c.toThemeProperty("jqx-widget-content"));
                    c.inputElement.addClass(c.toThemeProperty("jqx-rc-all"));
                    c.calendarButtonContent.removeClass();
                    c.calendarButtonContent.addClass(c.toThemeProperty("jqx-input-button-content"));
                    c.calendarButtonContent.addClass(c.toThemeProperty("jqx-widget-content"));
                    c.calendarButtonHeader.removeClass();
                    c.calendarButtonHeader.addClass(c.toThemeProperty("jqx-input-button-header"));
                    c.calendarButtonHeader.addClass(c.toThemeProperty("jqx-widget-header"));
                    c.calendarButtonInnerHeader.removeClass();
                    c.calendarButtonInnerHeader.addClass(c.toThemeProperty("jqx-input-button-innerHeader"));
                    c.calendarContainer.jqxCalendar({
                        theme: e
                    })
                }
            }
            if (d == "width" || d == "height") {
                c.refresh();
                return
            }
            c._setOption(d, e);
            if (d == "dropDownWidth" || d == "dropDownHeight") {
                c.calendarContainer.jqxCalendar({
                    width: c.dropDownWidth,
                    height: c.dropDownHeight
                });
                c._calendar.render();
                c.container.height(c.calendarContainer.height());
                c.container.width(c.calendarContainer.width())
            }
        },
        clear: function () {
            if (this.allowNullDate) {
                if (this.selectionMode != "range") {
                    this.setDate(null)
                } else {
                    this._calendar._clicks = 1;
                    this.setRange(null, null)
                }
                this._calendar._clicks = 0
            } else {
                if (this.selectionMode != "range") {
                    this.setDate(me.getMinDate())
                } else {
                    this._calendar._clicks = 1;
                    this.setRange(me.getMinDate(), me.getMinDate());
                    this._calendar._clicks = 0
                }
            }
            this.hideCalendar()
        },
        today: function () {
            var b = new Date();
            b.setHours(0, 0, 0, 0);
            if (this.selectionMode != "range") {
                this.setDate(b)
            } else {
                this._calendar._clicks = 1;
                this.setRange(b, b);
                this._calendar._clicks = 0
            }
            this.hideCalendar()
        },
        setDate: function (b) {
            if (b != null && typeof (b) == "string") {
                b = new Date(b);
                if (b == "Invalid Date") {
                    return
                }
            }
            if (b == null || b == "null" || b == "undefined") {
                if (!this.allowNullDate) {
                    b = this.min
                }
            }
            if (b == "Invalid Date") {
                b = null
            }
            if (b == null || b == "null" || b == "undefined") {
                if (this.value != null) {
                    this.value = null;
                    this._calendar.setDate(null);
                    this._refreshValue();
                    if (this.cookies) {
                        if (this.value != null) {
                            a.jqx.cookie.cookie("jqxDateTimeInput" + this.element.id, this.value.dateTime.toString(), this.cookieoptions)
                        }
                    }
                    this._setSelectionStart(0);
                    this._selectGroup(-1);
                    this._raiseEvent("0", b);
                    this._raiseEvent("9", b)
                }
                return
            }
            if (b < this.getMinDate() || b > this.getMaxDate()) {
                return
            }
            if (this.value == null) {
                this.value = new a.jqx._jqxDateTimeInput.getDateTime(new Date());
                this.value._setHours(0);
                this.value._setMinutes(0);
                this.value._setSeconds(0);
                this.value._setMilliseconds(0)
            }
            if (b.getFullYear) {
                this.value._setYear(b.getFullYear());
                this.value._setDay(1);
                this.value._setMonth(b.getMonth() + 1);
                this.value._setHours(b.getHours());
                this.value._setMinutes(b.getMinutes());
                this.value._setSeconds(b.getSeconds());
                this.value._setMilliseconds(b.getMilliseconds());
                this.value._setDay(b.getDate())
            }
            this._refreshValue();
            if (this.cookies) {
                if (this.value != null) {
                    a.jqx.cookie.cookie("jqxDateTimeInput" + this.element.id, this.value.dateTime.toString(), this.cookieoptions)
                }
            }
            this._raiseEvent("0", b);
            this._raiseEvent("9", b)
        },
        getDate: function () {
            if (this.value == undefined) {
                return null
            }
            return new Date(this.value.dateTime)
        },
        getText: function () {
            return this.dateTimeInput.val()
        },
        setRange: function (d, c) {
            if (d == "Invalid Date") {
                d = null
            }
            if (c == "Invalid Date") {
                c = null
            }
            if (d != null && typeof (d) == "string") {
                d = new Date(d);
                if (d == "Invalid Date") {
                    return
                }
            }
            if (c != null && typeof (c) == "string") {
                c = new Date(c);
                if (c == "Invalid Date") {
                    return
                }
            }
            if (d && isNaN(d) && d.toString() == "NaN" && typeof (d) != "string") {
                return
            }
            if (c && isNaN(c) && c.toString() == "NaN" && typeof (c) != "string") {
                return
            }
            this._calendar.setRange(d, c);
            var b = d;
            if (b != null && b.getFullYear) {
                if (this.value == null) {
                    this.value = new a.jqx._jqxDateTimeInput.getDateTime(new Date());
                    this.value._setHours(0);
                    this.value._setMinutes(0);
                    this.value._setSeconds(0);
                    this.value._setMilliseconds(0)
                }
                this.value._setYear(b.getFullYear());
                this.value._setMonth(b.getMonth() + 1);
                this.value._setHours(b.getHours());
                this.value._setMinutes(b.getMinutes());
                this.value._setSeconds(b.getSeconds());
                this.value._setMilliseconds(b.getMilliseconds());
                this.value._setDay(b.getDate())
            }
            this._refreshValue();
            if (this.value) {
                this._raiseEvent("0", this.value.dateTime)
            } else {
                this._raiseEvent("0", null)
            }
        },
        getRange: function () {
            return this._calendar.getRange()
        },
        _validateValue: function () {
            var b = false;
            for (var d = 0; d < this.items.length; d++) {
                var c = this.editors[d].value;
                switch (this.items[d].type) {
                    case "FORMAT_AMPM":
                        if (c < 0) {
                            c = 0
                        } else {
                            if (c > 1) {
                                c = 1
                            }
                        }
                        break;
                    case "Character":
                        break;
                    case "Day":
                        if (c < 1) {
                            c = 1
                        } else {
                            if (c > 31) {
                                c = 31
                            }
                        }
                        break;
                    case "FORMAT_hh":
                        if (c < 1) {
                            c = 1
                        } else {
                            if (c > 12) {
                                c = 12
                            }
                        }
                        break;
                    case "FORMAT_HH":
                        if (c < 0) {
                            c = 0
                        } else {
                            if (c > 23) {
                                c = 23
                            }
                        }
                        break;
                    case "Millisecond":
                        if (c < 0) {
                            c = 0
                        } else {
                            if (c > 99) {
                                c = 99
                            }
                        }
                        break;
                    case "Minute":
                        if (c < 0) {
                            c = 0
                        } else {
                            if (c > 59) {
                                c = 59
                            }
                        }
                        break;
                    case "Month":
                        if (c < 1) {
                            c = 1
                        } else {
                            if (c > 12) {
                                c = 12
                            }
                        }
                        break;
                    case "ReadOnly":
                        break;
                    case "Second":
                        if (c < 0) {
                            c = 0
                        } else {
                            if (c > 59) {
                                c = 59
                            }
                        }
                        break;
                    case "Year":
                        if (c < this.minDate.year) {
                            c = this.minDate.year
                        } else {
                            if (c > this.maxDate.year) {
                                c = this.maxDate.year
                            }
                        }
                        break
                }
                if (this.editors[d].value != c) {
                    this.editors[d].value = c;
                    b = true
                }
            }
            this.updateValue();
            if (this.value != null) {
                if (this.value.dateTime > this.maxDate.dateTime) {
                    this._internalSetValue(this.maxDate);
                    this._updateEditorsValue()
                } else {
                    if (this.value.dateTime < this.minDate.dateTime) {
                        this._internalSetValue(this.minDate);
                        this._updateEditorsValue()
                    }
                }
            }
        },
        spinUp: function () {
            var d = this.value;
            if (d == null) {
                return
            }
            if (this.activeEditor != null) {
                var b = this.editors.indexOf(this.activeEditor);
                if (b == -1) {
                    return
                }
                if (this.items[b].type == "Day") {
                    if (this.value != null) {
                        this.activeEditor.maxValue = this.value._daysInMonth(this.value.year, this.value.month)
                    }
                }
                var c = this.activeEditor.positions;
                this.activeEditor.increaseValue(this.enableAbsoluteSelection);
                this.activeEditor.positions = c
            }
            if (this.isEditing) {
                this.isEditing = false
            }
            this.updateValue();
            this.isEditing = true;
            this._updateText();
            var e = this.editors.indexOf(this.activeEditor);
            if (e >= 0) {
                this._selectGroup(e)
            }
        },
        spinDown: function () {
            var d = this.value;
            if (d == null) {
                return
            }
            if (this.activeEditor != null) {
                var b = this.editors.indexOf(this.activeEditor);
                if (b == -1) {
                    return
                }
                if (this.items[b].type == "Day") {
                    if (this.value != null) {
                        this.activeEditor.maxValue = this.value._daysInMonth(this.value.year, this.value.month)
                    }
                }
                var c = this.activeEditor.positions;
                this.activeEditor.decreaseValue(this.enableAbsoluteSelection);
                this.activeEditor.positions = c
            }
            if (this.isEditing) {
                this.isEditing = false
            }
            this.updateValue();
            this.isEditing = true;
            this._updateText();
            var e = this.editors.indexOf(this.activeEditor);
            if (e >= 0) {
                this._selectGroup(e)
            }
        },
        _passKeyToCalendar: function (c) {
            if (c.keyCode == 13 || c.keyCode == 9) {
                this.hideCalendar("selected");
                return true
            } else {
                if (c.keyCode == 27) {
                    var e = this.calendarContainer;
                    var d = this._calendar;
                    var f = this.closeCalendarAfterSelection;
                    this.closeCalendarAfterSelection = false;
                    d.setDate(this.value.dateTime);
                    this.closeCalendarAfterSelection = f;
                    this.hideCalendar()
                }
            }
            var f = this.closeCalendarAfterSelection;
            this.closeCalendarAfterSelection = false;
            var b = this._calendar._handleKey(c);
            this.closeCalendarAfterSelection = f;
            return b
        },
        handleCalendarKey: function (f, e) {
            var c = a(f.target);
            var d = a.data(document.body, "openedJQXCalendar" + this.id);
            if (d != null) {
                if (d.length > 0) {
                    var b = e._passKeyToCalendar(f);
                    return b
                }
            }
            return true
        },
        _findPos: function (c) {
            if (c == null) {
                return
            }
            while (c && (c.type == "hidden" || c.nodeType != 1 || a.expr.filters.hidden(c))) {
                c = c.nextSibling
            }
            var b = a(c).coord(true);
            return [b.left, b.top]
        },
        testOffset: function (h, f, c) {
            var g = h.outerWidth();
            var k = h.outerHeight();
            var j = a(window).width() + a(window).scrollLeft();
            var e = a(window).height() + a(window).scrollTop();
            if (f.left + g > j) {
                if (g > this.host.width()) {
                    var d = this.host.coord().left;
                    var b = g - this.host.width();
                    f.left = d - b + 2
                }
            }
            if (f.left < 0) {
                f.left = parseInt(this.host.coord().left) + "px"
            }
            f.top -= Math.min(f.top, (f.top + k > e && e > k) ? Math.abs(k + c + 23) : 0);
            return f
        },
        open: function () {
            this.showCalendar()
        },
        close: function (b) {
            this.hideCalendar()
        },
        _getBodyOffset: function () {
            var c = 0;
            var b = 0;
            if (a("body").css("border-top-width") != "0px") {
                c = parseInt(a("body").css("border-top-width"));
                if (isNaN(c)) {
                    c = 0
                }
            }
            if (a("body").css("border-left-width") != "0px") {
                b = parseInt(a("body").css("border-left-width"));
                if (isNaN(b)) {
                    b = 0
                }
            }
            return {
                left: b,
                top: c
            }
        },
        showCalendar: function () {
            var m = this.calendarContainer;
            var q = this._calendar;
            a.jqx.aria(this, "aria-expanded", true);
            if (this.value != null) {
                if (this.selectionMode != "range") {
                    this._oldDT = new Date(this.value.dateTime)
                } else {
                    this._oldDT = this.getRange()
                }
            } else {
                this._oldDT = null
            }
            if (!q.canRender) {
                q.canRender = true;
                q.render()
            }
            var l = this.container;
            var p = this;
            var e = a(window).scrollTop();
            var f = a(window).scrollLeft();
            var n = parseInt(this._findPos(this.inputElement[0])[1]) + parseInt(this.inputElement.outerHeight()) - 1 + "px";
            var d, r = parseInt(Math.round(this.host.coord(true).left));
            d = r + "px";
            var u = a.jqx.mobile.isSafariMobileBrowser() || a.jqx.mobile.isWindowsPhone();
            var h = a.jqx.utilities.hasTransform(this.host);
            if (h || (u != null && u)) {
                d = a.jqx.mobile.getLeftPos(this.element);
                n = a.jqx.mobile.getTopPos(this.element) + parseInt(this.host.outerHeight());
                if (a("body").css("border-top-width") != "0px") {
                    n = parseInt(n) - this._getBodyOffset().top + "px"
                }
                if (a("body").css("border-left-width") != "0px") {
                    d = parseInt(d) - this._getBodyOffset().left + "px"
                }
            }
            this.container.css("left", d);
            this.container.css("top", n);
            var c = this.closeCalendarAfterSelection;
            this.closeCalendarAfterSelection = false;
            this.isEditing = false;
            if (p.selectionMode == "default") {
                this._validateValue();
                this._updateText();
                var s = this.value != null ? this.value.dateTime : new Date();
                q.setDate(s)
            }
            this.closeCalendarAfterSelection = c;
            var b = false;
            if (this.dropDownHorizontalAlignment == "right" || this.rtl) {
                var k = this.container.outerWidth();
                var t = Math.abs(k - this.host.outerWidth() + 2);
                if (!this.rtl) {
                    t -= 2
                }
                if (k > this.host.width()) {
                    var g = this.rtl ? 23 : 2;
                    this.container.css("left", g + parseInt(Math.round(r)) - t + "px")
                } else {
                    this.container.css("left", 25 + parseInt(Math.round(r)) + t + "px")
                }
            }
            if (this.enableBrowserBoundsDetection) {
                var j = this.testOffset(m, {
                    left: parseInt(this.container.css("left")),
                    top: parseInt(n)
                },
                parseInt(this.host.outerHeight()));
                if (parseInt(this.container.css("top")) != j.top) {
                    b = true;
                    m.css("top", 23)
                } else {
                    m.css("top", 0)
                }
                this.container.css("top", j.top);
                if (parseInt(this.container.css("left")) != j.left) {
                    this.container.css("left", j.left)
                }
            }
            this._raiseEvent(7, m);
            if (this.animationType != "none") {
                this.container.css("display", "block");
                var o = parseInt(m.outerHeight());
                m.stop();
                this.isanimating = true;
                this.opening = true;
                if (this.animationType == "fade") {
                    m.css("margin-top", 0);
                    m.css("opacity", 0);
                    m.animate({
                        opacity: 1
                    },
                    this.openDelay,
                    function () {
                        p.isanimating = false;
                        p.opening = false;
                        a.data(document.body, "openedJQXCalendar" + p.id, m);
                        p.calendarContainer.focus()
                    })
                } else {
                    m.css("opacity", 1);
                    if (b) {
                        m.css("margin-top", o)
                    } else {
                        m.css("margin-top", -o)
                    }
                    m.animate({
                        "margin-top": 0
                    },
                    this.openDelay,
                    function () {
                        p.isanimating = false;
                        p.opening = false;
                        a.data(document.body, "openedJQXCalendar" + p.id, m);
                        p.calendarContainer.focus()
                    })
                }
            } else {
                m.stop();
                p.isanimating = false;
                p.opening = false;
                m.css("opacity", 1);
                m.css("margin-top", 0);
                this.container.css("display", "block");
                a.data(document.body, "openedJQXCalendar" + p.id, m);
                this.calendarContainer.focus()
            }
            if (this.value == null) {
                if (this._calendar && this._calendar._getSelectedCell()) {
                    this._calendar._getSelectedCell().isSelected = false
                }
            }
        },
        hideCalendar: function (g) {
            var f = this.calendarContainer;
            var c = this.container;
            var d = this;
            a.jqx.aria(this, "aria-expanded", false);
            a.data(document.body, "openedJQXCalendar" + this.id, null);
            if (this.animationType != "none") {
                var b = f.outerHeight();
                f.css("margin-top", 0);
                this.isanimating = true;
                var e = -b;
                if (parseInt(this.container.coord().top) < parseInt(this.host.coord().top)) {
                    e = b
                }
                if (this.animationType == "fade") {
                    f.animate({
                        opacity: 0
                    },
                    this.closeDelay,
                    function () {
                        c.css("display", "none");
                        d.isanimating = false
                    })
                } else {
                    f.animate({
                        "margin-top": e
                    },
                    this.closeDelay,
                    function () {
                        c.css("display", "none");
                        d.isanimating = false
                    })
                }
            } else {
                c.css("display", "none")
            }
            if (g != undefined) {
                this._updateSelectedDate()
            }
            this._raiseEvent(8, f)
        },
        _updateSelectedDate: function () {
            var f = this.value;
            if (f == null) {
                f = new a.jqx._jqxDateTimeInput.getDateTime(new Date());
                f._setHours(0);
                f._setMinutes(0);
                f._setSeconds(0);
                f._setMilliseconds(0)
            }
            var b = f.hour;
            var g = f.minute;
            var e = f.second;
            var c = f.millisecond;
            if (this.selectionMode == "range" && this._calendar.getRange().from == null) {
                this.setDate(null);
                return
            }
            var d = new a.jqx._jqxDateTimeInput.getDateTime(this._calendar.value.dateTime);
            d._setHours(b);
            d._setMinutes(g);
            d._setSeconds(e);
            d._setMilliseconds(c);
            this.setDate(d.dateTime)
        },
        _closeOpenedCalendar: function (b) {
            var e = a(b.target);
            var k = a.data(document.body, "openedJQXCalendar" + b.data.me.id);
            var d = false;
            a.each(e.parents(),
            function () {
                if (this.className && this.className.indexOf) {
                    if (this.className.indexOf("jqx-calendar") != -1) {
                        d = true;
                        return false
                    }
                    if (this.className.indexOf("jqx-input") != -1) {
                        d = true;
                        return false
                    }
                }
            });
            if (a(b.target).ischildof(b.data.me.host)) {
                return true
            }
            if (b.target != null && (b.target.tagName == "B" || b.target.tagName == "b")) {
                var l = b.data.me.host.coord();
                var n = b.data.me.host.width();
                var c = b.data.me.host.height();
                var m = parseInt(l.top);
                var g = parseInt(l.left);
                if (m <= b.pageY && b.pageY <= m + c) {
                    if (g <= b.pageX && b.pageX <= g + n) {
                        return true
                    }
                }
            }
            if (k != null && !d) {
                if (k.length > 0) {
                    var h = k[0].id.toString();
                    var f = h.toString().substring(13);
                    var j = a(document).find("#" + f);
                    b.data.me.hideCalendar();
                    a.data(document.body, "openedJQXCalendar" + b.data.me.id, null)
                }
            }
        },
        _loadItems: function () {
            if (this.value != null) {
                this.items = new Array();
                var d = this._getFormatValue(this.formatString);
                this.items = this._parseFormatValue(d);
                this.editors = new Array();
                for (var b = 0; b < this.items.length; b++) {
                    var c = this.items[b].getDateTimeEditorByItemType(this.value, this);
                    this.editors[b] = c
                }
            }
            this._updateEditorsValue();
            this._updateText()
        },
        _updateText: function () {
            var d = "";
            if (this.items.length == 0 && this.value != null) {
                this._loadItems()
            }
            if (this.value != null) {
                if (this.items.length >= 1) {
                    d = this.format(this.value, 0, this.items.length)
                }
                var b = this.dateTimeInput.val();
                if (b != d) {
                    this._raiseEvent(1, this.value)
                }
            }
            if (this.selectionMode == "range") {
                var c = this.getRange();
                fromText = this.format(this.value, 0, this.items.length);
                if (c.to) {
                    var f = a.jqx._jqxDateTimeInput.getDateTime(c.from);
                    fromText = this.format(f, 0, this.items.length);
                    var e = a.jqx._jqxDateTimeInput.getDateTime(c.to);
                    toText = this.format(e, 0, this.items.length);
                    var d = fromText + " - " + toText;
                    if (d == " - ") {
                        d = ""
                    }
                } else {
                    d = "";
                    this.calendarButtonContent.html("<div style='line-height: 16px; background: transparent; margin: 0; border: 0; padding: 0px; text-align: center; vertical-align: middle;'><b style='border: 0; padding: 0px; margin: 0px; background: transparent;'></b></div>")
                }
            }
            this.dateTimeInput.val(d)
        },
        format: function (g, h, f) {
            var b = "";
            for (var e = h; e < f; ++e) {
                var c = this.items[e].dateParser(g, this);
                if (this.isEditing && this.items[e].type != "ReadOnly") {
                    if (this.selectionMode != "range") {
                        var d = this.items[e].type == "Day" && this.items[e].format.length > 2;
                        if (this.items[e].type == "FORMAT_AMPM") {
                            d = true;
                            if (this.editors[e].value == 0) {
                                c = this.editors[e].amString
                            } else {
                                c = this.editors[e].pmString
                            }
                        }
                        if (!d) {
                            c = this.items[e].dateParserInEditMode(new Number(this.editors[e].value), "d" + this.editors[e].maxEditPositions, this);
                            while (c.length < this.editors[e].maxEditPositions) {
                                c = "0" + c
                            }
                        }
                    }
                }
                b += c
            }
            return b
        },
        _getFormatValueGroupLength: function (b) {
            for (i = 1; i < b.toString().length; ++i) {
                if (b.substring(i, i + 1) != b.substring(0, 1)) {
                    return i
                }
            }
            return b.length
        },
        _parseFormatValue: function (h) {
            var c = new Array();
            var f = h.toString();
            var e = 0;
            while (f.length > 0) {
                var d = this._getFormatValueGroupLength(f);
                var g = null;
                switch (f.substring(0, 1)) {
                    case ":":
                    case "/":
                        d = 1;
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, 1), "ReadOnly", this.culture);
                        break;
                    case '"':
                    case "'":
                        var b = f.indexOf(f[0], 1);
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(1, 1 + Math.max(1, b - 1)), "ReadOnly", this.culture);
                        d = Math.max(1, b + 1);
                        break;
                    case "\\":
                        if (f.length >= 2) {
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(1, 1), "ReadOnly", this.culture);
                            d = 2
                        }
                        break;
                    case "d":
                    case "D":
                        if (d > 2) {
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Day", this.culture)
                        } else {
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Day", this.culture)
                        }
                        break;
                    case "f":
                    case "F":
                        if (d > 7) {
                            d = 7
                        }
                        if (d > 3) {
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "ReadOnly", this.culture)
                        } else {
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Millisecond", this.culture)
                        }
                        break;
                    case "g":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "ReadOnly", this.culture);
                        break;
                    case "h":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "FORMAT_hh", this.culture);
                        break;
                    case "H":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "FORMAT_HH", this.culture);
                        break;
                    case "m":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Minute", this.culture);
                        break;
                    case "M":
                        if (d > 4) {
                            d = 4
                        }
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Month", this.culture);
                        break;
                    case "s":
                    case "S":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Second", this.culture);
                        break;
                    case "t":
                    case "T":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "FORMAT_AMPM", this.culture);
                        break;
                    case "y":
                    case "Y":
                        if (d > 1) {
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "Year", this.culture)
                        } else {
                            d = 1;
                            g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, 1), dateTimeFormatInfo, "ReadOnly", this.culture)
                        }
                        break;
                    case "z":
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, d), "ReadOnly", this.culture);
                        break;
                    default:
                        d = 1;
                        g = a.jqx._jqxDateTimeInput.DateTimeFormatItem._create(f.substring(0, 1), "ReadOnly", this.culture);
                        break
                }
                c[e] = a.extend(true, {},
                g);
                f = f.substring(d);
                e++
            }
            return c
        },
        _getFormatValue: function (b) {
            if (b == null || b.length == 0) {
                b = "d"
            }
            if (b.length == 1) {
                switch (b.substring(0, 1)) {
                    case "d":
                        return this.localization.calendar.patterns.d;
                    case "D":
                        return this.localization.calendar.patterns.D;
                    case "t":
                        return this.localization.calendar.patterns.t;
                    case "T":
                        return this.localization.calendar.patterns.T;
                    case "f":
                        return this.localization.calendar.patterns.f;
                    case "F":
                        return this.localization.calendar.patterns.F;
                    case "M":
                        return this.localization.calendar.patterns.M;
                    case "Y":
                        return this.localization.calendar.patterns.Y;
                    case "S":
                        return this.localization.calendar.patterns.S
                }
            }
            if (b.length == 2 && b.substring(0, 1) == "%") {
                b = b.substring(1)
            }
            return b
        },
        _updateEditorsValue: function () {
            var j = this.value;
            if (j == null) {
                return
            }
            var g = j.year;
            var h = j.day;
            var d = j.hour;
            var l = j.millisecond;
            var b = j.second;
            var c = j.minute;
            var f = j.month;
            if (this.items == null) {
                return
            }
            for (var e = 0; e < this.items.length; e++) {
                switch (this.items[e].type) {
                    case "FORMAT_AMPM":
                        var k = d % 12;
                        if (k == 0) {
                            k = 12
                        }
                        if (d >= 0 && d < 12) {
                            this.editors[e].value = 0
                        } else {
                            this.editors[e].value = 1
                        }
                        break;
                    case "Day":
                        this.editors[e].value = h;
                        break;
                    case "FORMAT_hh":
                        var k = d % 12;
                        if (k == 0) {
                            k = 12
                        }
                        this.editors[e].value = k;
                        break;
                    case "FORMAT_HH":
                        this.editors[e].value = d;
                        break;
                    case "Millisecond":
                        this.editors[e].value = l;
                        break;
                    case "Minute":
                        this.editors[e].value = c;
                        break;
                    case "Month":
                        this.editors[e].value = f;
                        break;
                    case "Second":
                        this.editors[e].value = b;
                        break;
                    case "Year":
                        this.editors[e].value = g;
                        break
                }
            }
        },
        updateValue: function () {
            if (this.isEditing) {
                return
            }
            if (this.items && this.items.length == 0) {
                return
            }
            var j = 0;
            var n = 1;
            var u = 1;
            var g = 0;
            var b = 0;
            var C = 0;
            var p = 0;
            var B = 1;
            var e = 0;
            var h = false;
            var m = false;
            var w = false;
            var o = new Array();
            var c = null;
            var s = 0;
            for (var v = 0; v < this.items.length; v++) {
                switch (this.items[v].type) {
                    case "FORMAT_AMPM":
                        e = this.editors[v].value;
                        c = this.editors[v];
                        break;
                    case "Character":
                        break;
                    case "Day":
                        if (this.items[v].format.length < 4) {
                            u = this.editors[v].value;
                            o[s++] = this.editors[v];
                            if (u == 0) {
                                u = 1
                            }
                            w = true
                        }
                        break;
                    case "FORMAT_hh":
                        var y = this.editors[v];
                        g = y.value;
                        break;
                    case "FORMAT_HH":
                        g = this.editors[v].value;
                        break;
                    case "Millisecond":
                        b = this.editors[v].value;
                        break;
                    case "Minute":
                        p = this.editors[v].value;
                        break;
                    case "Month":
                        B = this.editors[v].value;
                        m = true;
                        if (B == 0) {
                            B = 1
                        }
                        break;
                    case "ReadOnly":
                        break;
                    case "Second":
                        C = this.editors[v].value;
                        break;
                    case "Year":
                        h = true;
                        n = this.editors[v].value;
                        var A = this.editors[v].getDateTimeItem().format;
                        if (A.length < 3) {
                            var r = "1900";
                            if (r.Length == 4) {
                                var q = "" + r[0] + r[1];
                                var x;
                                x = parseInt(q);
                                n = n + (x * 100)
                            }
                        }
                        if (n == 0) {
                            n = 1
                        }
                        break
                }
            }
            var z = this.value != null ? new Date(this.value.dateTime) : null;
            if (n > 0 && B > 0 && u > 0 && p >= 0 && g >= 0 && C >= 0 && b >= 0) {
                var D = this.value;
                if (D != null) {
                    if (!h) {
                        n = D.year
                    }
                    if (!m) {
                        B = D.month
                    }
                    if (!w) {
                        u = D.day
                    }
                }
                try {
                    if (B > 12) {
                        B = 12
                    }
                    if (B < 1) {
                        B = 1
                    }
                    if (D._daysInMonth(n, B) <= u) {
                        u = D._daysInMonth(n, B);
                        if (o != null && o.length > 0) {
                            for (v = 0; v < o.length; v++) {
                                o[v].value = u
                            }
                        }
                    }
                    if (c != null) {
                        if (c.value == 0) {
                            if (g >= 12) {
                                g -= 12
                            }
                        } else {
                            if (g + 12 < 24) {
                                g += 12
                            }
                        }
                    }
                    this.value._setYear(parseInt(n));
                    this.value._setDay(u);
                    this.value._setMonth(B);
                    this.value._setHours(g);
                    this.value._setMinutes(p);
                    this.value._setSeconds(C);
                    this.value._setMilliseconds(b)
                } catch (f) {
                    this.value = D
                }
                if (z != null) {
                    var t = this.value.dateTime.getFullYear() == z.getFullYear() && this.value.dateTime.getDate() == z.getDate() && this.value.dateTime.getMonth() == z.getMonth() && this.value.dateTime.getHours() == z.getHours() && this.value.dateTime.getMinutes() == z.getMinutes() && this.value.dateTime.getSeconds() == z.getSeconds();
                    if (!t) {
                        this._raiseEvent("0", this.value.dateTime);
                        if (this.cookies) {
                            if (this.value != null) {
                                a.jqx.cookie.cookie("jqxDateTimeInput" + this.element.id, this.value.dateTime.toString(), this.cookieoptions)
                            }
                        }
                    }
                    this.calendarButtonContent.html("<div style='line-height: 16px; background: transparent; margin: 0; border: 0; padding: 0px; text-align: center; vertical-align: middle;'><b style='border: 0; padding: 0px; margin: 0px; background: transparent;'>" + this.value.day + "</b></div>")
                } else {
                    this.calendarButtonContent.html("<div style='line-height: 16px; background: transparent; margin: 0; border: 0; padding: 0px; text-align: center; vertical-align: middle;'><b style='border: 0; padding: 0px; margin: 0px; background: transparent;'></b></div>")
                }
            }
            var d = this.editors.indexOf(this.activeEditor);
            var l = this.items[d]
        },
        _internalSetValue: function (b) {
            this.value._setYear(parseInt(b.year));
            this.value._setDay(b.day);
            this.value._setMonth(b.month);
            this.value._setHours(b.hour);
            this.value._setMinutes(b.minute);
            this.value._setSeconds(b.second);
            this.value._setMilliseconds(b.milisecond)
        },
        _raiseEvent: function (c, n) {
            var m = this.events[c];
            var f = {};
            f.owner = this;
            if (n == null) {
                n = {}
            }
            var l = n.charCode ? n.charCode : n.keyCode ? n.keyCode : 0;
            var o = true;
            var k = this.readonly;
            var b = new jQuery.Event(m);
            b.owner = this;
            b.args = f;
            b.args.date = this.getDate();
            this.element.value = this.dateTimeInput.val();
            if (c == 9 && this.selectionMode != "range") {
                var d = b.args.date;
                if (this._oldDT) {
                    if (d != null) {
                        if (!(d.getFullYear() != this._oldDT.getFullYear() || d.getMonth() != this._oldDT.getMonth() || d.getDate() != this._oldDT.getDate() || d.getHours() != this._oldDT.getHours() || d.getMinutes() != this._oldDT.getMinutes() || d.getSeconds() != this._oldDT.getSeconds())) {
                            return true
                        }
                    }
                    a.jqx.aria(this, "aria-valuenow", this.getDate());
                    a.jqx.aria(this, "aria-valuetext", this.getText());
                    if (this.getDate() != null) {
                        a.jqx.aria(this, "aria-label", "Current focused date is " + this.getDate().toLocaleString())
                    } else {
                        a.jqx.aria(this, "aria-label", "Current focused date is Null")
                    }
                }
            }
            if (this.selectionMode == "range") {
                b.args.date = this.getRange();
                if (this._oldDT) {
                    var d = b.args.date.from;
                    if (c == 9) {
                        var j = false;
                        var h = false;
                        var e = this._oldDT.from;
                        if (d != null && e) {
                            if (!(d.getFullYear() != e.getFullYear() || d.getMonth() != e.getMonth() || d.getDate() != e.getDate() || d.getHours() != e.getHours() || d.getMinutes() != e.getMinutes() || d.getSeconds() != e.getSeconds())) {
                                j = true
                            }
                        }
                        var d = b.args.date.to;
                        if (d != null) {
                            e = this._oldDT.to;
                            if (e) {
                                if (!(d.getFullYear() != e.getFullYear() || d.getMonth() != e.getMonth() || d.getDate() != e.getDate() || d.getHours() != e.getHours() || d.getMinutes() != e.getMinutes() || d.getSeconds() != e.getSeconds())) {
                                    h = true
                                }
                            }
                        }
                        if (j && h) {
                            return true
                        }
                        var j = b.args.date.from;
                        if (j == null) {
                            j = ""
                        } else {
                            j = j.toString()
                        }
                        var h = b.args.date.to;
                        if (h == null) {
                            h = ""
                        } else {
                            h = h.toString()
                        }
                        a.jqx.aria(this, "aria-valuenow", j + "-" + h);
                        a.jqx.aria(this, "aria-valuetext", this.getText());
                        if (j && h) {
                            a.jqx.aria(this, "aria-label", "Current focused range is " + j.toLocaleString() + "-" + h.toLocaleString())
                        }
                    }
                }
            }
            if (this.host.css("display") == "none") {
                return true
            }
            if (c != 2 && c != 3) {
                o = this.host.trigger(b)
            }
            var g = this;
            if (!k) {
                if (c == 2 && !this.disabled) {
                    setTimeout(function () {
                        g.isEditing = true;
                        g._selectGroup(-1)
                    },
                    25)
                }
            }
            if (c == 4) {
                if (k || this.disabled) {
                    if (l == 8 || l == 46) {
                        this.isEditing = false;
                        if (this.allowKeyboardDelete) {
                            if (this.allowNullDate) {
                                this.setDate(null)
                            } else {
                                if (this.selectionMode != "range") {
                                    this.setDate(this.getMinDate())
                                } else {
                                    this.setRange(this.getMinDate(), this.getMinDate())
                                }
                            }
                        }
                    }
                    if (l == 9) {
                        return true
                    }
                    return false
                }
                o = this._handleKeyDown(n, l)
            } else {
                if (c == 5) {
                    if (l == 9) {
                        return true
                    }
                    if (k || this.disabled) {
                        return false
                    }
                } else {
                    if (c == 6) {
                        if (l == 9) {
                            return true
                        }
                        if (k || this.disabled) {
                            return false
                        }
                        o = this._handleKeyPress(n, l)
                    }
                }
            }
            return o
        },
        _doLeftKey: function () {
            if (this.activeEditor != null) {
                if (!this.isEditing) {
                    this.isEditing = true
                }
                var b = this.activeEditor;
                var d = false;
                var e = this.editors.indexOf(this.activeEditor);
                var c = e;
                if (this.enableAbsoluteSelection) {
                    if (e >= 0 && this.activeEditor.positions > 0) {
                        this.activeEditor.positions--;
                        this._selectGroup(e);
                        return
                    }
                }
                while (e > 0) {
                    this.activeEditor = this.editors[--e];
                    this._selectGroup(e);
                    if (this.items[e].type != "ReadOnly") {
                        d = true;
                        break
                    }
                }
                if (!d) {
                    if (c >= 0) {
                        this.activeEditor = this.editors[c]
                    }
                }
                if (this.activeEditor != null && b != this.activeEditor) {
                    if (this.items[e].type != "ReadOnly") {
                        if (this.enableAbsoluteSelection) {
                            this.activeEditor.positions = this.activeEditor.maxEditPositions - 1
                        } else {
                            this.activeEditor.positions = 0
                        }
                    }
                }
                if (this.activeEditor != b) {
                    this._validateValue();
                    this._updateText();
                    this._selectGroup(this.editors.indexOf(this.activeEditor));
                    return true
                } else {
                    return false
                }
            }
        },
        _doRightKey: function () {
            if (this.activeEditor != null) {
                if (!this.isEditing) {
                    this.isEditing = true
                }
                var b = this.activeEditor;
                var d = false;
                var e = this.editors.indexOf(this.activeEditor);
                var c = e;
                if (this.enableAbsoluteSelection) {
                    if (e >= 0 && this.activeEditor.positions < this.activeEditor.maxEditPositions - 1) {
                        this.activeEditor.positions++;
                        this._selectGroup(e);
                        return
                    }
                }
                while (e <= this.editors.length - 2) {
                    this.activeEditor = this.editors[++e];
                    this._selectGroup(e);
                    if (this.items[e].type != "ReadOnly") {
                        if (this.items[e].type == "Day" && this.items[e].format.length > 2) {
                            break
                        }
                        d = true;
                        break
                    }
                }
                if (!d) {
                    if (c >= 0) {
                        this.activeEditor = this.editors[c]
                    }
                }
                if (this.activeEditor != null && this.activeEditor != b) {
                    if (this.items[e].type != "ReadOnly") {
                        this.activeEditor.positions = 0
                    }
                }
                if (this.activeEditor != b) {
                    this._validateValue();
                    this._updateText();
                    this._selectGroup(this.editors.indexOf(this.activeEditor));
                    return true
                } else {
                    return false
                }
            }
        },
        _saveSelectedText: function () {
            var b = this._selection();
            var d = "";
            var c = this.dateTimeInput.val();
            if (b.start > 0 || b.length > 0) {
                for (i = b.start; i < b.end; i++) {
                    d += c[i]
                }
            }
            window.clipboardData.setData("Text", d);
            return d
        },
        _selectWithAdvancePattern: function () {
            var f = this.editors.indexOf(this.activeEditor);
            var g = false;
            if (this.items[f].type != "ReadOnly") {
                g = true
            }
            if (!g) {
                return
            }
            var d = this.activeEditor;
            if (d != null) {
                var e = d.positions == d.maxEditPositions;
                if (e) {
                    this.editorText = "";
                    var c = d.value;
                    var b = false;
                    switch (this.items[f].type) {
                        case "FORMAT_AMPM":
                            if (c < 0) {
                                c = 0
                            } else {
                                if (c > 1) {
                                    c = 1
                                }
                            }
                            break;
                        case "Character":
                            break;
                        case "Day":
                            if (c < 1) {
                                c = 1
                            } else {
                                if (c > 31) {
                                    c = 31
                                }
                            }
                            break;
                        case "FORMAT_hh":
                            if (c < 1) {
                                c = 1
                            } else {
                                if (c > 12) {
                                    c = 12
                                }
                            }
                            break;
                        case "FORMAT_HH":
                            if (c < 0) {
                                c = 0
                            } else {
                                if (c > 23) {
                                    c = 23
                                }
                            }
                            break;
                        case "Millisecond":
                            if (c < 0) {
                                c = 0
                            } else {
                                if (c > 99) {
                                    c = 99
                                }
                            }
                            break;
                        case "Minute":
                            if (c < 0) {
                                c = 0
                            } else {
                                if (c > 59) {
                                    c = 59
                                }
                            }
                            break;
                        case "Month":
                            if (c < 1) {
                                c = 1
                            } else {
                                if (c > 12) {
                                    c = 12
                                }
                            }
                            break;
                        case "ReadOnly":
                            break;
                        case "Second":
                            if (c < 0) {
                                c = 0
                            } else {
                                if (c > 59) {
                                    c = 59
                                }
                            }
                            break;
                        case "Year":
                            if (c < this.minDate.year) {
                                c = this.minDate.year
                            } else {
                                if (c > this.maxDate.year) {
                                    c = this.maxDate.year
                                }
                            }
                            break
                    }
                    if (d.value != c) {
                        b = true
                    }
                    if (!b) {
                        this.isEditing = false;
                        this._validateValue();
                        this._updateText();
                        this.isEditing = true;
                        this._doRightKey();
                        return true
                    }
                    return false
                }
            }
        },
        _handleKeyPress: function (j, n) {
            var m = this._selection();
            var b = this;
            if ((j.ctrlKey && n == 97) || (j.ctrlKey && n == 65)) {
                return true
            }
            if (n == 8) {
                if (m.start > 0) {
                    b._setSelectionStart(m.start)
                }
                return false
            }
            if (n == 46) {
                if (m.start < this.items.length) {
                    b._setSelectionStart(m.start)
                }
                return false
            }
            if (m.start >= 0) {
                var d = String.fromCharCode(n);
                var k = parseInt(d);
                if (!isNaN(k)) {
                    if (this.container.css("display") == "block") {
                        this.hideCalendar()
                    }
                    this.updateValue();
                    this._updateText();
                    var g = false;
                    var h = this.editors.indexOf(this.activeEditor);
                    var c = null;
                    this.isEditing = true;
                    if (h.type != "ReadOnly") {
                        c = this.activeEditor
                    }
                    if (c != null && c.positions == 0) {
                        this.editorText = ""
                    }
                    if (this.activeEditor == null) {
                        this.activeEditor = this.editors[0]
                    }
                    if (this.activeEditor == null) {
                        return false
                    }
                    this.activeEditor.insert(d);
                    if (c != null && this.editorText.length >= c.maxEditPositions) {
                        this.editorText = ""
                    }
                    this.editorText += d;
                    var o = this._selectWithAdvancePattern();
                    if (this.activeEditor.positions == this.activeEditor.maxEditPositions) {
                        var f = this._getLastEditableEditorIndex();
                        if (this.editors.indexOf(this.activeEditor) == f && o && this.enableAbsoluteSelection) {
                            this.activeEditor.positions = this.activeEditor.maxEditPositions - 1
                        } else {
                            this.activeEditor.positions = 0
                        }
                    }
                    g = true;
                    this.updateValue();
                    this._updateText();
                    this._selectGroup(this.editors.indexOf(this.activeEditor));
                    return false
                }
            }
            var l = this._isSpecialKey(n);
            return l
        },
        _getLastEditableEditorIndex: function () {
            var b = 0;
            var c = this;
            for (itemIndex = this.items.length - 1; itemIndex >= 0; itemIndex--) {
                if (this.items[itemIndex].type != "ReadOnly") {
                    return itemIndex
                }
            }
            return -1
        },
        _handleKeyDown: function (j, c) {
            if (j.keyCode == 115) {
                if (this.isOpened()) {
                    this.hideCalendar();
                    return false
                } else {
                    if (!this.isOpened()) {
                        this.showCalendar();
                        return false
                    }
                }
            }
            if (j.altKey) {
                if (j.keyCode == 38) {
                    if (this.isOpened()) {
                        this.hideCalendar();
                        return false
                    }
                } else {
                    if (j.keyCode == 40) {
                        if (!this.isOpened()) {
                            this.showCalendar();
                            return false
                        }
                    }
                }
            }
            if (this.isOpened()) {
                if (j.keyCode == 9) {
                    this.hideCalendar("selected");
                    return true
                }
                return
            }
            var g = this._selection();
            if ((j.ctrlKey && c == 99) || (j.ctrlKey && c == 67)) {
                this._saveSelectedText(j);
                return false
            }
            if ((j.ctrlKey && c == 122) || (j.ctrlKey && c == 90)) {
                return false
            }
            if ((j.ctrlKey && c == 118) || (j.ctrlKey && c == 86) || (j.shiftKey && c == 45)) {
                return false
            }
            if (c == 8 || c == 46) {
                if (!j.altKey && !j.ctrlKey && c == 46) {
                    this.isEditing = false;
                    if (this.allowKeyboardDelete) {
                        if (this.allowNullDate) {
                            this.setDate(null)
                        } else {
                            if (this.selectionMode != "range") {
                                this.setDate(this.getMinDate())
                            } else {
                                this.setRange(this.getMinDate(), this.getMinDate())
                            }
                        }
                    }
                } else {
                    if (this.activeEditor != null) {
                        var k = this.editors.indexOf(this.activeEditor);
                        if (this.activeEditor.positions >= 0) {
                            var f = this._format(Number(this.activeEditor.value), "d" + this.activeEditor.maxEditPositions, this.culture);
                            tmp = f;
                            tmp = tmp.substring(0, this.activeEditor.positions) + "0" + tmp.substring(this.activeEditor.positions + 1);
                            if (parseInt(tmp) < this.activeEditor.minValue) {
                                tmp = this._format(Number(this.activeEditor.minValue), "d" + this.activeEditor.maxEditPositions, this.culture)
                            }
                            if (this.enableAbsoluteSelection) {
                                this.activeEditor.value = tmp
                            } else {
                                this.activeEditor.value = this.activeEditor.minValue
                            }
                            this._validateValue();
                            this._updateText();
                            if (c == 8) {
                                var d = this;
                                if (this.enableAbsoluteSelection && this.activeEditor.positions > 0) {
                                    setTimeout(function () {
                                        d.activeEditor.positions = d.activeEditor.positions - 1;
                                        d._selectGroup(k)
                                    },
                                    10)
                                } else {
                                    setTimeout(function () {
                                        d._doLeftKey()
                                    },
                                    10)
                                }
                            } else {
                                this._selectGroup(k)
                            }
                        } else {
                            this._doLeftKey()
                        }
                    }
                }
                return false
            }
            if (c == 38) {
                this.spinUp();
                return false
            } else {
                if (c == 40) {
                    this.spinDown();
                    return false
                }
            }
            if (c == 37) {
                if (this._editor) {
                    var b = this._doLeftKey();
                    if (!b) {
                        this.isEditing = false;
                        this._validateValue()
                    }
                    return !b
                } else {
                    this._doLeftKey();
                    return false
                }
            } else {
                if (c == 39 || c == 191) {
                    if (this._editor) {
                        var b = this._doRightKey();
                        if (!b) {
                            this.isEditing = false;
                            this._validateValue()
                        }
                        return !b
                    } else {
                        this._doRightKey();
                        return false
                    }
                }
            }
            var h = this._isSpecialKey(c);
            if (this.value == null && (c >= 48 && c <= 57 || c >= 96 && c <= 105)) {
                this.setDate(new Date())
            }
            if (!a.jqx.browser.mozilla) {
                return true
            }
            if (a.jqx.browser.mozilla && a.jqx.browser.version > 24) {
                return true
            }
            return h
        },
        _isSpecialKey: function (b) {
            if (b != 8 && b != 9 && b != 13 && b != 35 && b != 36 && b != 37 && b != 39 && b != 27 && b != 46) {
                return false
            }
            return true
        },
        _selection: function () {
            if ("selectionStart" in this.dateTimeInput[0]) {
                var f = this.dateTimeInput[0];
                var g = f.selectionEnd - f.selectionStart;
                return {
                    start: f.selectionStart,
                    end: f.selectionEnd,
                    length: g,
                    text: f.value
                }
            } else {
                var c = document.selection.createRange();
                if (c == null) {
                    return {
                        start: 0,
                        end: f.value.length,
                        length: 0
                    }
                }
                var b = this.dateTimeInput[0].createTextRange();
                var d = b.duplicate();
                b.moveToBookmark(c.getBookmark());
                d.setEndPoint("EndToStart", b);
                var g = c.text.length;
                return {
                    start: d.text.length,
                    end: d.text.length + c.text.length,
                    length: g,
                    text: c.text
                }
            }
        },
        _selectGroup: function (k) {
            if (this.host.css("display") == "none") {
                return
            }
            if (this.readonly) {
                return
            }
            var m = this._selection();
            var f = "";
            var b = "";
            var c = null;
            for (var d = 0; d < this.items.length; d++) {
                b = this.items[d].dateParser(this.value, this);
                if (this.isEditing && this.items[d].type != "ReadOnly") {
                    var j = this.items[d].type == "Day" && this.items[d].format.length > 2;
                    if (!j && this.items[d].type != "FORMAT_AMPM") {
                        b = this.items[d].dateParserInEditMode(new Number(this.editors[d].value), "d" + this.editors[d].maxEditPositions, this);
                        while (b.length < this.editors[d].maxEditPositions) {
                            b = "0" + b
                        }
                    }
                }
                f += b;
                if (this.items[d].type == "ReadOnly") {
                    continue
                }
                if (this.items[d].type == "Day" && this.items[d].format.length > 2) {
                    continue
                }
                if (k != undefined && k != -1) {
                    if (d >= k) {
                        var l = f.length - b.length;
                        var e = b.length;
                        if (this.enableAbsoluteSelection) {
                            if (!isNaN(parseInt(b)) && this.isEditing && k != -1) {
                                e = 1;
                                l += this.editors[d].positions
                            }
                        }
                        if (l == this.dateTimeInput.val().length) {
                            l--
                        }
                        this._setSelection(l, l + e);
                        c = this.editors[d];
                        this.activeEditor = c;
                        break
                    }
                } else {
                    if (f.length >= m.start) {
                        c = this.editors[d];
                        this.activeEditor = c;
                        var l = f.length - b.length;
                        var e = 1;
                        if (this.enableAbsoluteSelection) {
                            if (!isNaN(parseInt(b)) && this.isEditing && k != -1) {
                                e = 1;
                                l += this.editors[d].positions
                            }
                        } else {
                            e = b.length
                        }
                        this._setSelection(l, l + e);
                        break
                    }
                }
            }
            if (d < this.items.length && k == -1) {
                if (this.items[d].type != "ReadOnly") {
                    this.activeEditor.positions = 0
                }
            }
            var h = this._selection();
            if (h.length == 0) {
                if (h.start > 0) {
                    var g = this._getLastEditableEditorIndex();
                    if (g >= 0) {
                        this._selectGroup(g)
                    }
                }
            }
        },
        _getLastEditableEditorIndex: function () {
            var b = -1;
            for (i = 0; i < this.editors.length; i++) {
                if (this.items[i].type == "ReadOnly") {
                    continue
                }
                if (this.items[i].type == "Day" && this.items[i].format.length > 2) {
                    continue
                }
                b = i
            }
            return b
        },
        _setSelection: function (e, b) {
            try {
                if ("selectionStart" in this.dateTimeInput[0]) {
                    this.dateTimeInput[0].setSelectionRange(e, b)
                } else {
                    var c = this.dateTimeInput[0].createTextRange();
                    c.collapse(true);
                    c.moveEnd("character", b);
                    c.moveStart("character", e);
                    c.select()
                }
            } catch (d) { }
        },
        _setSelectionStart: function (b) {
            this._setSelection(b, b)
        },
        destroy: function () {
            this.host.removeClass("jqx-rc-all");
            this._calendar.destroy();
            this.container.remove();
            this._removeHandlers();
            this.dateTimeInput.remove();
            this.host.remove()
        },
        refreshValue: function () {
            this._refreshValue()
        },
        refresh: function (b) {
            if (b != true) {
                this._setSize();
                this._arrange()
            }
        },
        _setOption: function (b, c) {
            if (b === "value") {
                this.value = c;
                this._refreshValue();
                this._raiseEvent(9, {})
            }
            if (b == "maxDate") {
                this._calendar.maxDate = c;
                this._raiseEvent(9, {})
            }
            if (b == "minDate") {
                this._calendar.minDate = c;
                this._raiseEvent(9, {})
            }
            if (b == "showCalendarButton") {
                if (c) {
                    this.calendarButton.css("display", "block")
                } else {
                    this.calendarButton.css("display", "none")
                }
            }
            if (b == "disabled") {
                this.dateTimeInput.attr("disabled", c)
            }
            if (b == "readonly") {
                this.readonly = c;
                this.dateTimeInput.css("readonly", c)
            }
            if (b == "textAlign") {
                this.dateTimeInput.css("text-align", c);
                this.textAlign = c
            }
            if (b == "width") {
                this.width = c;
                this.width = parseInt(this.width);
                this._arrange()
            } else {
                if (b == "height") {
                    this.height = c;
                    this.height = parseInt(this.height);
                    this._arrange()
                }
            }
        },
        _refreshValue: function () {
            this._updateEditorsValue();
            this.updateValue();
            this._validateValue();
            this._updateText()
        }
    })
})(jQuery); (function (a) {
    a.jqx._jqxDateTimeInput.DateTimeFormatItem = {};
    a.extend(a.jqx._jqxDateTimeInput.DateTimeFormatItem, {
        _create: function (d, c, b) {
            this.format = d;
            this.type = c;
            this.culture = b;
            return this
        },
        _itemValue: function () {
            switch (this.format.length) {
                case 1:
                    return 9;
                case 2:
                    return 99;
                case 3:
                default:
                    return 999
            }
        },
        _maximumValue: function () {
            switch (this.format.length) {
                case 1:
                    return 9;
                case 2:
                    return 99;
                case 3:
                default:
                    return 999
            }
        },
        dateParser: function (b, c) {
            if (b == null) {
                return ""
            }
            var d = c._format(b.dateTime, this.format.length == 1 ? "%" + this.format : this.format, this.culture);
            return d
        },
        dateParserInEditMode: function (e, d, b) {
            if (e == null) {
                return ""
            }
            var c = b._format(e.toString(), d.length == 1 ? "%" + d : d, this.culture);
            return c
        },
        getDateTimeEditorByItemType: function (n, e) {
            switch (this.type) {
                case "FORMAT_AMPM":
                    var f = a.jqx._jqxDateTimeInput.AmPmEditor._createAmPmEditor(this.format, n.hour / 12, e.localization.calendar.AM[0], e.localization.calendar.PM[0], this, e);
                    var d = a.extend({},
                f);
                    return d;
                case "Character":
                    return null;
                case "Day":
                    var k = n.year;
                    var s = n.month;
                    var r;
                    if (this.format.length == 3) {
                        r = e.localization.calendar.days.namesAbbr
                    } else {
                        if (this.format.length > 3) {
                            r = e.localization.calendar.days.names
                        } else {
                            r = null
                        }
                    }
                    var t = n.day;
                    if (r != null) {
                        t = n.dayOfWeek + 1
                    }
                    var g = a.jqx._jqxDateTimeInput.DateEditor._createDayEditor(n, n.day, 1, n._daysInMonth(k, s), this.format.length == 1 ? 1 : 2, 2, r, this, e);
                    var d = a.extend({},
                g);
                    return d;
                case "FORMAT_hh":
                    var c = n.hour % 12;
                    if (c == 0) {
                        c = 12
                    }
                    var q = a.jqx._jqxDateTimeInput.NumberEditor._createNumberEditor(c, 1, 12, this.format.length == 1 ? 1 : 2, 2, this, e);
                    var d = a.extend({},
                q);
                    return d;
                case "FORMAT_HH":
                    var h = a.jqx._jqxDateTimeInput.NumberEditor._createNumberEditor(n.hour, 0, 23, this.format.length == 1 ? 1 : 2, 2, this, e);
                    var d = a.extend({},
                h);
                    return d;
                case "Millisecond":
                    var l = a.jqx._jqxDateTimeInput.NumberEditor._createNumberEditor(n.millisecond / this._itemValue(), 0, this._maximumValue(), this.format.length, this.format.length, this, e);
                    var d = a.extend({},
                l);
                    return d;
                case "Minute":
                    var o = a.jqx._jqxDateTimeInput.NumberEditor._createNumberEditor(n.minute, 0, 59, this.format.length == 1 ? 1 : 2, 2, this, e);
                    var d = a.extend({},
                o);
                    return d;
                case "Month":
                    var j;
                    if (this.format.length == 3) {
                        j = e.localization.calendar.months.namesAbbr
                    } else {
                        if (this.format.length > 3) {
                            j = e.localization.calendar.months.names
                        } else {
                            j = null
                        }
                    }
                    var m = a.jqx._jqxDateTimeInput.DateEditor._createMonthEditor(n.month, this.format.length == 2 ? 2 : 1, j, this, e);
                    var d = a.extend({},
                m);
                    return d;
                case "ReadOnly":
                    return a.jqx._jqxDateTimeInput.DisabledEditor._create(this.format.length, n.day, this, e);
                case "Second":
                    var b = a.jqx._jqxDateTimeInput.NumberEditor._createNumberEditor(n.second, 0, 59, this.format.length == 1 ? 1 : 2, 2, this, e);
                    var d = a.extend({},
                b);
                    return d;
                case "Year":
                    var p = a.jqx._jqxDateTimeInput.DateEditor._createYearEditor(n.year, this.format.length, this, e);
                    var d = a.extend({},
                p);
                    return d
            }
            return null
        }
    })
})(jQuery); (function (a) {
    a.jqx._jqxDateTimeInput.DateEditor = a.extend(a.jqx._jqxDateTimeInput.DateEditor, {
        formatValueLength: 0,
        handleYears: false,
        handleDays: false,
        handleMonths: false,
        positions: 0,
        value: 0,
        minEditPositions: 0,
        maxEditPositions: 0,
        minValue: 0,
        maxValue: 0,
        item: null,
        dateTimeFormatInfo: null,
        days: null,
        dateTimeMonths: null,
        lastDayInput: null,
        minPositions: function () {
            if (this.handleYears) {
                if (this.formatValueLength == 4) {
                    if (this.positions <= 1) {
                        return 1
                    } else {
                        if (this.positions >= 4) {
                            return 4
                        }
                    }
                    return this.positions
                } else {
                    return this.minEditPositions
                }
            }
            return this.minEditPositions
        },
        initializeFields: function (e, f, b, d, c) {
            this.minValue = e;
            this.maxValue = f;
            this.minEditPositions = b;
            this.maxEditPositions = d;
            this.updateActiveEditor(e);
            this.item = c
        },
        _createYearEditor: function (e, d, c, b) {
            a.jqx._jqxDateTimeInput.DateEditor = a.extend(true, {},
            this);
            this.initializeFields(d <= 4 ? 0 : 0, d < 4 ? 99 : 9999, (d == 2) ? 2 : 1, d > 3 ? 4 : 2, c);
            this.initializeYearEditor(e, d, c.culture);
            this.handleYears = true;
            this.that = b;
            return this
        },
        initializeYearEditor: function (d, c, e) {
            this.formatValueLength = c;
            this.dateTimeFormatInfo = e;
            var b = d;
            b = Math.min(b, 9999);
            b = Math.max(b, 1);
            b = this.formatValueLength < 4 ? b % 100 : b;
            this.updateActiveEditor(b);
            this.value = b
        },
        updateActiveEditor: function (b) {
            this.value = b;
            this.positions = 0
        },
        _createDayEditor: function (b, j, h, e, c, f, g, k, d) {
            a.jqx._jqxDateTimeInput.DateEditor = a.extend(true, {},
            this);
            this.initializeFields(h, e, 1, f, k);
            this.currentValue = b;
            this.value = j;
            this.days = g;
            this.handleDays = true;
            this.that = d;
            return this
        },
        getDayOfWeek: function (b) {
            if (typeof this.currentValue == a.jqx._jqxDateTimeInput.DateTime) {
                this.currentValue.dayOfWeek()
            }
            return b
        },
        defaultTextValue: function () {
            var d = this.value;
            var e = this.minEditPositions;
            var b = e;
            var c = this.that._format(this.value, "d" + b, "");
            return c
        },
        textValue: function () {
            if (this.handleDays) {
                if (this.days == null) {
                    return this.defaultTextValue()
                } else {
                    var b = (this.value % 7) + 1;
                    b = this.getDayOfWeek(b);
                    return this.days[b]
                }
            } else {
                if (this.handleMonths) {
                    if (this.dateTimeMonths == null || this.value < 1 || this.value > 12) {
                        return this.defaultTextValue()
                    } else {
                        return this.dateTimeMonths[this.value - 1]
                    }
                }
            }
            return this.defaultTextValue()
        },
        defaultInsertString: function (c) {
            if (c == null) {
                return this.deleteValue()
            }
            if (c.length == 0) {
                return this.deleteValue()
            }
            var g = c.substring(0, 1);
            if (isNaN(g)) {
                return
            }
            var e = true;
            var d;
            var b = 1;
            var f = this.that._format(Number(this.value), "d" + this.maxEditPositions, this.culture);
            d = f;
            if (this.positions >= this.maxEditPositions) {
                this.positions = 0
            }
            d = d.substring(0, this.positions) + g + d.substring(this.positions + 1);
            d = this.setValueByString(d, b);
            return true
        },
        setValueByString: function (d, b) {
            d = this.fixValueString(d);
            var c = new Number(d);
            this.value = c;
            this.positions += b;
            return d
        },
        fixValueString: function (b) {
            if (b.length > this.maxEditPositions) {
                b = b.substring(b.length - this.maxEditPositions)
            }
            return b
        },
        initializeValueString: function (c) {
            var b;
            b = "";
            if (this.hasDigits()) {
                b = c
            }
            return b
        },
        deleteValue: function () {
            if (this.value == this.minValue && this.hasDigits() == false) {
                return false
            }
            this.updateActiveEditor(this.minValue);
            return true
        },
        hasDigits: function () {
            return this.positions > 0
        },
        insert: function (b) {
            if (this.handleDays) {
                if (this.days != null) {
                    var c = false;
                    c = this.insertLongString(b, c);
                    if (c) {
                        return c
                    }
                    c = this.insertShortString(b, c);
                    if (c) {
                        return c
                    }
                }
                if (this.value == 1 && this.lastDayInput != null && this.lastDayInput.toString().length > 0 && this.lastDayInput.toString() == "0") {
                    this.value = 0
                }
                this.lastDayInput = b;
                return this.defaultInsertString(b)
            } else {
                if (this.handleMonths) {
                    if (this.dateTimeMonths != null) {
                        var c = false;
                        c = this.insertLongString2(b, c);
                        if (c) {
                            return c
                        }
                        c = this.insertShortString2(b, c);
                        if (c) {
                            return c
                        }
                    }
                }
            }
            return this.defaultInsertString(b)
        },
        insertShortString: function (d, e) {
            if (d.length == 1) {
                for (i = 0; i < 6; ++i) {
                    var c = (this.value + i) % 7 + 1;
                    var b = this.days[c - 1];
                    if (b.substring(0, 1) == d) {
                        this.updateActiveEditor(c);
                        e = true;
                        return e
                    }
                }
            }
            return e
        },
        insertLongString: function (c, d) {
            if (c.length > 0) {
                for (i = 0; i < 6; ++i) {
                    var b = (this.value + i) % 7 + 1;
                    if (this.days[b - 1] == c) {
                        this.updateActiveEditor(b);
                        d = true;
                        return d
                    }
                }
            }
            return d
        },
        _createMonthEditor: function (d, c, b, f, e) {
            a.jqx._jqxDateTimeInput.DateEditor = a.extend(true, {},
            this);
            this.initializeFields(1, 12, c, 2, f);
            this.dateTimeMonths = b;
            this.value = d;
            if (this.dateTimeMonths != null && this.dateTimeMonths[12] != null && this.dateTimeMonths[12].length > 0) {
                this.dateTimeMonths = null
            }
            this.handleMonths = true;
            this.that = e;
            return this
        },
        insertLongString2: function (b, c) {
            if (b.length > 0) {
                for (i = 0; i < 11; ++i) {
                    month = (this.value + i) % 12 + 1;
                    if (this.dateTimeMonths[month - 1] == b) {
                        this.updateActiveEditor(month);
                        c = true;
                        return c
                    }
                }
            }
            return c
        },
        insertShortString2: function (c, d) {
            if (c.length == 1) {
                for (i = 0; i < 11; ++i) {
                    var e = (this.value + i) % 12 + 1;
                    var b = this.dateTimeMonths[e - 1];
                    if (b.substring(0, 1) == c) {
                        this.updateActiveEditor(e);
                        d = true;
                        return d
                    }
                }
            }
            return d
        },
        correctMaximumValue: function (b) {
            if (b > this.maxValue) {
                b = this.minValue
            }
            return b
        },
        correctMinimumValue: function (b) {
            if (b < this.minValue) {
                b = this.maxValue
            }
            return b
        },
        increaseValue: function (e) {
            var c = this.that._format(Number(this.value), "d" + this.maxEditPositions, this.culture);
            var f = c.toString()[this.positions];
            f = parseInt(f) + 1;
            if (f > 9) {
                f = 0
            }
            if (!e) {
                var b = this.value + 1;
                b = this.correctMaximumValue(b);
                this.updateActiveEditor(b);
                return true
            }
            var d = c.substring(0, this.positions) + f + c.substring(this.positions + 1);
            if (d != this.value || this.hasDigits()) {
                this.updateActiveEditor(d);
                return true
            } else {
                return false
            }
        },
        decreaseValue: function (e) {
            var c = this.that._format(Number(this.value), "d" + this.maxEditPositions, this.culture);
            var f = c.toString()[this.positions];
            f = parseInt(f) - 1;
            if (f < 0) {
                f = 9
            }
            if (!e) {
                var b = this.value - 1;
                b = this.correctMinimumValue(b);
                this.updateActiveEditor(b);
                return true
            }
            var d = c.substring(0, this.positions) + f + c.substring(this.positions + 1);
            if (d != this.value || this.hasDigits()) {
                this.updateActiveEditor(d);
                return true
            } else {
                return false
            }
        },
        getDateTimeItem: function () {
            return this.item
        }
    })
})(jQuery); (function (a) {
    a.jqx._jqxDateTimeInput.NumberEditor = {};
    a.extend(a.jqx._jqxDateTimeInput.NumberEditor, {
        formatValueLength: 0,
        positions: 0,
        value: 0,
        minEditPositions: 0,
        maxEditPositions: 0,
        minValue: 0,
        maxValue: 0,
        item: null,
        minPositions: function () {
            if (this.handleYears) {
                if (this.formatValueLength == 4) {
                    if (this.positions <= 1) {
                        return 1
                    } else {
                        if (this.positions >= 4) {
                            return 4
                        }
                    }
                    return this.positions
                } else {
                    return this.minEditPositions
                }
            }
            return this.minEditPositions
        },
        _createNumberEditor: function (g, f, h, b, e, d, c) {
            a.jqx._jqxDateTimeInput.NumberEditor = a.extend(true, {},
            this);
            this.initializeFields(f, h, b, e, d);
            this.that = c;
            return this
        },
        initializeFields: function (e, f, b, d, c) {
            this.minValue = e;
            this.maxValue = f;
            this.minEditPositions = b;
            this.maxEditPositions = d;
            this.updateActiveEditor(e);
            this.item = c
        },
        updateActiveEditor: function (b) {
            this.value = b;
            this.positions = 0
        },
        getDayOfWeek: function (b) {
            if (typeof this.currentValue == a.jqx._jqxDateTimeInput.DateTime) {
                this.currentValue.dayOfWeek()
            }
            return b
        },
        textValue: function () {
            var d = this.value;
            var e = this.minEditPositions;
            var b = e;
            var c = this.that._format(this.value, "d" + b, "");
            return c
        },
        insert: function (c) {
            if (c == null) {
                return this.deleteValue()
            }
            if (c.length == 0) {
                return this.deleteValue()
            }
            var g = c.substring(0, 1);
            if (isNaN(g)) {
                return
            }
            var e = true;
            var d;
            var b = 1;
            var f = this.that._format(Number(this.value), "d" + this.maxEditPositions, this.culture);
            d = f;
            if (this.positions >= this.maxEditPositions) {
                this.positions = 0
            }
            d = d.substring(0, this.positions) + g + d.substring(this.positions + 1);
            d = this.setValueByString(d, b);
            return true
        },
        setValueByString: function (d, b) {
            d = this.fixValueString(d);
            var c = new Number(d);
            this.value = c;
            this.positions += b;
            return d
        },
        fixValueString: function (b) {
            if (b.length > this.maxEditPositions) {
                b = b.substring(b.length - this.maxEditPositions)
            }
            return b
        },
        initializeValueString: function (c) {
            var b;
            b = "";
            if (this.hasDigits()) {
                b = c
            }
            return b
        },
        deleteValue: function () {
            if (this.value == this.minValue && this.hasDigits() == false) {
                return false
            }
            this.updateActiveEditor(this.minValue);
            return true
        },
        hasDigits: function () {
            return this.positions > 0
        },
        correctMaximumValue: function (b) {
            if (b > this.maxValue) {
                b = this.minValue
            }
            return b
        },
        correctMinimumValue: function (b) {
            if (b < this.minValue) {
                b = this.maxValue
            }
            return b
        },
        increaseValue: function (e) {
            var c = this.that._format(Number(this.value), "d" + this.maxEditPositions, this.culture);
            var f = c.toString()[this.positions];
            f = parseInt(f) + 1;
            if (f > 9) {
                f = 0
            }
            if (!e) {
                var b = this.value + 1;
                b = this.correctMaximumValue(b);
                this.updateActiveEditor(b);
                return true
            }
            var d = c.substring(0, this.positions) + f + c.substring(this.positions + 1);
            if (d != this.value || this.hasDigits()) {
                this.updateActiveEditor(d);
                return true
            } else {
                return false
            }
        },
        decreaseValue: function (e) {
            var c = this.that._format(Number(this.value), "d" + this.maxEditPositions, this.culture);
            var f = c.toString()[this.positions];
            f = parseInt(f) - 1;
            if (f < 0) {
                f = 9
            }
            if (!e) {
                var b = this.value - 1;
                b = this.correctMinimumValue(b);
                this.updateActiveEditor(b);
                return true
            }
            var d = c.substring(0, this.positions) + f + c.substring(this.positions + 1);
            if (d != this.value || this.hasDigits()) {
                this.updateActiveEditor(d);
                return true
            } else {
                return false
            }
        },
        getDateTimeItem: function () {
            return this.item
        }
    })
})(jQuery); (function (a) {
    a.jqx._jqxDateTimeInput.DisabledEditor = {};
    a.extend(a.jqx._jqxDateTimeInput.DisabledEditor, {
        _create: function (g, c, f, b, e, d) {
            this.format = g;
            this.value = -1;
            this.item = e;
            this.that = d;
            return this
        },
        textValue: function () {
            return ""
        },
        insert: function (b) {
            return false
        },
        deleteValue: function () {
            return false
        },
        increaseValue: function () {
            return false
        },
        decreaseValue: function () {
            return false
        },
        getDateTimeItem: function () {
            return this.item
        }
    })
})(jQuery); (function (a) {
    a.jqx._jqxDateTimeInput.AmPmEditor = {};
    a.extend(a.jqx._jqxDateTimeInput.AmPmEditor, {
        _createAmPmEditor: function (g, c, f, b, e, d) {
            this.format = g;
            this.value = c;
            this.amString = f;
            this.pmString = b;
            this.item = e;
            this.that = d;
            if (f == b) {
                this.amString = "<" + f;
                this.pmString = ">" + b
            }
            return this
        },
        textValue: function () {
            var b = this.amString;
            if (this.value != 0) {
                b = this.pmString
            }
            if (this.format.length == 1 && b.length > 1) {
                b = b.substring(0, 1)
            }
            return b
        },
        insert: function (f) {
            var d = f.toString();
            if (d.Length == 0) {
                return this.deleteValue()
            }
            var c = false;
            if (this.amString.Length > 0 && this.pmString.Length > 0) {
                var g = amString[0];
                var b = d[0];
                var e = pmString[0];
                if (g.toString() == b.toString()) {
                    this.value = 0;
                    c = true
                } else {
                    if (e.toString() == b.toString()) {
                        this.value = 1;
                        c = true
                    }
                }
            } else {
                if (this.pmString.Length > 0) {
                    this.value = 1;
                    c = true
                } else {
                    if (this.amString.Length > 0) {
                        this.value = 0;
                        c = true
                    }
                }
            }
            return c
        },
        deleteValue: function () {
            var b = true;
            if (this.amString.Length == 0 && this.pmString.Length != 0) {
                if (this.value == 0) {
                    return false
                }
                this.value = 0
            } else {
                if (this.value == 1) {
                    return false
                }
                this.value = 1
            }
            return b
        },
        increaseValue: function () {
            this.value = 1 - this.value;
            return true
        },
        decreaseValue: function () {
            this.increaseValue();
            return true
        },
        getDateTimeItem: function () {
            return this.item
        }
    })
})(jQuery); (function (a) {
    a.jqx._jqxDateTimeInput.getDateTime = function (c) {
        var b = {
            dateTime: new Date(c),
            daysPer4Years: 1461,
            daysPerYear: 365,
            daysToMonth365: {
                0: 0,
                1: 31,
                2: 59,
                3: 90,
                4: 120,
                5: 151,
                6: 181,
                7: 212,
                8: 243,
                9: 273,
                10: 304,
                11: 334,
                12: 365
            },
            daysToMonth366: {
                0: 0,
                1: 31,
                2: 60,
                3: 91,
                4: 121,
                5: 152,
                6: 182,
                7: 213,
                8: 244,
                9: 274,
                10: 305,
                11: 335,
                12: 366
            },
            maxValue: 3155378976000000000,
            millisPerDay: 86400000,
            millisPerHour: 3600000,
            millisPerMinute: 60000,
            millisPerSecond: 1000,
            minTicks: 0,
            minValue: 0,
            ticksPerDay: 864000000000,
            ticksPerHour: 36000000000,
            ticksPerMillisecond: 10000,
            ticksPerMinute: 600000000,
            ticksPerSecond: 10000000,
            hour: c.getHours(),
            minute: c.getMinutes(),
            day: c.getDate(),
            second: c.getSeconds(),
            month: 1 + c.getMonth(),
            year: c.getFullYear(),
            millisecond: c.getMilliseconds(),
            dayOfWeek: c.getDay(),
            isWeekend: function (d) {
                if (d == undefined || d == null) {
                    d = this.dateTime
                }
                var e = d.getDay() % 6 == 0;
                return e
            },
            dayOfYear: function (e) {
                if (e == undefined || e == null) {
                    e = this.dateTime
                }
                var d = new Date(e.getFullYear(), 0, 1);
                return Math.ceil((e - d) / 86400000)
            },
            _setDay: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setDate(d);
                this.day = this.dateTime.getDate()
            },
            _setMonth: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setMonth(d - 1);
                this.month = 1 + this.dateTime.getMonth()
            },
            _setYear: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setFullYear(d);
                this.year = this.dateTime.getFullYear()
            },
            _setHours: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setHours(d);
                this.hour = this.dateTime.getHours()
            },
            _setMinutes: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setMinutes(d);
                this.minute = this.dateTime.getMinutes()
            },
            _setSeconds: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setSeconds(d);
                this.second = this.dateTime.getSeconds()
            },
            _setMilliseconds: function (d) {
                if (d == undefined || d == null) {
                    d = 0
                }
                this.dateTime.setMilliseconds(d);
                this.millisecond = this.dateTime.getMilliseconds()
            },
            _addDays: function (f) {
                var d = this.dateTime;
                var e = d.getDate();
                d.setDate(d.getDate() + f);
                if (e === d.getDate()) {
                    d.setHours(d.getHours() + d.getTimezoneOffset() / 60)
                }
                return d
            },
            _addWeeks: function (e) {
                var d = this.dateTime;
                d.setDate(d.getDate() + 7 * e);
                return d
            },
            _addMonths: function (e) {
                var d = this.dateTime;
                d.setMonth(d.getMonth() + e);
                return d
            },
            _addYears: function (e) {
                var d = this.dateTime;
                d.setFullYear(d.getFullYear() + e);
                return d
            },
            _addHours: function (e) {
                var d = this.dateTime;
                d.setHours(d.getHours() + e);
                return d
            },
            _addMinutes: function (e) {
                var d = this.dateTime;
                d.setMinutes(d.getMinutes() + e);
                return d
            },
            _addSeconds: function (e) {
                var d = this.dateTime;
                d.setSeconds(d.getSeconds() + e);
                return d
            },
            _addMilliseconds: function (e) {
                var d = this.dateTime;
                d.setMilliseconds(d.getMilliseconds() + e);
                return d
            },
            _isLeapYear: function (d) {
                if ((d < 1) || (d > 9999)) {
                    throw "invalid year"
                }
                if ((d % 4) != 0) {
                    return false
                }
                if ((d % 100) == 0) {
                    return ((d % 400) == 0)
                }
                return true
            },
            _dateToTicks: function (f, h, e) {
                if (((f >= 1) && (f <= 9999)) && ((h >= 1) && (h <= 12))) {
                    var d = this._isLeapYear(f) ? this.daysToMonth366 : this.daysToMonth365;
                    if ((e >= 1) && (e <= (d[h] - d[h - 1]))) {
                        var f = f - 1;
                        var g = ((((((f * 365) + (f / 4)) - (f / 100)) + (f / 400)) + d[h - 1]) + e) - 1;
                        return (g * 864000000000)
                    }
                }
            },
            _daysInMonth: function (e, f) {
                if ((f < 1) || (f > 12)) {
                    throw ("Invalid month.")
                }
                var d = this._isLeapYear(e) ? this.daysToMonth366 : this.daysToMonth365;
                return (d[f] - d[f - 1])
            },
            _timeToTicks: function (d, g, e) {
                var f = ((d * 3600) + (g * 60)) + e;
                return (f * 10000000)
            },
            _equalDate: function (d) {
                if (this.year == d.getFullYear() && this.day == d.getDate() && this.month == d.getMonth() + 1) {
                    return true
                }
                return false
            }
        };
        return b
    }
})(jQuery);