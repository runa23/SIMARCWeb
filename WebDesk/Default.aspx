<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Import Namespace="System.ComponentModel" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta content="width=device-width, initial-scale=1.0,  user-scalable=no" name="viewport"  />

    <title>SIMARC</title>

    <style type="text/css">
            .formLayout {
            max-width: 1300px;
            margin: auto;
        }
        .ROUND_PANEL{
            max-width: 1300px;
            margin: auto;
        }
        
        .TextBox  {
            font-style:normal;
            text-align:right; 
            border : 1px solid #cccccc;
        }
        .TextBox_Header {
            border : 1px solid #cccccc;
            font-family:Verdana, Arial, Helvetica, sans-serif;
       
        }
        .label {
             font-style:normal;
             font-weight:bold;
              font-family:Verdana, Arial, Helvetica, sans-serif;
        }
        
       .myButton {
	    -moz-box-shadow:inset 0px 1px 0px 0px #fad4d7;
	    -webkit-box-shadow:inset 0px 1px 0px 0px #fad4d7;
	    box-shadow:inset 0px 1px 0px 0px #fad4d7;
	    
	    <%--background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f57880), color-stop(1, #f51827));
	    background:-moz-linear-gradient(top, #f57880 5%, #f51827 100%);
	    background:-webkit-linear-gradient(top, #f57880 5%, #f51827 100%);
	    background:-o-linear-gradient(top, #f57880 5%, #f51827 100%);
	    background:-ms-linear-gradient(top, #f57880 5%, #f51827 100%);
	    background:linear-gradient(to bottom, #f57880 5%, #f51827 100%);--%>
	    
	    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f57880', endColorstr='#f51827',GradientType=0);
	    <%--background-color:#f57880;--%>
	    -moz-border-radius:6px;
	    -webkit-border-radius:6px;
	    border-radius:6px;
	    border:0px solid #f27e88;
	    display:inline-block;
	    cursor:pointer;
	    <%--color:#ffffff;--%>
	    font-family:Verdana, Arial, Helvetica, sans-serif;
	    font-size:14px;
	    font-weight:bold;
	    padding:5px 5px;
	    text-decoration:none;
	    text-shadow:0px 1px 0px #c7545d;
    }
    .myButton:hover {
	    background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #d11320), color-stop(1, #f57880));
	    background:-moz-linear-gradient(top, #d11320 5%, #f57880 100%);
	    background:-webkit-linear-gradient(top, #d11320 5%, #f57880 100%);
	    background:-o-linear-gradient(top, #d11320 5%, #f57880 100%);
	    background:-ms-linear-gradient(top, #d11320 5%, #f57880 100%);
	    background:linear-gradient(to bottom, #d11320 5%, #f57880 100%);
	    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d11320', endColorstr='#f57880',GradientType=0);
	    background-color:#d11320;
    }
    .myButton:active {
	    position:relative;
	    top:1px;
    }
    
    .right{float:right;width:24px;}
    
    </style>

    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Apakah ingin menyimpan data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
   
    
        <dx:ASPxFormLayout ID="formLayout" runat="server" CssClass="formLayout"
            theme="DevEx" Width="248px" >

            <Items>
            <dx:LayoutGroup Caption="" ColCount="2" GroupBoxDecoration="None" UseDefaultPaddings="false" Paddings-PaddingTop="20" >
                <Paddings PaddingTop="20px" />

                <GroupBoxStyle>
                    <Caption Font-Bold="true" Font-Size="16"></Caption>
                </GroupBoxStyle>

                <Items>
                <dx:LayoutItem Caption="" >
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>
                            <dx:ASPxRoundPanel ID="ROUND_PANEL" runat="server" HeaderText=""
                                Font-Bold="true" Collapsed="true" ShowHeader="false" >
                                <SettingsLoadingPanel Enabled="false" />
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent1" runat="server">
                                    <%--<asp:Image ID="image1" runat="server" ImageAlign="AbsMiddle"
                                        ImageUrl="~/Images/Login Page.png" Width="857px" Height="375px" />--%>
                                        <br />
                                        <br />

                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Username" CssClass="label"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="UserIDTextBox" runat="server" Width="100%" CssClass="TextBox"></dx:ASPxTextBox>
                                        
                                        <%--<validasi Username>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            runat="server" ControlToValidate="UserIDTextBox"
                                            ErrorMessage="{Username Harus Diisi}" ForeColor="#FF3300" /><br />

                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Password" CssClass="label"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="PasswordTextBox" runat="server" Width="100%" CssClass="TextBox"></dx:ASPxTextBox>

                                        <%--<Validasi Pass>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                            runat="server" ControlToValidate="PasswordTextBox"
                                            ErrorMessage="{Password Harus Diisi}" ForeColor="#FF3300" /><br />

                                        <dx:ASPxButton ID="btnLogin" runat="server" CssClass="myButton" Text="Login" Width="100%"></dx:ASPxButton>
                                        <dx:ASPxLabel ID="LblKet" runat="server" Font-Bold="true" Text="Kesalahan yang ditemukan : "></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxLabel ID="LblKeterangan" runat="server" ForeColor="Red"></dx:ASPxLabel>


                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            </Items>

        </dx:ASPxFormLayout>
        
        
        <asp:SqlDataSource ID="SqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>" 
        SelectCommand = "SELECT 1">

        </asp:SqlDataSource>
        
    </form>
</body>
</html>
