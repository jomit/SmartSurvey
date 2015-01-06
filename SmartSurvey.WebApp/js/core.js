/// <reference path="C:\Jomit\Projects\SmartSurvey\SmartSurvey\SmartSurvey.WebApp\Scripts/jquery-2.1.1.min.js" />

var SMARTSURVEY = SMARTSURVEY || {};

SMARTSURVEY.core = (function () {
    "use strict";
    var baseUrl = "http://isvupgradesurvey.azurewebsites.net/";  //Test url
    //var baseUrl = "http://localhost:50677/";
    //var hash = "A2897A8A-F4FB-47A7-B59A-B7E527707574"; //TODO implement the server hash later
    function callService(options) {
        return $.Deferred(function (defer) {
            var type = "GET";
            if (options.type) {
                type = options.type;
            }
            var data = "";
            if (options.data) {
                data = JSON.stringify(options.data);
            }

            $.ajax({
                url: baseUrl + "api/" + options.api,
                type: type,
                dataType: "json",
                data: data,
                contentType: "application/json",
                //beforeSend: function (xhr) {
                //    xhr.setRequestHeader("DeviceId", hash);
                //},
                success: function (response) {
                    if (response)
                        defer.resolve(response);
                    else
                        defer.reject("Bad Response");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var response = { serviceError: true, jqXHR: jqXHR, textStatus: textStatus, errorThrown: errorThrown };
                    defer.reject(response);
                }
            });
        }).promise();
    };

    function getQueryString(key, default_) {
        if (default_ == null) default_ = "";
        key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regex = new RegExp("[\\?&]" + key.toLowerCase() + "=([^&#]*)");
        var qs = regex.exec(window.location.href.toLowerCase());
        if (qs == null)
            return default_;
        else
            return qs[1];
    };

    return {
        callService: callService,
        getQueryString: getQueryString,
        baseUrl: baseUrl,
        //hash: hash
    }
})();

$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};