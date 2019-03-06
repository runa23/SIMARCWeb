<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SC_PivotExportXlsx.ascx.vb" Inherits="Control_SC_PivotExportXlsx" %>


 <%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



 <dx:ASPxButton ID="ExportXlsASPxButton" Height="60px" runat="server" 
    Text="Export Excel" AutoPostBack="False" Theme="RedWine">
    <ClientSideEvents Click="function (s, e) {ExportXlsxPopupControl.Show();}" />
 </dx:ASPxButton>



 <dx:ASPxPopupControl ID="ExportSettingASPxPopupControl" runat="server" AllowDragging="True" 
    ClientInstanceName="ExportXlsxPopupControl" CloseAction="CloseButton" 
    HeaderText="Export Option" Height="280px" PopupElementID="PopUpASPxButton" 
    Width="300px" CloseOnEscape="True" 
    PopupHorizontalAlign="Center" PopupVerticalAlign="Middle">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCheckBox ID="MergeRowASPxCheckBox" runat="server" 
                CheckState="Checked" Text="Merge Row" 
                ToolTip="Digunakan agar data tidak dimerge" Checked="True">
            </dx:ASPxCheckBox>
            <br />
            <dx:ASPxCheckBox ID="ShowRowTotalASPxCheckBox" runat="server" 
                CheckState="Checked" Text="Show Row Total" Checked="True">
            </dx:ASPxCheckBox>
            <dx:ASPxCheckBox ID="ShowRowGrandTotalASPxCheckBox" runat="server" 
                Checked="True" CheckState="Checked" Text="Show Row GrandTotal">
            </dx:ASPxCheckBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <dx:ASPxButton ID="ASPxButton3" runat="server" Height="40px" Text="Export XLS" 
                Width="100%">
                <ClientSideEvents Click="function(s, e) {ASPxPivotGrid1.PerformCallback();}" />
            </dx:ASPxButton>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>




 