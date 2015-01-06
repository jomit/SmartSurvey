/// <reference path="C:\Jomit\Projects\SmartSurvey\SmartSurvey\SmartSurvey.WebApp\Scripts/knockout-3.2.0.js" />
/// <reference path="C:\Jomit\Projects\SmartSurvey\SmartSurvey\SmartSurvey.WebApp\Scripts/jquery-2.1.1.min.js" />

(function (SMARTSURVEY) {
    "use strict";
    SMARTSURVEY.defaultService = (function () {
        var callService = SMARTSURVEY.core.callService;
        var getcurrentSurvey = function (urlKey) {
            return $.Deferred(function (defer) {
                callService({
                    api: "Collectors/" + urlKey
                }).then(function (data) {
                    defer.resolve(data);
                }).fail(function (message) {
                    defer.reject(message);
                });
            }).promise();
        };
        var submitSurveyResponse = function (surveyResponse) {
            return $.Deferred(function (defer) {
                callService({
                    api: "Responses/",
                    data: surveyResponse,
                    type: "POST"
                }).then(function (data) {
                    defer.resolve(data);
                }).fail(function (message) {
                    defer.reject(message);
                });
            }).promise();
        };

        return {
            getcurrentSurvey: getcurrentSurvey,
            submitSurveyResponse: submitSurveyResponse
        }
    })();

    SMARTSURVEY.defaultViewModel = (function () {
        var service = SMARTSURVEY.defaultService;
        var loadingData = ko.observable(false);
        var surveyFormId = "mainSurvey";
        var thanksPage = "Thanks.aspx";
        var defaultTemplateId = "defaultTemplate";
        var currentSurvey = {
            id: ko.observable(-1),
            templateName: ko.observable(defaultTemplateId),
            location: ko.observable(""),
            product: ko.observable(""),
            responses: ko.observable("")
        };
       
        function initialize() {
            var urlKey = SMARTSURVEY.core.getQueryString("survey", "");
            if (urlKey == "") {
                return;
            }
            loadingData(true);
            service.getcurrentSurvey(urlKey)
                .then(function (template) {
                    currentSurvey.id(template.Id);
                    currentSurvey.templateName(template.TemplateName);
                    currentSurvey.location(template.Location);
                    currentSurvey.product(template.Product);
                    loadingData(false);
                })
                .fail(function () {
                    loadingData(false);
                });
        };

        function submit() {
            loadingData(true);
            var surveyResponse = $("#" + surveyFormId).serializeObject();
            service.submitSurveyResponse({
                collectorId: currentSurvey.id(),
                data: JSON.stringify(surveyResponse)
            })
                .then(function (response) {
                    location.href = thanksPage;
                })
                .fail(function () {
                    loadingData(false);
                    swal({
                        title: "Oops!!",
                        text: "Something went wrong. Please try again..",
                        type: "error",
                        confirmButtonText: "OK",
                        confirmButtonColor: "#4d90fe"
                    });
                });
        };

        return {
            initialize: initialize,
            submit: submit,
            loadingData: loadingData,
            currentSurvey: currentSurvey
        }
    })();

    SMARTSURVEY.defaultViewModel.initialize();
    ko.applyBindings(SMARTSURVEY.defaultViewModel);
})(SMARTSURVEY);