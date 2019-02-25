Imports SC_Common
Imports SC_BackEnd
Imports System.Data.Common
Imports System.IO
Imports DevExpress.Export
Imports DevExpress.Web
Partial Class Menu_Mobile
    Inherits SC_Pagebase

    Public LOsTR As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ExportSettings.DefaultExportType = ExportType.WYSIWYG

        If Not IsPostBack Then
            Dim loData As System.Data.DataView
            Dim lcLastGroup As String = ""
            Dim lcLastModule As String = ""

            Dim lnGroupIndex As Integer = -1
            Dim lnModuleIndex As Integer = 0

            Dim lcCmd As String
            Dim lcPage As String

            lcPage = Request("page")

            lcCmd = "SELECT  DISTINCT SYS_APP.APP_ID, SYS_APP.APP_NAME, SYS_APP.APP_DESC, "
            lcCmd = lcCmd & "SYS_MODULE.MODULE_ID, SYS_MODULE.MODULE_NAME, SYS_APP_GROUP.APP_GROUP_ID, "
            lcCmd = lcCmd + "SYS_APP_GROUP.APP_GROUP_NAME, "
            lcCmd = lcCmd + "MODULE = SYS_MODULE.MODULE_NAME "
            lcCmd = lcCmd + "FROM SYS_APP (nolock) INNER JOIN  "
            lcCmd = lcCmd + "SYS_ROLE_APP (nolock) ON SYS_APP.APP_ID = SYS_ROLE_APP.APP_ID INNER JOIN "
            lcCmd = lcCmd + "SYS_MODULE (nolock) ON SYS_APP.MODULE_ID = SYS_MODULE.MODULE_ID INNER JOIN "
            lcCmd = lcCmd + "SYS_APP_GROUP (nolock) ON SYS_APP.APP_GROUP_ID = SYS_APP_GROUP.APP_GROUP_ID INNER JOIN "
            lcCmd = lcCmd + "SYS_USER_ROLE (nolock) ON SYS_ROLE_APP.ROLE_ID = SYS_USER_ROLE.ROLE_ID "
            lcCmd = lcCmd + "WHERE SYS_USER_ROLE.USER_ID = '" + Session("K_USER_ID") + "'"
            lcCmd = lcCmd + "AND SYS_APP.APP_TYPE='MOBILE' "
            lcCmd = lcCmd + "ORDER BY MODULE, SYS_APP_GROUP.APP_GROUP_NAME,SYS_APP.APP_NAME"

            SqlDataSource1.SelectCommand = lcCmd
            SqlDataSource1.DataBind()

            loData = (SqlDataSource1.Select(DataSourceSelectArguments.Empty))

            Page.Header.Title = "SIMARC Mobile"
            Session("PRIVILEGE_" + lcPage) = False

            For i As Integer = 0 To loData.Count - 1
                If SqlDataSource1 IsNot Nothing Then
                    Dim row As System.Data.DataRow = loData.Table.Rows(i)

                    If lcLastModule <> row("MODULE_ID") Then
                        ASPxTreeView1.Nodes.Add(row("MODULE"), row("MODULE_ID"))
                        ASPxTreeView1.Nodes.FindByName(row("MODULE_ID")).TextStyle.Font.Bold = True
                        ASPxTreeView1.Nodes.FindByName(row("MODULE_ID")).TextStyle.Font.Size = 10
                        ASPxTreeView1.Nodes.FindByName(row("MODULE_ID")).TextStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF3300")
                        ASPxTreeView1.Nodes.FindByName(row("MODULE_ID")).Image.IconID = "businessobjects_bofolder_32x32"
                        lcLastModule = row("MODULE_ID")
                        lnGroupIndex = lnGroupIndex + 1
                    End If

                    If lcLastGroup <> row("APP_GROUP_ID") + "-" + row("MODULE_ID") Then
                        ASPxTreeView1.Nodes.FindByName(row("MODULE_ID")).Nodes.Add(row("APP_GROUP_NAME"), row("APP_GROUP_ID") + "-" + row("MODULE_ID"))
                        ASPxTreeView1.Nodes().FindByName(row("APP_GROUP_ID") + "-" + row("MODULE_ID")).Image.IconID = "arrows_next_16x16office2013"
                        ASPxTreeView1.Nodes().FindByName(row("APP_GROUP_ID") + "-" + row("MODULE_ID")).TextStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EF643C") '#EEC472
                        lcLastGroup = row("APP_GROUP_ID") + "-" + row("MODULE_ID")
                        lnModuleIndex = lnModuleIndex + 1
                    End If


                    ASPxTreeView1.Nodes().FindByName(row("APP_GROUP_ID") + "-" + row("MODULE_ID")).Nodes.Add(row("APP_NAME"), row("APP_ID"))
                    ASPxTreeView1.Nodes().FindByName(row("APP_GROUP_ID") + "-" + row("MODULE_ID")).Nodes.FindByName(row("APP_ID")).NavigateUrl = "Menu_Mobile.aspx?page=" + row("APP_ID")

                    'ASPxTreeView1.Nodes().FindByName(row("APP_GROUP_NAME")).Nodes.Add(row("APP_NAME"), row("APP_ID"))
                    'ASPxTreeView1.Nodes().FindByName(row("APP_GROUP_NAME")).Nodes.FindByName(row("APP_ID")).NavigateUrl = "menu.aspx?page=" + row("APP_ID")

                    If lcPage = row("APP_ID") Then
                        LOsTR = row("APP_NAME").ToString.ToUpper
                        Page.Header.Title = row("APP_NAME").ToString.ToUpper
                        Session("PRIVILEGE_" & lcPage) = True
                    End If
                End If
            Next


            If (Request.Browser.Type.ToString.ToUpper.Contains("SAFARI")) Then

            Else
                If Not String.IsNullOrWhiteSpace(lcPage) And Session("PRIVILEGE_" + lcPage) = True Then
                    ASPxSplitter1.GetPaneByName("ContentUrlPane").ContentUrl = "~/Pages/" + lcPage + ".aspx"
                Else
                    If lcPage = "user" Then
                        ASPxSplitter1.GetPaneByName("ContentUrlPane").ContentUrl = "~/pages/user.aspx"
                    Else
                        ASPxSplitter1.GetPaneByName("ContentUrlPane").ContentUrl = "~/home.aspx"
                    End If

                End If
            End If
        End If
    End Sub
    Protected Sub pageASPxLabel_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim label = DirectCast(sender, ASPxLabel)

        If LOsTR = "" Then
            label.Text = "SIMARC Mobile"
        Else
            label.Text = LOsTR
        End If
    End Sub
End Class
