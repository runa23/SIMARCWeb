Imports DevExpress.XtraPivotGrid
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Drawing
Partial Class Pages_MTX0100
    Inherits System.Web.UI.Page
    Dim lcFileExportName As String = "Maintenance Cabinet"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ASPxDateEdit1.Value = Now
            ASPxDateEdit2.Value = Now
        End If
        SC_SaveLayout1.SC_PivotControl = ASPxPivotGrid1
        SC_SaveLayout1.Page_ID = Page.GetType().Name

        SC_PivotExportXlsx.SC_PivotGridExporter = ASPxPivotGridExporter1
        SC_PivotExportXlsx.SC_PivotControl = ASPxPivotGrid1
        SC_PivotExportXlsx.FileExportName = lcFileExportName
    End Sub

    Protected Sub ASPxBtnExportToPDF_Click(sender As Object, e As EventArgs) Handles ASPxBtnExportToPDF.Click
        ASPxPivotGridExporter1.ExportPdfToResponse(lcFileExportName, True)
    End Sub

    Protected Sub ASPxBtnRefresh_Click(sender As Object, e As EventArgs) Handles ASPxBtnRefresh.Click
        ASPxPivotGrid1.DataBind()
    End Sub
End Class
