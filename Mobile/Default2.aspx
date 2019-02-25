<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="_Default" %>

<%@ Import Namespace="System.ComponentModel" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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
	    -moz-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	    -webkit-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	    box-shadow:inset 0px 1px 0px 0px #dcecfb;
	    
	    <%--background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #bddbfa), color-stop(1, #80b5ea));
	    background:-moz-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	    background:-webkit-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	    background:-o-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	    background:-ms-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	    background:linear-gradient(to bottom, #bddbfa 5%, #80b5ea 100%);--%>
	    
	    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bddbfa', endColorstr='#80b5ea',GradientType=0);
	    <%--background-color:#bddbfa;--%>
	    -moz-border-radius:6px;
	    -webkit-border-radius:6px;
	    border-radius:6px;
	    border:0px solid #84bbf3;
	    display:inline-block;
	    cursor:pointer;
	    <%--color:#ffffff;--%>
	    font-family:Verdana, Arial, Helvetica, sans-serif;
	    font-size:14px;
	    font-weight:bold;
	    padding:5px 5px;
	    text-decoration:none;
	    text-shadow:0px 1px 0px #528ecc;
    }
    .myButton:hover {
	    background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #108fc6), color-stop(1, #bddbfa));
	    background:-moz-linear-gradient(top, #108fc6 5%, #bddbfa 100%);
	    background:-webkit-linear-gradient(top, #108fc6 5%, #bddbfa 100%);
	    background:-o-linear-gradient(top, #108fc6 5%, #bddbfa 100%);
	    background:-ms-linear-gradient(top, #108fc6 5%, #bddbfa 100%);
	    background:linear-gradient(to bottom, #108fc6 5%, #bddbfa 100%);
	    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#108fc6', endColorstr='#bddbfa',GradientType=0);
	    background-color:#108fc6;
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
                                    <asp:Image ID="image1" runat="server" ImageAlign="AbsMiddle"
                                        ImageUrl="~/Images/SimarcLogo.jpg" Width="200px" />
                                        <br />
                                        <br />

                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Username" CssClass="label"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="UserIDTextBox" runat="server" Width="100%" CssClass="TextBox"></dx:ASPxTextBox>
                                        
                                        <%--<validasi Username>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            runat="server" ControlToValidate="UserIDTextBox"
                                            ErrorMessage="{Username Harus Diisi}" ForeColor="#FF3300" /><br />

                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Password" CssClass="label"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="PasswordTextBox" runat="server" Width="100%" CssClass="TextBox" 
                                                Password="True">
                                        </dx:ASPxTextBox>

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
