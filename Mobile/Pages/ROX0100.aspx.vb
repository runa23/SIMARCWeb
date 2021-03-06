﻿Imports System.Data
Imports System.Data.SqlClient
Imports SC_BackEnd
Imports SC_Common
Imports DevExpress.Web

Partial Class Pages_ROX0100
    Inherits System.Web.UI.Page

    Dim kode As String

    Public Enum BootstrapAlertType
        Plain
        Success
        Information
        Warning
        Danger
        Primary
    End Enum

    Public Shared Sub BootstrapAlert(ByVal MsgLabel As Label, ByVal message As String, _
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

        If (Not MsgLabel.Page.IsPostBack Or MsgLabel.Page.IsPostBack) And message = Nothing Then
            MsgLabel.Visible = False
        Else
            MsgLabel.Visible = True
            MsgLabel.CssClass = "alert alert-" & style &
                If(Dismissable = True, " alert-dismissible fade in font2", "")
            MsgLabel.Text = "<i class='fa fa-" & icon & "'></i>" & message

            If Dismissable = True Then
                MsgLabel.Text &= "<button type='button' _" &
                "class='close' data-dismiss='alert' _ " &
                "aria-label='Close'><span aria-hidden='true'>&times;_ " &
                "</span></button>"
            End If

            MsgLabel.Focus()
            message = ""
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call Bersih()
        End If
    End Sub
    Protected Sub Bersih()
        BarcodeTextBox.Text = ""
        OutletTextBox.Text = ""
        RepairDGV.Visible = False
        kode = ""
        btnSelesai.Visible = False
        form2.Visible = False
        form3.Visible = False
        KodeLbl.Text = ""
    End Sub

    Protected Sub btnSelesai_Click(sender As Object, e As EventArgs) Handles btnSelesai.Click
        Call Bersih()
        btnProses.Visible = True
        BarcodeTextBox.Focus()
    End Sub

    Protected Sub btnYa_Click(sender As Object, e As EventArgs) Handles btnYa.Click
        Dim loConn As IDbConnection
        Dim loDb As New SC_Db
        Dim loHelper As New SC_Helper

        Try
            loConn = loDb.GetConnection
            kode = Format(Now, "yyMM")
            kode = "RPR" & kode
            kode = kode & loHelper.SC_GenerateKey(kode, 3, loConn)

            With SqlDSRPR_INS
                .InsertParameters("REPAIR_ID").DefaultValue = kode
                .InsertParameters("COMPANY_ID").DefaultValue = Session("K_COMPANY_ID")
                .InsertParameters("COMPANY_OFFICE_ID").DefaultValue = Session("K_COMPANY_OFFICE_ID")
                .InsertParameters("FROM_DATE").DefaultValue = Now
                .InsertParameters("TO_DATE").DefaultValue = Now
                .InsertParameters("BARCODE").DefaultValue = BarcodeTextBox.Text
                .InsertParameters("OUTLET_ID").DefaultValue = OutletTextBox.Text
                .InsertParameters("CREA_BY").DefaultValue = Session("K_USER_ID")
                .InsertParameters("UPD_BY").DefaultValue = Session("K_USER_ID")
                .Insert()
            End With

            RepairDGV.Visible = True
            btnSelesai.Visible = True

            KodeLbl.Text = kode

            With sqlDSRepair
                .SelectParameters("REPAIR_ID").DefaultValue = kode
                .Select(DataSourceSelectArguments.Empty)
            End With

            With SqlDSSparepart
                .SelectParameters("COMPANY_OFFICE_ID").DefaultValue = Session("K_COMPANY_OFFICE_ID")
                .Select(DataSourceSelectArguments.Empty)
            End With

            btnProses.Visible = False

        Catch ex As Exception
            Call BootstrapAlert(LblMsg, "Data masih belum lengkap!", BootstrapAlertType.Danger, True)
        End Try
    End Sub

    Protected Sub BarcodeTextBox_Validation(sender As Object, e As DevExpress.Web.ValidationEventArgs) Handles BarcodeTextBox.Validation
        Dim AsetView As DataView

        With SqlDSAset
            .SelectParameters("BARCODE").DefaultValue = BarcodeTextBox.Text
            .Select(DataSourceSelectArguments.Empty)
            AsetView = DirectCast(.Select(DataSourceSelectArguments.Empty), DataView)
        End With

        If AsetView Is Nothing Then
            form2.Visible = False
        ElseIf AsetView.Count = 0 Then
            form2.Visible = False
        Else
            form2.Visible = True
        End If
    End Sub

    Protected Sub OutletTextBox_Validation(sender As Object, e As DevExpress.Web.ValidationEventArgs) Handles OutletTextBox.Validation
        Dim OutletView As DataView

        With SqlDSOutlet
            .SelectParameters("OUTLET_ID").DefaultValue = OutletTextBox.Text
            .Select(DataSourceSelectArguments.Empty)
            OutletView = DirectCast(.Select(DataSourceSelectArguments.Empty), DataView)
        End With

        If OutletView Is Nothing Then
            form3.Visible = False
        ElseIf OutletView.Count = 0 Then
            form3.Visible = False
        Else
            form3.Visible = True
        End If
    End Sub

    Protected Sub RepairDGV_RowDeleting(sender As Object, e As Data.ASPxDataDeletingEventArgs) Handles RepairDGV.RowDeleting
        Dim loConn As IDbConnection
        Dim loDb As New SC_Db
        Dim lcCmd As String
        Dim harga As String
        Dim part As String

        part = e.Values("KD_PART").ToString

        loConn = loDb.GetConnection

        lcCmd = "SELECT HARGA_PART FROM M_SPAREPART WHERE COMPANY_OFFICE_ID = '" & Session("K_COMPANY_OFFICE_ID") & "' "
        lcCmd = lcCmd & "AND KD_PART = " & part & " "

        harga = loDb.SqlExecQuery(lcCmd, loConn, True).Rows(0).Item(0).ToString

        With sqlDSRepair
            .DeleteParameters("REPAIR_ID").DefaultValue = KodeLbl.Text
            .DeleteParameters("KD_PARTS").DefaultValue = part
            .DeleteParameters("QTY").DefaultValue = e.Values("QTY_PART").ToString
            .DeleteParameters("HARGA").DefaultValue = harga
            .DeleteParameters("COMPANY_OFFICE_ID").DefaultValue = Session("K_COMPANY_OFFICE_ID")
            .DeleteParameters("LOG").DefaultValue = KodeLbl.Text
            .DeleteParameters("CREA_BY").DefaultValue = Session("K_USER_ID")
            .DeleteParameters("UPD_BY").DefaultValue = Session("K_USER_ID")
        End With

        loConn.Close()
    End Sub

    Protected Sub RepairDGV_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles RepairDGV.RowInserting
        Dim loConn As IDbConnection
        Dim loDb As New SC_Db
        Dim lcCmd As String
        Dim harga As String
        Dim part As String
        Dim repair As String

        part = e.NewValues.Values(0).ToString

        loConn = loDb.GetConnection

        lcCmd = "SELECT HARGA_PART FROM M_SPAREPART WHERE COMPANY_OFFICE_ID = '" & Session("K_COMPANY_OFFICE_ID") & "' "
        lcCmd = lcCmd & "AND KD_PART = " & part & " "

        harga = loDb.SqlExecQuery(lcCmd, loConn, True).Rows(0).Item(0).ToString

        repair = KodeLbl.Text

        With sqlDSRepair
            .InsertParameters("REPAIR_ID").DefaultValue = repair
            .InsertParameters("KD_PART").DefaultValue = part
            .InsertParameters("QTY").DefaultValue = e.NewValues.Values(1)
            .InsertParameters("HARGA").DefaultValue = harga
            .InsertParameters("COMPANY_OFFICE_ID").DefaultValue = Session("K_COMPANY_OFFICE_ID")
            .InsertParameters("LOG").DefaultValue = repair
            .InsertParameters("CREA_BY").DefaultValue = Session("K_USER_ID")
            .InsertParameters("UPD_BY").DefaultValue = Session("K_USER_ID")
            '.Insert()
        End With

        loConn.Close()
    End Sub
End Class
