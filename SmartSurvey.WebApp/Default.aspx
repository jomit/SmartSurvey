<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartSurvey.WebApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Survey</title>
    <link href="/css/base.css" rel="stylesheet" />
    <link href="/css/sweet-alert.css" rel="stylesheet" />
    <script src="/Scripts/libs.min.js"></script>
</head>
<body>
    <script src="js/templates.js"></script>
    <script id="defaultTemplate"></script>
    <div style="display: none" data-bind="visible: $root.loadingData() == true">
        <div class='loader'>
            <div class='circle'></div>
            <div class='circle'></div>
            <div class='circle'></div>
            <div class='circle'></div>
            <div class='circle'></div>
        </div>
    </div>
    <div class="wrapper" data-bind="visible: $root.loadingData() == false">
        <form id="mainSurvey">
            <div data-bind="template: { name: function () { return currentSurvey.templateName(); } }"></div>
            <br />
            <input type="submit" value="&nbsp;&nbsp;Submit&nbsp;&nbsp;" style="margin-left: 40px;" class="m-btn blue" data-bind="click: submit" />
        </form>
    </div>
    <script src="/js/core.js"></script>
    <script src="/js/defaultViewModel.js"></script>
</body>
</html>
