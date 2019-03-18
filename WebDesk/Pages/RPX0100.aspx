<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RPX0100.aspx.vb" Inherits="Pages_RPX0100" %>
<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Src="../Control/SC_SaveLayout.ascx" TagName="SC_SaveLayout" TagPrefix="uc1" %>

<%@ Register Src="../Control/SC_PivotExportXlsx.ascx" TagName="SC_PivotExportXlsx" TagPrefix="uc2" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pivot Repair Cabinet</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-bottom:100px">
        <table>
            <tbody>
                <tr>
                    <td>
                        <dx:ASPxButton ID="ASPxBtnRefresh" runat="server" Height="60px" Width="80px" 
                            Text="Refresh" Theme="DevEx">
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <dx:ASPxButton ID="ASPxBtnFieldList" runat="server" Height="60px" Width="80px"
                            Text="Field List" AutoPostBack="false" Theme="DevEx">
                            <ClientSideEvents Click="function(s, e) {ASPxPivotGrid1.SetCustomizationFieldsVisibility();}" />
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <uc2:SC_PivotExportXlsx ID="SC_PivotExportXlsx" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <dx:ASPxButton ID="ASPxBtnExportToPDF" runat="server" Height="60px" Width="80px"
                               Text="Export To PDF" Theme="DevEx">
                               <ClientSideEvents Click="function(s, e) { ASPxPivotGrid1.PerformCallback();}" />
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <uc1:SC_SaveLayout ID="SC_SaveLayout1" runat="server" />
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <br />

        <table>
            <tbody>
                <tr>
                    <td class="style2" align="left">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Company Office" Font-Bold="false"></dx:ASPxLabel>
                    </td>
                    <td align="right">&nbsp;</td>
                    <td>
                        <dx:ASPxComboBox ID="CompanyOfficeCmbBox" runat="server"
                            DataSourceID="SqlDSCompanyOffice" TextField="COMPANY_OFFICE" 
                            ValueField="COMPANY_OFFICE_ID">

                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDSCompanyOffice" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
                            SelectCommand="SELECT C.COMPANY_OFFICE_ID
	                                                ,C.COMPANY_OFFICE
                                                FROM M_COMPANY_OFFICE_MAP A
                                                JOIN SYS_USER B ON A.COMPANY_OFFICE_MAP_ID = B.COMPANY_OFFICE_MAP_ID
                                                JOIN M_COMPANY_OFFICE C ON A.COMPANY_OFFICE_ID = C.COMPANY_OFFICE_ID
                                                WHERE A.COMPANY_OFFICE_MAP_ID = (
		                                                SELECT COMPANY_OFFICE_MAP_ID
		                                                FROM SYS_USER
		                                                WHERE USER_ID = @USER_ID)
                                                ORDER BY C.COMPANY_OFFICE_ID ASC">
                            <SelectParameters>
                                <asp:SessionParameter Name="USER_ID" SessionField="K_USER_ID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </tbody>
        </table>

        <br />

        <table>
            <tbody>
                <tr>
                    <td class="style2" align="left">
                         <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="From Date" Font-Bold="false">
                         </dx:ASPxLabel>
                    </td>
                    <td align="right">
                        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" EditFormat="Custom"
                            EditFormatString="yyyy/MM/dd" DisplayFormatString="dd/MM/yyyy" UseMaskBehavior="true">
                        </dx:ASPxDateEdit>
                    </td>
                    <td>&nbsp&nbsp&nbsp;</td>
                    <td class="style2" align="left">
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="To Date" Font-Bold="false">
                        </dx:ASPxLabel>
                    </td>
                    <td align="right">
                        <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" EditFormat="Custom"
                            EditFormatString="yyyy/MM/dd" DisplayFormatString="dd/MM/yyyy" 
                            UseMaskBehavior="true">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID"
            Width="100%" DataSourceID="SqlDSRepair">
            <Fields>
                <dx:PivotGridField ID="fieldSUBTOTAL" Area="DataArea" AreaIndex="0" 
                    Caption="Subtotal" CellFormat-FormatString="N2" CellFormat-FormatType="Numeric" 
                    FieldName="SUBTOTAL" Name="fieldSUBTOTAL" Options-ShowInFilter="True" 
                    ValueFormat-FormatString="N2" ValueFormat-FormatType="Numeric" 
                    GrandTotalCellFormat-FormatString="N2" 
                    GrandTotalCellFormat-FormatType="Numeric" GrandTotalText="Total" Width="300">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldREPAIRID" Area="RowArea" AreaIndex="0" 
                    Caption="Repair ID" FieldName="REPAIR_ID" Name="fieldREPAIRID" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCOMPANYID" Area="RowArea" AreaIndex="1" 
                    Caption="Company" FieldName="COMPANY_ID" Name="fieldCOMPANYID" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCOMPANYOFFICE" Area="RowArea" AreaIndex="2" 
                    Caption="Company Office" FieldName="COMPANY_OFFICE" Name="fieldCOMPANYOFFICE" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBARCODE" Area="RowArea" AreaIndex="5" 
                    Caption="Barcode" FieldName="BARCODE" Name="fieldBARCODE" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTYPEID" Area="RowArea" AreaIndex="6" Caption="Type" 
                    FieldName="TYPE_ID" Name="fieldTYPEID" Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMERKID" Area="RowArea" AreaIndex="7" Caption="Merk" 
                    FieldName="MERK_ID" Name="fieldMERKID" Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMODELID" Area="RowArea" AreaIndex="8" 
                    Caption="Model" FieldName="MODEL_ID" Name="fieldMODELID" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSIZE" Area="RowArea" AreaIndex="9" Caption="Size" 
                    FieldName="SIZE" Name="fieldSIZE" Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOUTLETNAME" Area="RowArea" AreaIndex="10" 
                    Caption="Outlet Name" FieldName="OUTLET_NAME" Name="fieldOUTLETNAME" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNAMAPART" Area="RowArea" AreaIndex="11" 
                    Caption="Nama Sparepart" FieldName="NAMA_PART" Name="fieldNAMAPART" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldQTYPART" Area="RowArea" AreaIndex="12" 
                    Caption="Qty" FieldName="QTY_PART" Name="fieldQTYPART" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSATUANPART" Area="RowArea" AreaIndex="13" 
                    Caption="Satuan" FieldName="SATUAN_PART" Name="fieldSATUANPART" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldHARGAPART" Area="RowArea" AreaIndex="14" 
                    Caption="Harga" FieldName="HARGA_PART" Name="fieldHARGAPART" 
                    Options-ShowInFilter="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCOMPANYOFFICEID" Area="DataArea" 
                    Caption="Company Office ID" FieldName="COMPANY_OFFICE_ID" 
                    Name="fieldCOMPANYOFFICEID" Options-ShowInFilter="True" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOUTLETID" Area="DataArea" Caption="Outlet ID" 
                    FieldName="OUTLET_ID" Name="fieldOUTLETID" Options-ShowInFilter="True" 
                    Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKDPART" Area="DataArea" Caption="Kode Sparepart" 
                    FieldName="KD_PART" Name="fieldKDPART" Options-ShowInFilter="True" 
                    Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFROMDATE" Area="RowArea" AreaIndex="3" 
                    Caption="From Date" CellFormat-FormatString="dd/MM/yyyy" 
                    CellFormat-FormatType="DateTime" FieldName="FROM_DATE" Name="fieldFROMDATE" 
                    Options-ShowInFilter="True" ValueFormat-FormatString="dd/MM/yyyy" 
                    ValueFormat-FormatType="DateTime">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTODATE" Area="RowArea" AreaIndex="4" 
                    Caption="To Date" CellFormat-FormatString="dd/MM/yyyy" 
                    CellFormat-FormatType="DateTime" FieldName="TO_DATE" Name="fieldTODATE" 
                    Options-ShowInFilter="True" ValueFormat-FormatString="dd/MM/yyyy" 
                    ValueFormat-FormatType="DateTime">
                </dx:PivotGridField>
            </Fields>
            <OptionsView DataHeadersDisplayMode="Popup" HorizontalScrollBarMode="Visible" />
            <OptionsCustomization CustomizationFormStyle="Excel2007" />
            <OptionsPager RowsPerPage="40" ShowSeparators="true">
            </OptionsPager>
        </dx:ASPxPivotGrid>

        <asp:SqlDataSource ID="SqlDSRepair" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
            SelectCommand="RPX0100" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="CompanyOfficeCmbBox" Name="COMPANY_OFFICE" 
                    PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ASPxDateEdit1" DbType="Date" Name="FROM_DATE" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="ASPxDateEdit2" DbType="Date" Name="TO_DATE" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
            ASPxPivotGridID="ASPxPivotGrid1">
        </dx:ASPxPivotGridExporter>
    </div>
    </form>
</body>
</html>
