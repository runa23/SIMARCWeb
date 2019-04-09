<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MTX0100.aspx.vb" Inherits="Pages_MTX0100" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Src="../Control/SC_SaveLayout.ascx" TagName="SC_SaveLayout" TagPrefix="uc1" %>

<%@ Register Src="../Control/SC_PivotExportXlsx.ascx" TagName="SC_PivotExportXlsx" TagPrefix="uc2" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pivot Maintenance Cabinet</title>
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
                            SelectCommand="SELECT DISTINCT C.COMPANY_OFFICE_ID
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
            Width="100%" DataSourceID="SqlDSMaintenance">
            <Fields>
                <dx:PivotGridField ID="fieldGOOD" Area="DataArea" AreaIndex="0" 
                    FieldName="GOOD" Name="fieldGOOD" Options-ShowInFilter="True" 
                    Caption="Good">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMINOR" Area="DataArea" AreaIndex="1" 
                    FieldName="MINOR" Name="fieldMINOR" Options-ShowInFilter="True" 
                    Caption="Minor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMAJOR" Area="DataArea" AreaIndex="2" 
                    FieldName="MAJOR" Name="fieldMAJOR" Options-ShowInFilter="True" 
                    Caption="Major">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMAINTENANCEID" Area="RowArea" AreaIndex="0" 
                    FieldName="MAINTENANCE_ID" Name="fieldMAINTENANCEID" 
                    Options-ShowInFilter="True" Caption="Maintenance ID">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCOMPANYOFFICE" Area="RowArea" AreaIndex="1" 
                    FieldName="COMPANY_OFFICE" Name="fieldCOMPANYOFFICE" 
                    Options-ShowInFilter="True" Caption="Company Office">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFROMDATE" Area="RowArea" AreaIndex="2" 
                    FieldName="FROM_DATE" Name="fieldFROMDATE" Options-ShowInFilter="True" 
                    Caption="From Date" CellFormat-FormatString="dd/MM/yyyy" 
                    CellFormat-FormatType="DateTime" ValueFormat-FormatString="dd/MM/yyyy" 
                    ValueFormat-FormatType="DateTime" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTODATE" Area="RowArea" AreaIndex="2" 
                    FieldName="TO_DATE" Name="fieldTODATE" Options-ShowInFilter="True" 
                    Caption="To Date" CellFormat-FormatString="dd/MM/yyyy" 
                    CellFormat-FormatType="DateTime" ValueFormat-FormatString="dd/MM/yyyy" 
                    ValueFormat-FormatType="DateTime" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBARCODE" Area="RowArea" AreaIndex="2" 
                    FieldName="BARCODE" Name="fieldBARCODE" Options-ShowInFilter="True" 
                    Caption="Barcode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTYPEID" Area="RowArea" AreaIndex="3" 
                    FieldName="TYPE_ID" Name="fieldTYPEID" Options-ShowInFilter="True" 
                    Caption="Type">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMERKID" Area="RowArea" AreaIndex="4" 
                    FieldName="MERK_ID" Name="fieldMERKID" Options-ShowInFilter="True" 
                    Caption="Merk">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMODELID" Area="RowArea" AreaIndex="5" 
                    FieldName="MODEL_ID" Name="fieldMODELID" Options-ShowInFilter="True" 
                    Caption="Model">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOUTLETNAME" Area="RowArea" AreaIndex="6" 
                    FieldName="OUTLET_NAME" Name="fieldOUTLETNAME" Options-ShowInFilter="True" 
                    Caption="Outlet">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCASENAME" Area="RowArea" AreaIndex="7" 
                    FieldName="CASE_NAME" Name="fieldCASENAME" Options-ShowInFilter="True" 
                    Caption="Kasus">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCOMPANYID" Area="DataArea" FieldName="COMPANY_ID" 
                    Name="fieldCOMPANYID" Options-ShowInFilter="True" Visible="False" 
                    Caption="Company">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCOMPANYOFFICEID" Area="DataArea" 
                    FieldName="COMPANY_OFFICE_ID" Name="fieldCOMPANYOFFICEID" 
                    Options-ShowInFilter="True" Visible="False" Caption="Company Office ID">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSIZE" Area="DataArea" FieldName="SIZE" 
                    Name="fieldSIZE" Options-ShowInFilter="True" Visible="False" 
                    Caption="Size">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOUTLETID" Area="DataArea" FieldName="OUTLET_ID" 
                    Name="fieldOUTLETID" Options-ShowInFilter="True" Visible="False" 
                    Caption="Outlet ID">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCASEPOSITION" Area="DataArea" 
                    FieldName="CASE_POSITION" Name="fieldCASEPOSITION" Options-ShowInFilter="True" 
                    Visible="False" Caption="Posisi Kasus">
                </dx:PivotGridField>
            </Fields>
            <OptionsView DataHeadersDisplayMode="Popup" HorizontalScrollBarMode="Visible" />
            <OptionsCustomization CustomizationFormStyle="Excel2007" />
            <OptionsPager RowsPerPage="40" ShowSeparators="true">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        

            
    
        <asp:SqlDataSource ID="SqlDSMaintenance" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
            SelectCommand="MTX0100" SelectCommandType="StoredProcedure">
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
