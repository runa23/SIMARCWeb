<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ROX0100.aspx.vb" Inherits="Pages_ROX0100" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<%@ Import Namespace="System.ComponentModel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Repair Cabinet</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="../Content/css/bootstrap.min.css" />
    <script src="../Content/js/jquery.min.js"></script>
    <script src="../Content/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="email">Barcode Cabinet</label>
                        <br />
                        <dx:BootstrapTextBox ID="BarcodeTextBox" runat="server" NullText="Barcode"
                                        caption="" Autopostback="true">
                        </dx:BootstrapTextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rf1" Display="Dynamic" ControlToValidate="BarcodeTextBox"
                                runat="server" ErrorMessage="Barcode tidak boleh kosong!" CssClass="bg-warning" />
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                        <dx:BootstrapFormLayout ID="form2" runat="server"
                            AlignItemCaptionsInAllGroups="True" DataSourceID="SqlDSAset">
                            <Items>
                                 <dx:BootstrapLayoutItem Caption="Tipe" FieldName="TYPE_ID">
                                     <ContentCollection>
                                         <dx:ContentControl runat="server">
                                             <dx:BootstrapTextBox ID="form2_E2" runat="server" ReadOnly="True">
                                             </dx:BootstrapTextBox>
                                         </dx:ContentControl>
                                     </ContentCollection>
                                 </dx:BootstrapLayoutItem>
                                 <dx:BootstrapLayoutItem Caption="Merk" FieldName="MERK_ID">
                                     <ContentCollection>
                                         <dx:ContentControl runat="server">
                                             <dx:BootstrapTextBox ID="form2_E3" runat="server" ReadOnly="True">
                                             </dx:BootstrapTextBox>
                                         </dx:ContentControl>
                                     </ContentCollection>
                                 </dx:BootstrapLayoutItem>
                                 <dx:BootstrapLayoutItem Caption="Model" FieldName="MODEL_ID">
                                     <ContentCollection>
                                         <dx:ContentControl runat="server">
                                             <dx:BootstrapTextBox ID="form2_E4" runat="server" ReadOnly="True">
                                             </dx:BootstrapTextBox>
                                         </dx:ContentControl>
                                     </ContentCollection>
                                 </dx:BootstrapLayoutItem>
                                 <dx:BootstrapLayoutItem Caption="Ukuran" FieldName="SIZE">
                                     <ContentCollection>
                                         <dx:ContentControl runat="server">
                                             <dx:BootstrapTextBox ID="form2_E1" runat="server" ReadOnly="True">
                                             </dx:BootstrapTextBox>
                                         </dx:ContentControl>
                                     </ContentCollection>
                                 </dx:BootstrapLayoutItem>
                             </Items>
                        </dx:BootstrapFormLayout>
                        </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Kode Outlet</label>
                            <br />
                            <dx:BootstrapTextBox ID="OutletTextBox" runat="server" NullText="Outlet"
                                            Caption="" AutoPostBack="true">
                            </dx:BootstrapTextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rf2" Display="Dynamic" ControlToValidate="OutletTextBox"
                                    runat="server" ErrorMessage="Outlet tidak boleh kosong!" CssClass="bg-warning" />
                        <div class="col-sm-4">
                            <dx:BootstrapFormLayout ID="form3" runat="server"
                                AlignItemCaptionsInAllGroups="True" DataSourceID="SqlDSOutlet">
                                <Items>

                                    <dx:BootstrapLayoutItem Caption="Nama Outlet" FieldName="OUTLET_NAME">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:BootstrapTextBox ID="form3_E1" runat="server" ReadOnly="true">
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Alamat" FieldName="OUTLET_ADDRESS">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:BootstrapTextBox ID="form3_E2" runat="server" ReadOnly="true">
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Hp / Telpon" FieldName="OUTLET_PHONE">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:BootstrapTextBox ID="form3_E3" runat="server" ReadOnly="true">
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>

                                </Items>
                            </dx:BootstrapFormLayout>
                        </div>
                        </div>

                        <div class="col-sm-4">
                            <dx:BootstrapButton ID="btnProses" runat="server" AutoPostBack="false"
                                    CssClasses-Control="btn btn-info btn-block"
                                    data-toggle="modal" data-target="#myModal"
                                    Text="Proses" >
                        <CssClasses Control="btn btn-info btn-block" />
                        </dx:BootstrapButton>  
                         </div>
                         <br />
                            <div class="col-sm-4">
                                <asp:Label ID="LblMsg" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="KodeLbl" runat="server" Visible="false"></asp:Label>
                            </div>
                         <br />

                         <div class="form-group">
                            <dx:BootstrapGridView ID="RepairDGV" runat="server"
                                AutoGenerateColumns="False" DataSourceID="sqlDSRepair" 
                                 KeyFieldName="REPAIR_ID" >
                                <SettingsDataSecurity AllowDelete="True" AllowInsert="True" />
                                <Columns>
                                    <dx:BootstrapGridViewCommandColumn ShowDeleteButton="True" 
                                        ShowNewButtonInHeader="True" VisibleIndex="0">
                                    </dx:BootstrapGridViewCommandColumn>
                                    <dx:BootstrapGridViewTextColumn Caption="Kode" FieldName="KD_PART" 
                                        ReadOnly="True" VisibleIndex="1" Visible="False">
                                    </dx:BootstrapGridViewTextColumn>
                                    <dx:BootstrapGridViewTextColumn Caption="Qty" FieldName="QTY_PART" 
                                        VisibleIndex="3">
                                        <PropertiesTextEdit>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField ErrorText="Tidak Boleh Kosong" IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:BootstrapGridViewTextColumn>
                                    <dx:BootstrapGridViewComboBoxColumn Caption="Nama Sparepart" 
                                        FieldName="NAMA_PART" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="SqlDSSparepart" TextField="NAMA_PART" 
                                            ValueField="KD_PART" ValueType="System.Int32">
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesComboBox>
                                    </dx:BootstrapGridViewComboBoxColumn>
                                    <dx:BootstrapGridViewTextColumn FieldName="SATUAN_PART" ReadOnly="True" 
                                        VisibleIndex="5" Caption="Satuan">
                                        <PropertiesTextEdit>
                                            <ValidationSettings SetFocusOnError="true">
                                                <RequiredField IsRequired="true" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <SettingsEditForm Visible="False" />
                                    </dx:BootstrapGridViewTextColumn>
                                </Columns>
                                
                            </dx:BootstrapGridView>
                            <br />
                            <br />
                            <dx:BootstrapButton ID="btnSelesai" runat="server" AutoPostBack="false" CssClasses-Control="btn btn-info btn-block"
                                                        Text="Selesai">
                             </dx:BootstrapButton>

                         <!-- Modal -->
                          <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog modal-sm">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  <h4 class="modal-title">Informasi</h4>
                                </div>
                                <div class="modal-body">
                                  <p>Apakah Data sudah benar untuk di proses? </p>
                                </div>
                                <div class="modal-footer">

                                <dx:BootstrapButton ID="btnTidak" runat="server" 
                                    CssClasses-Control="btn btn-info btn-lg"  
                                    class="btn btn-default" data-dismiss="modal"
                                    Text="Tidak"  AutoPostBack="false"/>

                                <dx:BootstrapButton ID="btnYa" runat="server" 
                                    CssClasses-Control="btn btn-info btn-lg"  
                                    class="btn btn-default"  
                                    Text="Ya" />

                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- END MODAL -->



                         <!-- SELECT ASET -->

                         <asp:SqlDataSource ID="SqlDSAset" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
                            SelectCommand="SELECT [BARCODE], 
                                                  [TYPE_ID], 
                                                  [MERK_ID], 
                                                  [MODEL_ID], 
                                                  [SIZE] 
                                                  FROM [M_ASET] WHERE ([BARCODE] = @BARCODE)">
                             <SelectParameters>
                                 <asp:Parameter Name="BARCODE" Type="String" />
                             </SelectParameters>
                        </asp:SqlDataSource>

                        <!-- SELECT OUTLET -->
                        <asp:SqlDataSource ID="SqlDSOutlet" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
                            SelectCommand="SELECT [OUTLET_NAME], 
                                                  [OUTLET_ADDRESS], 
                                                  [OUTLET_PHONE] 
                                                  FROM [M_OUTLET] WHERE ([OUTLET_ID] = @OUTLET_ID)">
                            <SelectParameters>
                                <asp:Parameter Name="OUTLET_ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <!-- SELECT SPAREPART -->
                        <asp:SqlDataSource ID="SqlDSSparepart" runat="server"
                            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
                            SelectCommand="SELECT KD_PART
	                                            ,NAMA_PART
                                                ,HARGA_PART
                                            FROM M_SPAREPART (NOLOCK)
                                            WHERE STOCK_PART &gt; 0
                                            AND COMPANY_OFFICE_ID = @COMPANY_OFFICE_ID">
                            <SelectParameters>
                                <asp:Parameter Name="COMPANY_OFFICE_ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <!-- SELECT REPAIR DETAIL -->
                        <asp:SqlDataSource ID="sqlDSRepair" runat="server"
                            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
                            SelectCommand = "SELECT A.REPAIR_ID
	                                        ,B.KD_PART
	                                        ,C.NAMA_PART
	                                        ,B.QTY_PART
	                                        ,C.SATUAN_PART
                                        FROM T_REPAIR A (NOLOCK)
                                        JOIN T_REPAIR_DETAIL B (NOLOCK) ON A.REPAIR_ID = B.REPAIR_ID
                                        JOIN M_SPAREPART C (NOLOCK) ON C.KD_PART = B.KD_PART
	                                        AND C.COMPANY_OFFICE_ID = A.COMPANY_OFFICE_ID
                                        WHERE A.REPAIR_ID = @REPAIR_ID" 
                                        
                              InsertCommand="EXEC RPR0210 'INSERT', @REPAIR_ID, @KD_PART, @QTY, @HARGA, @CREA_BY, @UPD_BY
                                             EXEC RPR0110 @COMPANY_OFFICE_ID, @KD_PART, @HARGA, @LOG, @CREA_BY, @UPD_BY
                                             UPDATE M_SPAREPART SET STOCK_PART = STOCK_PART - @QTY WHERE COMPANY_OFFICE_ID = @COMPANY_OFFICE_ID AND KD_PART = @KD_PART"
                                        
                              DeleteCommand="DELETE FROM T_REPAIR_DETAIL WHERE REPAIR_ID = @REPAIR_ID AND KD_PART = @KD_PARTS 
                                             EXEC RPR0110 @COMPANY_OFFICE_ID, @KD_PARTS, @HARGA, @LOG, @CREA_BY, @UPD_BY 
                                             UPDATE M_SPAREPART SET STOCK_PART = STOCK_PART + @QTY WHERE COMPANY_OFFICE_ID = @COMPANY_OFFICE_ID AND KD_PART = @KD_PARTS"                                        
                                        >

                            <InsertParameters>
                                <asp:Parameter Name="REPAIR_ID" Type="String" />
                                <asp:Parameter Name="KD_PART" />
                                <asp:Parameter Name="QTY" />
                                <asp:Parameter Name="HARGA" />
                                <asp:Parameter Name="COMPANY_OFFICE_ID" Type="String" />
                                <asp:Parameter Name="LOG" />
                                <asp:Parameter Name="CREA_BY" Type="String" />
                                <asp:Parameter Name="UPD_BY" Type="String" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="REPAIR_ID" Type="String" />
                                <asp:Parameter Name="KD_PARTS" />
                                <asp:Parameter Name="QTY" />
                                <asp:Parameter Name="HARGA" />
                                <asp:Parameter Name="COMPANY_OFFICE_ID" Type="String" />
                                <asp:Parameter Name="LOG" />
                                <asp:Parameter Name="CREA_BY" Type="String" />
                                <asp:Parameter Name="UPD_BY" Type="String" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:Parameter Name="REPAIR_ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <!-- INSERT HEADER REPAIR -->
                        <asp:SqlDataSource ID="SqlDSRPR_INS" runat="server"
                            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"

                            InsertCommand="EXEC RPR0200 'INSERT'
                                           , @REPAIR_ID
                                           , @COMPANY_ID
                                           , @COMPANY_OFFICE_ID
                                           , @FROM_DATE
                                           , @TO_DATE
                                           , @BARCODE
                                           , @OUTLET_ID
                                           , @CREA_BY
                                           , @UPD_BY">

                            <InsertParameters>
                                <asp:Parameter Name="REPAIR_ID" Type="String" />
                                <asp:Parameter Name="COMPANY_ID" Type="String" />
                                <asp:Parameter Name="COMPANY_OFFICE_ID" Type="String" />
                                <asp:Parameter Name="FROM_DATE" Type="String" />
                                <asp:Parameter Name="TO_DATE" Type="String" />
                                <asp:Parameter Name="BARCODE" Type="String" />
                                <asp:Parameter Name="OUTLET_ID" Type="String" />
                                <asp:Parameter Name="CREA_BY" Type="String" />
                                <asp:Parameter Name="UPD_BY" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
