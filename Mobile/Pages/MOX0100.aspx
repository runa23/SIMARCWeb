<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MOX0100.aspx.vb" Inherits="Pages_MOX0100" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<%@ Import Namespace="System.ComponentModel" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maintenance Cabinet</title>

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
                        <label for="email">Barcode</label>
                        <br />
                        <dx:BootstrapTextBox ID="BarcodeTextBox" runat="server" NullText="Barcode"
                                        caption="" AutoPostBack="true">
                         </dx:BootstrapTextBox>
                         <br />
                         <asp:RequiredFieldValidator ID="rf1" Display="Dynamic" ControlToValidate="BarcodeTextBox"
                                runat="server" ErrorMessage="Barcode tidak boleh kosong!" CssClass="bg-waring" />
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
                         <label for="email">Outlet</label>
                         <br />
                         <dx:BootstrapTextBox ID="OutletTextBox" runat="server" NullText="Outlet"
                                        Caption="" AutoPostBack = "true">
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
                                            <dx:BootstrapTextBox ID="form3_E1" runat="server" ReadOnly="True">
                                            </dx:BootstrapTextBox>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:BootstrapLayoutItem>
                                <dx:BootstrapLayoutItem Caption="Alamat" FieldName="OUTLET_ADDRESS">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:BootstrapTextBox ID="form3_E2" runat="server" ReadOnly="True">
                                            </dx:BootstrapTextBox>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:BootstrapLayoutItem>
                                <dx:BootstrapLayoutItem Caption="Hp / Telpon" FieldName="OUTLET_PHONE">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:BootstrapTextBox ID="form3_E3" runat="server" ReadOnly="True">
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
                            </div>
                         <br />
                       

                      <div class="form-group">  
                         <dx:BootstrapGridView ID="MaintenanceDGV" runat="server" 
                                AutoGenerateColumns="False" DataSourceID="sqlDSProblem" KeyFieldName="CASE_ID" >

                                        <SettingsPager PageSize="40">
                                        </SettingsPager>

                                        <SettingsEditing Mode="Inline">
                                        </SettingsEditing>

                                        <SettingsDataSecurity AllowEdit="True" />
                                        <Columns>
                                            <dx:BootstrapGridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                                            </dx:BootstrapGridViewCommandColumn>
                                            <dx:BootstrapGridViewTextColumn Caption="No." FieldName="CASE_ID" 
                                                ReadOnly="True" VisibleIndex="1" HorizontalAlign="Center">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewTextColumn Caption="Kasus" FieldName="CASE_NAME" 
                                                ReadOnly="True" VisibleIndex="2">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewCheckColumn FieldName="GOOD" VisibleIndex="3" 
                                                Caption="Good"  >
                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" 
                                                    ValueUnchecked="0">
                                                </PropertiesCheckEdit>
                                            </dx:BootstrapGridViewCheckColumn>
                                            <dx:BootstrapGridViewCheckColumn FieldName="MINOR" VisibleIndex="4" 
                                                Caption="Minor" >
                                                <propertiescheckedit valuechecked="1" valuetype="System.Int32" 
                                                    valueunchecked="0"></propertiescheckedit>
                                            </dx:BootstrapGridViewCheckColumn>
                                            <dx:BootstrapGridViewCheckColumn FieldName="MAJOR" VisibleIndex="5" 
                                                Caption="Major"  >
                                                <propertiescheckedit valuechecked="1" valuetype="System.Int32" 
                                                    valueunchecked="0"></propertiescheckedit>
                                            </dx:BootstrapGridViewCheckColumn>
                                            <dx:BootstrapGridViewCheckColumn FieldName="DAMAGE" VisibleIndex="6" 
                                                Caption="Damage"  >
                                                <propertiescheckedit valuechecked="1" valuetype="System.Int32" 
                                                    valueunchecked="0"></propertiescheckedit>
                                            </dx:BootstrapGridViewCheckColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="MAINTENANCE_ID" ReadOnly="True" 
                                                Visible="False" VisibleIndex="7">
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

                          <asp:SqlDataSource ID="SqlDSOutlet" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
                              SelectCommand="SELECT [OUTLET_NAME], [OUTLET_ADDRESS], [OUTLET_PHONE] FROM [M_OUTLET] WHERE ([OUTLET_ID] = @OUTLET_ID)">
                              <SelectParameters>
                                  <asp:Parameter Name="OUTLET_ID" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>

                        <!-- SELECT CASE BY HEADER YG SUDAH DI INPUT -->
                    <asp:SqlDataSource ID="sqlDSProblem" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
                        SelectCommand="SELECT MAINTENANCE_ID
                                        ,CASE_ID = ISNULL(B.[CASE_ID],'')
                                        ,CASE_NAME = ISNULL(B.[CASE_NAME],'')
                                        ,GOOD = ISNULL(A.[GOOD],'')
                                        ,MINOR = ISNULL(A.[MINOR],'')
                                        ,MAJOR = ISNULL(A.[MAJOR],'')
                                        ,DAMAGE = ISNULL(A.[DAMAGE],'')
                                        FROM [SIMARC].[dbo].[T_MAINTENANCE_DETAIL] A(NOLOCK)
                                        RIGHT JOIN M_CASE B ON A.CASE_ID = B.CASE_ID 
		                                WHERE A.MAINTENANCE_ID= @MAINTENANCE_ID" 
                        
                        UpdateCommand = "UPDATE T_MAINTENANCE_DETAIL
                                                SET GOOD = @GOOD,
                                                    MINOR = @MINOR,
                                                    MAJOR = @MAJOR,
                                                    DAMAGE = @DAMAGE
                                                 WHERE MAINTENANCE_ID = @MAINTENANCE_ID
                                                 AND CASE_ID = @CASE_ID"
                                        >
                        <SelectParameters>
                            <asp:Parameter Name="MAINTENANCE_ID" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="GOOD" Type="Boolean" />
                            <asp:Parameter Name="MINOR" Type="Boolean" />
                            <asp:Parameter Name="MAJOR" Type="Boolean" />
                            <asp:Parameter Name="DAMAGE" Type="Boolean" />
                            <asp:Parameter Name="MAINTENANCE_ID" Type="String" />
                            <asp:Parameter Name="CASE_ID" Type="Int16" />
                        </UpdateParameters>

                    </asp:SqlDataSource>

                    <!-- INSERT HEADER & DETAIL MAINTENANCE DEFAULT GOOD = 1-->
                    <asp:SqlDataSource ID="sqlDSMTN_INS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
       
                        InsertCommand="EXEC MTN0100 'INSERT'
                                        , @MAINTENANCE_ID
                                        , @COMPANY_ID
                                        , @COMPANY_OFFICE_ID
                                        , @FROM_DATE
                                        , @TO_DATE
                                        , @BARCODE
                                        , @OUTLET_ID
                                        , @CREA_BY
                                        , @UPD_BY
                        
                                        INSERT INTO T_MAINTENANCE_DETAIL 
	                                     ( MAINTENANCE_ID, CASE_ID, GOOD, MINOR, 
                                           MAJOR, DAMAGE, CREA_BY, CREA_DATE, UPD_BY, UPD_DATE)
                                           SELECT MAINTENANCE_ID = @MAINTENANCE_ID
                                            ,CASE_ID = ISNULL(B.[CASE_ID],'')
                                            ,GOOD = 1
                                            ,MINOR = ISNULL(A.[MINOR],'')
                                            ,MAJOR = ISNULL(A.[MAJOR],'')
                                            ,DAMAGE = ISNULL(A.[DAMAGE],'')
                                            ,CREA_BY = @CREA_BY
                                            ,CREA_DATE = GETDATE()
                                            ,UPD_BY = @UPD_BY
                                            ,UPD_DATE = GETDATE()
                                             FROM [SIMARC].[dbo].[T_MAINTENANCE_DETAIL] A(NOLOCK)
                                             RIGHT JOIN M_CASE B ON A.CASE_ID = B.CASE_ID 
			                                 WHERE MAINTENANCE_ID = ''"
                                        >
                        <InsertParameters>
                            <asp:Parameter Name="MAINTENANCE_ID" Type="String" />
                            <asp:Parameter Name="COMPANY_ID" Type="String" />
                            <asp:Parameter Name="COMPANY_OFFICE_ID" Type="String" />
                            <asp:Parameter Name="FROM_DATE" Type="DateTime" />
                            <asp:Parameter Name="TO_DATE" Type="DateTime" />
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
