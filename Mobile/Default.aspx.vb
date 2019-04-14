Imports MenuSvcRef
Imports SC_Common
Imports System.ServiceModel
Imports System.Data

Partial Class test
    Inherits System.Web.UI.Page

    Public Enum BootstrapAlertType
        Plain
        Success
        Information
        Warning
        Danger
        Primary
    End Enum

    Public Shared Sub BootstrapAlert(ByVal MsgLabel As Label, ByVal Message As String, _
Optional ByVal MessageType As BootstrapAlertType = BootstrapAlertType.Plain,
                                    Optional ByVal Dismissable As Boolean = False)
        Dim style, icon As String
        Select Case MessageType
            Case BootstrapAlertType.Plain
                style = "default"
                icon = ""
            Case BootstrapAlertType.Success
                style = "success"
                icon = "check"
            Case BootstrapAlertType.Information
                style = "info"
                icon = "info-circle"
            Case BootstrapAlertType.Warning
                style = "warning"
                icon = "warning"
            Case BootstrapAlertType.Danger
                style = "danger"
                icon = "remove"
            Case BootstrapAlertType.Primary
                style = "primary"
                icon = "info"
        End Select

        If (Not MsgLabel.Page.IsPostBack Or MsgLabel.Page.IsPostBack) And Message = Nothing Then
            MsgLabel.Visible = False
        Else
            MsgLabel.Visible = True
            MsgLabel.CssClass = "alert alert-" & style & If(Dismissable = True, " alert-dismissible fade in font2", "")
            MsgLabel.Text = "<i class='fa fa-" & icon & "'></i>" & Message
            If Dismissable = True Then
                MsgLabel.Text &= "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
            End If
            MsgLabel.Focus()
            Message = ""
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim loService As New SCMenuSvcClient
        Dim loRTN As loginDTO
        Dim loException As New SC_Exception
        Dim lcCmd As String
        Dim Username, password As String
        Dim loData As New DataView
        Dim loData2 As New DataView
        Dim Regional, Company, Company_Office, Company_Map As String

        Try
            Username = Request.Form("UsernameTxt")
            password = Request.Form("PasswordTxt")

            If Username = "" And password = "" Then
                loException.Add("Validasi", "Username & Password tidak boleh kosong!")
                Exit Try
            ElseIf Username = "" Or password = "" Then
                loException.Add("Validasi", "Username atau Password tidak boleh kosong!")
            End If

            loRTN = loService.Login(Username.ToUpper, password.ToUpper)
            loService.Close()

            lcCmd = "SELECT [WEEKLY_ID]"
            lcCmd = lcCmd & " FROM [SIMARC].[dbo].[M_WEEKLY] "
            lcCmd = lcCmd & " WHERE GETDATE() BETWEEN FROM_DATE AND TO_DATE "

            SqlDSLogin.SelectCommand = lcCmd
            loData = (SqlDSLogin.Select(DataSourceSelectArguments.Empty))

            If loData.Table.Rows.Count > 0 Then
                Session("K_WEEKLY_ID") = loData.Table.Rows(0)("WEEKLY_ID")
            Else
                Session("K_WEEKLY_ID") = ""
            End If

            lcCmd = "SELECT [USER_ID]"
            lcCmd = lcCmd & " ,[REGIONAL]"
            lcCmd = lcCmd & " ,[COMPANY_ID]"
            lcCmd = lcCmd & " ,[COMPANY_OFFICE_ID]"
            lcCmd = lcCmd & " ,[COMPANY_OFFICE_MAP_ID]"
            lcCmd = lcCmd & " FROM [SIMARC].[dbo].[SYS_USER] "
            lcCmd = lcCmd & " WHERE USER_ID='" & Username.ToUpper & "'"

            SqlDSLogin.SelectCommand = lcCmd
            loData2 = SqlDSLogin.Select(DataSourceSelectArguments.Empty)

            If loData2.Table.Rows.Count > 0 Then
                Regional = loData2.Table.Rows(0)("REGIONAL")
                Company = loData2.Table.Rows(0)("COMPANY_ID")
                Company_Office = loData2.Table.Rows(0)("COMPANY_OFFICE_ID")
                Company_Map = loData2.Table.Rows(0)("COMPANY_OFFICE_MAP_ID")
            Else
                Regional = ""
                Company = ""
                Company_Office = ""
                Company_Map = ""
            End If

            Session("K_USER_ID") = Username.ToUpper
            Session("K_REGIONAL") = Regional.ToString
            Session("K_COMPANY_ID") = Company.ToString
            Session("K_COMPANY_OFFICE_ID") = Company_Office
            Session("K_COMPANY_OFFICE_MAP_ID") = Company_Map

            Response.Redirect("~/Menu_Mobile.aspx")


        Catch ex As TimeoutException
            loException.Add("001", "Connection Remote Time Out")
        Catch ex As FaultException(Of SC_ServiceExceptions)
            loException.ErrorList.AddRange(ex.Detail.Exceptions)
        Catch ex As FaultException
            loException.Add("001", "Remote gagal")
        Catch ex As CommunicationException
            loException.Add("001", "Komunikasi Remote gagal")
        Catch ex As Exception
            loException.Add(ex)
        End Try

        'Response.Redirect("~/Default.aspx")

        If loException.Haserror Then
            LblKeterangan.Visible = True
            LblKeterangan.Text = loException.ErrorList(0).ErrDescp

            'Call WriteLog("LOGIN WEB Mobile", LblKeterangan.Text, UserIDTextBox.Text)

            'UserIDTextBox.Text = ""
            'PasswordTextBox.Text = ""


        Else
            LblKeterangan.Visible = False
        End If
    End Sub
End Class
