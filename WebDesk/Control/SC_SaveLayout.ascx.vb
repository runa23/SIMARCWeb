Imports System.ComponentModel
Imports DevExpress.Web.ASPxPivotGrid

Partial Class Control_SC_SaveLayout
    Inherits System.Web.UI.UserControl

    Private _SC_PivotControl As ASPxPivotGrid
    Private _Page_ID As String

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

    'Protected Sub ASPxGridView1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxGridView1.Init
    'ASPxGridView1.FilterExpression = "USER_ID='" + Session("K_USER_ID") + "'"
    'End Sub

    Protected Sub ASPxGridView1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxGridView1.SelectionChanged
        If ASPxGridView1.GetSelectedFieldValues("LAYOUT").Count = 0 Then
        Else

            _SC_PivotControl.LoadLayoutFromString(ASPxGridView1.GetSelectedFieldValues("LAYOUT").Item(0).ToString)
            _SC_PivotControl.LoadCollapsedStateFromString(ASPxGridView1.GetSelectedFieldValues("COLLAPSED").Item(0).ToString)

        End If
    End Sub

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
            .Parameters("@LAYOUT").Value = _SC_PivotControl.SaveLayoutToString
            .Parameters("@COLLAPSED").Value = _SC_PivotControl.SaveCollapsedStateToString
        End With
    End Sub

    Protected Sub LayoutSqlDataSource_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LayoutSqlDataSource.Updating
        With e.Command
            .Parameters("@USER_ID").Value = Session("K_USER_ID")
            .Parameters("@APP_ID").Value = _Page_ID
            .Parameters("@LAYOUT").Value = _SC_PivotControl.SaveLayoutToString
            .Parameters("@COLLAPSED").Value = _SC_PivotControl.SaveCollapsedStateToString
        End With
    End Sub

    Protected Sub LayoutSqlDataSource_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LayoutSqlDataSource.Deleting
        With e.Command
            .Parameters("@USER_ID").Value = Session("K_USER_ID")
        End With


        'LayoutSqlDataSource.DeleteParameters("KEY_ID").DefaultValue = ASPxGridView1.GetSelectedFieldValues("KEY_ID").Item(0)
        'LayoutSqlDataSource.DeleteParameters("USER_ID").DefaultValue = Session("K_USER_ID")
        'LayoutSqlDataSource.Delete()
    End Sub
End Class
