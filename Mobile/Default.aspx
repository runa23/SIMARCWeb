<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="test" %>

<%@ Import Namespace="System.ComponentModel" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<link href="Style/Login/CSS/bootstrap v4.1.1.min.css" rel="stylesheet" id="bootstrap-css">
<script src="Style/Login/jQuery/bootstrap v4.1.1.min.js"></script>
<script src="Style/Login/jQuery/jQuery v3.2.1.min.js"></script>

<!DOCTYPE html>

<html>

<head runat="server">
    <link rel="Shortcut Icon" href="Images/Wals.png" />
    <title>Login</title>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=1 ' name='viewport' />
    <link rel="stylesheet" href="Style/Login/CSS/bootstrap v4.1.3.min.css" >
    <script src="Style/Login/jQuery/jQuery v3.3.1.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" >
    <link rel="Stylesheet" type="text/css" href="Style/Login/CSS/Login.css" />
</head>
<body>
    <div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="Images/walls.jpg" class="brand_logo" alt="Logo" />
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form runat="server">
                        <div class="input-group-sm mb-4">
                            <h1 align="center" 
                            style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; 
                                    font-size: x-large; color: #FFFFFF;">
                            <strong>SIMARC</strong> Mobile
                            </h1>
                        </div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="UsernameTxt" class="form-control input_user" placeholder="username" />
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="PasswordTxt" class="form-control input_pass" placeholder="password" />
						</div>
					<%--</form>--%>
				<%--</div>--%>

				<div class="d-flex justify-content-center mt-5">
                    <dx:ASPxButton ID="btnLogin" runat="server" Text="Login" CssClass="btn login_btn"></dx:ASPxButton>
                </div>
                <div class="d-flex justify-content-center mt-3">
                    <dx:ASPxLabel ID="LblKeterangan" runat="server" ForeColor="White"></dx:ASPxLabel>
				</div>
                </form>
                </div>
			</div>
		</div>
	</div>

    <asp:SqlDataSource ID="SqlDSLogin" runat="server"
        ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
        SelectCommand = "SELECT 1">
    </asp:SqlDataSource>
</body>
</html>
