<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Menu.aspx.vb" Inherits="Menu" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .dsxplPane_MetropolisBlue pane-Left:hover
        {

        }
        .container{width:100%;}
        .left{float:left;margin:5px;}
        .right{float:right;width:24px;}
    </style>

</head>
<body bgcolor="#f3f3f3">
    <form id="form1" runat="server">
    <div style="background-color: #369"">
        <div>

        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server"
            Height="100%" Width="100%" FullscreenMode="true" EnableTheming="true"
            SaveStateToCookies="true" Theme="Default" ClientInstanceName="ASPxSplitter1"
            ShowCollapseBackwardButton="true">

            <Panes>
                <dx:SplitterPane Size="150px" ScrollBars="Auto" ShowSeparatorImage="True">
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
                            
                            <div>
                                <dx:ASPxTreeView ID="ASPxTreeView1" runat="server"
                                    NodeLinkMode="ContentBounds" SaveStateToCookies="true"
                                    AllowSelectNode="true" EnableTheming="true"
                                    ShowTreeLines="false" Theme="Metropolis" >
                                    <Styles>
                                        <Node>
                                            <HoverStyle BackColor="#FFCC00"></HoverStyle>
                                        </Node>
                                    </Styles>
                                </dx:ASPxTreeView>
                                <br />
                            </div>

                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane ContentUrlIFrameName="asd" Name="ContentUrlPane">
                    <PaneStyle>
                        <Paddings Padding="0px" />
                        <Paddings Padding="0px" ></Paddings>
                    </PaneStyle>
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server" SupportDisableAttribute="True" >
                            <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" BackColor="#336699"
                                ClientInstanceName="ASPxSplitter2" FullscreenMode="true" Height="100%"
                                Orientation="Vertical" PaneMinSize="" SeparatorVisible="false" Width="100%">
                                <Panes>
                                    <dx:SplitterPane Size="35px">
                                        <PaneStyle BackColor="#336699">
                                            <Paddings Padding="0px" />
                                            <Paddings Padding="0px" ></Paddings>
                                        </PaneStyle>
                                        <ContentCollection>
                                            <dx:SplitterContentControl runat="server">
                                                
                                                <div class="container">
                                                    <div class="left">
                                                        <dx:ASPxLabel ID="pagesASPxLabel" runat="server"
                                                        ClientInstanceName = "pagesASPxLabel" Font-Bold="true"
                                                        Font-Size="Large" ForeColor="White" Text="SIMARC">
                                                        </dx:ASPxLabel>
                                                    </div>

                                                    <div class="right">
                                                        <a href="Default.aspx">
                                                            <img src="Images/Exit.png" alt="Logout" title="Log Out" style="height: 22px; width: 22px" /></a></div>
                                                    <div class="right">
                                                        <a href="Menu.aspx?page=user">
                                                            <img src="Images/User.ico" alt="User" title="User" style="height: 20px; width: 20px" />
                                                        </a>
                                                    </div>
                                                    <div class="right">
                                                        <a href="Menu.aspx">
                                                            <img src="Images/Home.ico" alt="Home" title="Home" style="height: 20px; width: 20px" />
                                                        </a>
                                                    </div>
                                                </div>

                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                    <dx:SplitterPane ContentUrlIFrameName="ContentUrlPane" Name="ContentUrlPane" ScrollBars="Auto">
                                        <PaneStyle BackColor="#F2F2F2"></PaneStyle>
                                        <ContentCollection>
                                            <dx:SplitterContentControl runat="server">
                                                    <div style="width: 100%; height:100%; overflow: scroll; -webkit-overflow-scrolling: touch;">
					                                <iframe frameborder="0" scrolling="yes"
						                                style="width: 100%; height: 100%;" runat="server" id="testFrame">
					                                </iframe>
                                                    </div>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                </Panes>
                                <Styles>
                                    <Pane>
                                        <Border BorderWidth="0px" />
                                        <Border BorderWidth="0px"></Border>
                                    </Pane>
                                </Styles>
                            </dx:ASPxSplitter>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
            <Styles>
                <Separator VerticalAlign="Top"></Separator>
                <SeparatorCollapsed BackColor="#336699"></SeparatorCollapsed>
                <SeparatorButton BackColor="#33CC33"></SeparatorButton>
            </Styles>
        </dx:ASPxSplitter>

        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
            SelectCommand="SELECT 1">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
         ConnectionString="<%$ ConnectionStrings:SIMARCConnectionString %>"
            SelectCommand="SELECT 1">
        </asp:SqlDataSource>
    </form>
</body>
</html>
