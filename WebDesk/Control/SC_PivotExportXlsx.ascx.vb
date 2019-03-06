Imports System.ComponentModel
Imports DevExpress.Web.ASPxPivotGrid
Partial Class Control_SC_PivotExportXlsx
    Inherits System.Web.UI.UserControl

    Private _SC_PivotGridExporter As ASPxPivotGridExporter
    Private _SC_PivotControl As ASPxPivotGrid

    Private _Page_ID As String
    Private _lcFileExportName As String

    Public Property SC_PivotGridExporter() As ASPxPivotGridExporter
        Get
            Return _SC_PivotGridExporter
        End Get
        Set(ByVal value As ASPxPivotGridExporter)
            _SC_PivotGridExporter = value
        End Set
    End Property

    Public Property SC_PivotControl() As ASPxPivotGrid
        Get
            Return _SC_PivotControl
        End Get
        Set(ByVal value As ASPxPivotGrid)
            _SC_PivotControl = value
        End Set
    End Property

    Public Property Page_ID() As String
        Get
            Return _Page_ID
        End Get
        Set(ByVal value As String)
            _Page_ID = value
        End Set
    End Property

    Public Property FileExportName() As String
        Get
            Return _lcFileExportName
        End Get
        Set(ByVal value As String)
            _lcFileExportName = value
        End Set
    End Property

    Protected Sub ASPxButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton3.Click
        If MergeRowASPxCheckBox.Checked Then
            _SC_PivotGridExporter.OptionsPrint.MergeRowFieldValues = True
            '_SC_PivotGridExporter.OptionsPrint.PrintRowAreaOnEveryPage = True
        Else
            _SC_PivotGridExporter.OptionsPrint.MergeRowFieldValues = False
            '_SC_PivotGridExporter.OptionsPrint.PrintRowAreaOnEveryPage = False
        End If

        '_SC_PivotGridExporter.OptionsPrint.MergeColumnFieldValues = False
        _SC_PivotGridExporter.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.False
        _SC_PivotGridExporter.OptionsPrint.PrintColumnHeaders = DevExpress.Utils.DefaultBoolean.False

        If ShowRowTotalASPxCheckBox.Checked Then
            _SC_PivotControl.OptionsView.ShowRowTotals = True
        Else
            _SC_PivotControl.OptionsView.ShowRowTotals = False
        End If

        If ShowRowGrandTotalASPxCheckBox.Checked Then
            _SC_PivotControl.OptionsView.ShowRowGrandTotalHeader = True
        Else
            _SC_PivotControl.OptionsView.ShowRowGrandTotalHeader = False
        End If

        _SC_PivotGridExporter.ExportXlsxToResponse(_lcFileExportName, True)
    End Sub
End Class
