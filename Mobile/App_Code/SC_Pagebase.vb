Imports Microsoft.VisualBasic

Public Class SC_Pagebase
    Inherits System.Web.UI.Page

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        If Session("K_USER_ID") Is Nothing Then

            Dim int_milliSecondsTimeOut As Integer = Session.Timeout * 60000

            Dim str_Script As String

            str_Script = "<script type='text/javascript'>"
            str_Script = str_Script + "intervalset = window.setInterval('Redirect()',1);"
            str_Script = str_Script + "function Redirect()"
            str_Script = str_Script + "{"
            str_Script = str_Script + "alert('Session expired anda harus login sekarang!');"
            str_Script = str_Script + "window.parent.location='/default.aspx'; "
            str_Script = str_Script + "}"
            str_Script = str_Script + "</script>"

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "Redirect", str_Script)
        End If
    End Sub
    Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)
        MyBase.OnPreRender(e)
        AutoRedirect()
    End Sub
    Public Sub AutoRedirect()

        Dim int_MilliSecondsTimeOut As Integer = Session.Timeout * 60000

        Dim str_Script As String

        str_Script = "<script type='text/javascript'>"
        str_Script = str_Script + "intervalset = window.setInterval('Redirect()'," + int_MilliSecondsTimeOut.ToString() + ");"
        str_Script = str_Script + "function Redirect()"
        str_Script = str_Script + "{"
        str_Script = str_Script + "alert('Session expired anda harus login sekarang!');"
        str_Script = str_Script + "window.location.href='default.aspx'; "
        str_Script = str_Script + "}"
        str_Script = str_Script + "</script>"

        ClientScript.RegisterClientScriptBlock(Me.GetType(), "Redirect", str_Script)

    End Sub
End Class
