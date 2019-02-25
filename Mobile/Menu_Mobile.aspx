<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Menu_Mobile.aspx.vb" Inherits="Menu_Mobile" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=1 ' name='viewport' />
    
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
             font-weight:normal;
              font-family:Verdana, Arial, Helvetica, sans-serif;
        }
        
       .myButton {
	        -moz-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	        -webkit-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	        box-shadow:inset 0px 1px 0px 0px #dcecfb;
	        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #bddbfa), color-stop(1, #80b5ea));
	        background:-moz-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	        background:-webkit-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	        background:-o-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	        background:-ms-linear-gradient(top, #bddbfa 5%, #80b5ea 100%);
	        background:linear-gradient(to bottom, #bddbfa 5%, #80b5ea 100%);
	        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bddbfa', endColorstr='#80b5ea',GradientType=0);
	        background-color:#bddbfa;
	        -moz-border-radius:6px;
	        -webkit-border-radius:6px;
	        border-radius:6px;
	        border:1px solid #84bbf3;
	        display:inline-block;
	        cursor:pointer;
	        color:#ffffff;
	        font-family:Verdana, Arial, Helvetica, sans-serif;
	        font-size:14px;
	        font-weight:bold;
	        padding:5px 5px;
	        text-decoration:none;
	        text-shadow:0px 1px 0px #528ecc;

        }

        .myButton:hover {
	        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #80b5ea), color-stop(1, #bddbfa));
	        background:-moz-linear-gradient(top, #80b5ea 5%, #bddbfa 100%);
	        background:-webkit-linear-gradient(top, #80b5ea 5%, #bddbfa 100%);
	        background:-o-linear-gradient(top, #80b5ea 5%, #bddbfa 100%);
	        background:-ms-linear-gradient(top, #80b5ea 5%, #bddbfa 100%);
	        background:linear-gradient(to bottom, #80b5ea 5%, #bddbfa 100%);
	        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#80b5ea', endColorstr='#bddbfa',GradientType=0);
	        background-color:#80b5ea;
        }

        .myButton:active {
	        position:relative;
	        top:1px;
        }

        .dxsplPane_MetropolisBlue pane-left:hover{
            background: url('~/images/simarclogo.jpg') 0 0 no-repeat;
        }

        .container{width:100%;}
        .left{float:left;margin:5px;}
        .right{float:right;width:24px;}
        
        .topPanel .btn
        {
            margin-right: 12px;
        } 
        
        
    </style>
    <link href="Content/css/bootstrap.min.css" rel="Stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxPanel ID="TopPanel" runat="server" FixedPosition="WindowTop" 
                    Collapsible="true" RightToLeft="False" >
                    <Styles>
                        <ExpandButton CssClass="btn"></ExpandButton>
                        <ExpandBar BackColor="#c93030"></ExpandBar>
                    </Styles>
                    <SettingsCollapsing AnimationType="Fade" 
                                        ExpandEffect="Slide">
                    <ExpandButton Position="Near" />
                    </SettingsCollapsing>

                <ExpandBarTemplate>

                    <div class="container">
                        <div class="left">
                           
                            <dx:ASPxLabel ID="PageAspxLabel" runat="server" OnLoad="PageAspxLabel_Init"
                                font-bold="true" Font-Size="Small"
                                ForeColor="White" Text="SIMARC Mobile" CssClass="lead">
                            </dx:ASPxLabel>

                        </div>
                        <br />
                        <div class="right">
                            <a href="Default.aspx">
                            <img src="Images/Exit.png" alt="Logout" title="Log Out" style="height: 22px; width: 22px" /></a></div>
                        
                        <div class="right">
                            <a href="Menu_Mobile.aspx?page=user">
                            <img src="Images/User.ico" alt="User" title="User" style="height: 20px; width: 20px" /></a></div>
                        
                        <div class="right">
                            <a href="Menu_Mobile.aspx">
                            <img src="Images/Home.ico" alt="Home" title="Home" style="height: 20px; width: 20px" /></a></div>
                    </div>

                </ExpandBarTemplate>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportDisableAttribute="True">
                        <div style="overflow:auto; height: 450px">
                            <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" NodeLinkMode="ContentBounds"
                             SaveStateToCookies="true" AllowSelectNode="true" EnableTheming="true" 
                             ShowTreeLines="false" Theme="MetropolisBlue" >

                             <Styles>
                                <Node>
                                    <HoverStyle BackColor="#FFCC00"></HoverStyle>
                                </Node>
                             </Styles>
                            </dx:ASPxTreeView>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
        </dx:ASPxPanel>

        <dx:ASPxSplitter ID="ASPxSplitter1" ClientInstanceName="splitter" runat="server"
            Height="100%" Width="100%" FullscreenMode="true">
            <Panes>
                <dx:SplitterPane Name="ContentUrlPane" ScrollBars="Auto" ContentUrlIFrameName="contentUrlPane">
                    <ContentCollection>
                        <dx:SplitterContentControl ID="SplitterContentControl2" runat="server" >
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
            <Styles>
                <Pane>
                    <Border borderwidth="0px" />
                    <Border BorderWidth="0px"></Border>
                </Pane>
            </Styles>
        </dx:ASPxSplitter>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
            SelectCommand="SELECT 1">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
         ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
            SelectCommand="SELECT 1">
        </asp:SqlDataSource>

        <script src="Scripts/jquery-2.0.3.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>
