Imports System.ComponentModel
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Data
Imports DevExpress.Web
Imports System.ServiceModel
Imports System.ServiceModel.Channels
Imports System.IO
Partial Class Control_SC_SaveLayoutGrid
    Inherits System.Web.UI.UserControl

    Private _SC_GridControl As ASPxGridView
    Private _Page_ID As String
    Public Property SC_GridControl() As ASPxGridView
        Get
            Return _SC_GridControl
        End Get
        Set(ByVal value As ASPxGridView)
            _SC_GridControl = value
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
    Sub WriteLog(ByVal pcFile As String, ByVal pcTag As String, ByVal pcLog As String)

        Dim lcpath As String = "D:\CT Agro Indonesia\Logs\"
        Dim path As String = lcpath + pcFile + ".log"
        Dim lcTime As String = Now.ToString("yyyyMMdd HH:mm:ss")

        Dim lcLog As String = lcTime + vbTab + pcTag + vbTab + pcLog

        If Not Directory.Exists(lcpath) Then
            Directory.CreateDirectory(lcpath)
        End If

        If Not File.Exists(path) Then
            Using sw As StreamWriter = File.CreateText(path)
                sw.WriteLine(lcLog)
            End Using
        Else
            Using sw As StreamWriter = File.AppendText(path)
                sw.WriteLine(lcLog)
            End Using
        End If

    End Sub

    'Protected Sub ASPxGridView1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxGridView1.SelectionChanged
    '    If ASPxGridView1.GetSelectedFieldValues("LAYOUT").Count = 0 Then

    '    Else
    '        _SC_GridControl.LoadClientLayout(ASPxGridView1.GetSelectedFieldValues("LAYOUT").Item(0).ToString)

    '    End If
    'End Sub

    Protected Sub LayoutSqlDataSource_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LayoutSqlDataSource.Selecting
        With e.Command
            .Parameters("@USER_ID").Value = Session("K_USER_ID")
            .Parameters("@APP_ID").Value = _Page_ID
        End With
    End Sub

    Protected Sub LayoutSqlDataSource_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LayoutSqlDataSource.Inserting
        With e.Command
            .Parameters("@USER_ID").Value = Session("K_USER_ID")
            .Parameters("@APP_ID").Value = _Page_ID
            .Parameters("@LAYOUT").Value = _SC_GridControl.SaveClientLayout
            .Parameters("@COLLAPSED").Value = ""
        End With
    End Sub

    Protected Sub LayoutSqlDataSource_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LayoutSqlDataSource.Updating
        With e.Command
            .Parameters("@USER_ID").Value = Session("K_USER_ID")
            .Parameters("@APP_ID").Value = _Page_ID
            .Parameters("@LAYOUT").Value = _SC_GridControl.SaveClientLayout
            .Parameters("@COLLAPSED").Value = ""
        End With
    End Sub

    Protected Sub LayoutSqlDataSource_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LayoutSqlDataSource.Deleting

        Dim DvValidasiDelete As DataView
        Dim loMESSAGE As String

        LayoutSQLDS.SelectParameters.Item("APP_ID").DefaultValue = _Page_ID
        LayoutSQLDS.SelectParameters.Item("USER_ID").DefaultValue = Session("K_USER_ID")
        DvValidasiDelete = DirectCast(LayoutSQLDS.Select(DataSourceSelectArguments.Empty), DataView)

        If DvValidasiDelete.Count = 0 Then
            loMESSAGE = "User Anda Tidak diperkenankan Menghapus layout ini"

        Else
            With e.Command
                .Parameters("@USER_ID1").Value = Session("K_USER_ID")
            End With

        End If

    End Sub


    Protected Sub ASPxButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim row As Integer = ASPxGridView1.FocusedRowIndex

        If row >= 0 Then
            _SC_GridControl.LoadClientLayout(ASPxGridView1.GetRowValues(row, "LAYOUT").ToString)
        End If
        'WriteLog("ASPxGridView1_FocusedRowChanged", "ASPxGridView1_FocusedRowChanged", row.ToString)


    End Sub
End Class
