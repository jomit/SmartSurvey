/// <reference path="C:\Jomit\Projects\SmartSurvey\Main\SmartSurvey.WebApp\Scripts/knockout-3.2.0.js" />
/// <reference path="C:\Jomit\Projects\SmartSurvey\Main\SmartSurvey.WebApp\Scripts/jquery-2.1.1.min.js" />

(function (SMARTSURVEY) {
    "use strict";
    SMARTSURVEY.listSurveysService = (function () {
        var callService = SMARTSURVEY.core.callService;
        var getAllSurveys = function (urlKey) {
            return $.Deferred(function (defer) {
                callService({
                    api: "Collectors/"
                }).then(function (data) {
                    defer.resolve(data);
                }).fail(function (message) {
                    defer.reject(message);
                });
            }).promise();
        };
        return {
            getAllSurveys: getAllSurveys
        }
    })();

    SMARTSURVEY.listSurveysViewModel = (function () {
        var service = SMARTSURVEY.listSurveysService;
        var loadingData = ko.observable(false);
        var allSurveys = ko.observableArray([]);
        var surveyUrlBase = "/Default.aspx?survey=";
        function initialize() {
            loadingData(true);
            service.getAllSurveys()
                .then(function (response) {
                    response.forEach(function (survey) {
                        allSurveys.push({
                            TemplateName: survey.TemplateName,
                            Product: survey.Product,
                            Location: survey.Location,
                            Link: surveyUrlBase + survey.UrlKey,
                        });
                    });
                    loadingData(false);
                })
                .fail(function () {
                    loadingData(false);
                });
        };

        return {
            initialize: initialize,
            loadingData: loadingData,
            allSurveys: allSurveys
        }
    })();

    SMARTSURVEY.listSurveysViewModel.initialize();
    ko.applyBindings(SMARTSURVEY.listSurveysViewModel);
})(SMARTSURVEY);