<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SC_SaveLayoutGrid.ascx.vb" Inherits="Control_SC_SaveLayoutGrid" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<dx:ASPxButton ID="PopUpASPxButton" runat="server" Height="60px" 
    Text="Save Layout" AutoPostBack="False" Theme="RedWine">
    <ClientSideEvents Click="function(s, e) {
	PopUpLayout.Show();
}" />
</dx:ASPxButton>

    <asp:SqlDataSource runat="server" 
    ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 

        DeleteCommand=" DELETE FROM SYS_LAYOUT
        WHERE KEY_ID= @KEY_ID
        AND USER_ID= @USER_ID1 "

        InsertCommand="INSERT INTO [SYS_LAYOUT]
        (USER_ID
        ,APP_ID
        ,NAME
        ,KETERANGAN
        ,SHARED
        ,LAYOUT
        ,COLLAPSED)
        VALUES
        (
        @USER_ID
        ,@APP_ID
        ,@NAME
        ,@KETERANGAN
        ,@SHARED
        ,@LAYOUT
        ,@COLLAPSED)" 

            ProviderName="<%$ ConnectionStrings:SIMARCConnectionString.ProviderName %>" 
        SelectCommand="SELECT *
        FROM [SYS_LAYOUT]
        WHERE 
        APP_ID=@APP_ID
        AND 
        (
        USER_ID=@USER_ID 
        OR SHARED=1
        )

        " UpdateCommand="UPDATE SYS_LAYOUT
        SET
        NAME=@NAME
        ,KETERANGAN=@KETERANGAN
        ,SHARED=@SHARED
        ,LAYOUT=@LAYOUT
        ,COLLAPSED=@COLLAPSED
        WHERE KEY_ID=@KEY_ID
        AND USER_ID=@USER_ID
        AND APP_ID=@APP_ID" 

        ID="LayoutSqlDataSource">

    <DeleteParameters>
    <asp:Parameter Name="KEY_ID" ></asp:Parameter>
    <asp:Parameter Name="USER_ID1" Type="String"> </asp:Parameter>
    </DeleteParameters>

    <InsertParameters>
    <asp:Parameter Name="USER_ID"></asp:Parameter>
    <asp:Parameter DefaultValue="" Name="APP_ID"></asp:Parameter>
    <asp:Parameter Name="NAME"></asp:Parameter>
    <asp:Parameter DefaultValue="" Name="KETERANGAN"></asp:Parameter>
    <asp:Parameter DefaultValue="FALSE" Name="SHARED" Type="Boolean"></asp:Parameter>
    <asp:Parameter DefaultValue="" Name="LAYOUT" ConvertEmptyStringToNull="False"></asp:Parameter>
    <asp:Parameter Name="COLLAPSED"></asp:Parameter>
    </InsertParameters>

    <SelectParameters>
    <asp:Parameter Name="APP_ID"></asp:Parameter>
    <asp:Parameter Name="USER_ID"></asp:Parameter>
    </SelectParameters>

    <UpdateParameters>
    <asp:Parameter Name="NAME"></asp:Parameter>
    <asp:Parameter Name="KETERANGAN"></asp:Parameter>
    <asp:Parameter Name="SHARED"></asp:Parameter>
    <asp:Parameter Name="LAYOUT"></asp:Parameter>
    <asp:Parameter Name="COLLAPSED"></asp:Parameter>
    <asp:Parameter Name="KEY_ID"></asp:Parameter>
    <asp:Parameter Name="USER_ID"></asp:Parameter>
    <asp:Parameter Name="APP_ID"></asp:Parameter>
    </UpdateParameters>

    </asp:SqlDataSource>


<dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" 
    ClientInstanceName="PopUpLayout" CloseAction="CloseButton" 
    HeaderText="Save Layout" Height="302px" PopupElementID="PopUpASPxButton" 
    Width="527px" CloseOnEscape="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        ClientInstanceName="grid" DataSourceID="LayoutSqlDataSource" 
        KeyFieldName="KEY_ID" Width="100%" >
        <EditFormLayoutProperties ColCount="3">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="SHARED">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="NAME" Width="300px">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
            <SettingsItems Width="100px" />
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True" 
                ShowNewButton="True" ShowDeleteButton="True" ShowApplyFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="KEY_ID" ReadOnly="True" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Dibuat Oleh" FieldName="USER_ID" 
                ShowInCustomizationForm="True" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="APP_ID" ShowInCustomizationForm="True" 
                Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Layout" FieldName="NAME" 
                ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Keterangan" FieldName="KETERANGAN" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataCheckColumn Caption="Share" FieldName="SHARED" 
                ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
                <PropertiesCheckEdit DisplayTextChecked="YA" DisplayTextUnchecked="TIDAK">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="LAYOUT" ShowInCustomizationForm="True" 
                Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="COLLAPSED" ShowInCustomizationForm="True" 
                Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>


            <dx:GridViewDataHyperLinkColumn Caption="Refresh" 
                ShowInCustomizationForm="False" VisibleIndex="3" FieldName="LAYOUT">
                <DataItemTemplate>
                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Refresh" 
                        onclick="ASPxButton2_Click">
                    </dx:ASPxButton>
                </DataItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                </CellStyle>
            </dx:GridViewDataHyperLinkColumn>

          

           <%-- <dx:GridViewCommandColumn ButtonType="Button" ShowInCustomizationForm="True" 
                VisibleIndex="4">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="cbRefresh" Text="Refresh">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>--%>

          

        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" 
            ConfirmDelete="True" AllowFocusedRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Refresh">
                </dx:ASPxButton>
            </DetailRow>
        </Templates>
        <SettingsEditing EditFormColumnCount="1" NewItemRowPosition="Bottom">
        </SettingsEditing>
        <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFooter="True" 
            ShowHeaderFilterButton="True" />

    </dx:ASPxGridView>

        <br />
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<asp:SqlDataSource runat="server" 
    ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 

    ProviderName="<%$ ConnectionStrings:SIMARCConnectionString.ProviderName %>" 
        SelectCommand="SELECT 
        APP_ID
        FROM [SYS_LAYOUT]
        WHERE 
        APP_ID=@APP_ID
        AND USER_ID=@USER_ID " 

        ID="LayoutSQLDS">

<SelectParameters>
<asp:Parameter Name="APP_ID"></asp:Parameter>
<asp:Parameter Name="USER_ID"></asp:Parameter>
</SelectParameters>

</asp:SqlDataSource>
