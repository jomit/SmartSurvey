<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartSurvey.WebApp.ListAllSurveys" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List All Surveys</title>
    <link href="/css/base.css" rel="stylesheet" />
    <link href="/css/sweet-alert.css" rel="stylesheet" />
    <script src="/Scripts/libs.min.js"></script>
</head>
<body>
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
        <ul data-bind="foreach: allSurveys">
            <li>
                <span data-bind="text: TemplateName"></span>&nbsp;|&nbsp;
                <span data-bind="text: Location"></span>&nbsp;|&nbsp;
                <span data-bind="text: Product"></span>&nbsp;:&nbsp;
                <a target="_blank" data-bind="attr: { href : Link}">Survey Link Here</a>
            </li>
        </ul>
    </div>
    <script src="/js/core.js"></script>
    <script src="/ListSurveys/listSurveysViewModel.js"></script>
</body>
</html>
