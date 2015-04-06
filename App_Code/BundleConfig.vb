Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Optimization
Imports System.Web.UI

Public Module BundleConfig
    ' Weitere Informationen zu Bundling finden Sie unter http://go.microsoft.com/fwlink/?LinkID=303951.
    Public Sub RegisterBundles(bundles As BundleCollection)
        bundles.Add(New ScriptBundle("~/bundles/WebFormsJs").Include(
            "~/Scripts/WebForms/WebForms.js",
            "~/Scripts/WebForms/WebUIValidation.js",
            "~/Scripts/WebForms/MenuStandards.js",
            "~/Scripts/WebForms/Focus.js", "~/Scripts/WebForms/GridView.js", 
            "~/Scripts/WebForms/DetailsView.js",
            "~/Scripts/WebForms/TreeView.js",
            "~/Scripts/WebForms/WebParts.js"))

        ' Die Reihenfolge ist sehr wichtig, damit diese Dateien funktionieren. Sie weisen ausdrückliche Abhängigkeiten auf.
        bundles.Add(New ScriptBundle("~/bundles/MsAjaxJs").Include(
            "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
            "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
            "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
            "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"))

        ' Verwenden Sie die Entwicklungsversion von Modernizr als Entwicklungs- und Lerngrundlage. Wenn Sie dann
        ' bereit für die Produktion sind, verwenden Sie das Buildtool unter "http://modernizr.com", um nur die benötigten Tests auszuwählen.
        bundles.Add(New ScriptBundle("~/bundles/modernizr").Include(
            "~/Scripts/modernizr-*"))

        ScriptManager.ScriptResourceMapping.AddDefinition("respond", New ScriptResourceDefinition() With {
            .Path = "~/Scripts/respond.min.js",
            .DebugPath = "~/Scripts/respond.js"})

    End Sub
End Module
