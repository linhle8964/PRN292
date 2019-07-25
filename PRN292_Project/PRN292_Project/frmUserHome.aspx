<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserHome.aspx.cs" Inherits="PRN292_Project.frmUserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" runat="server" media="screen" href="/CSS/UserHome.css" />
    <style type="text/css">
        #form1 {
            height: 267px;
        }
    </style>

    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Style.css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="wrap">
            <div class="header">
                <h1>Typemoon</h1>
                <span>Welcome to this website</span>

            </div>
            <div class="menu">
                <a class="active">Home</a>
                <a href="frmUserCategoryList.aspx">Category</a>
                <asp:Label CssClass="search" ID="Label1" runat="server" Text="Search" ForeColor="White"></asp:Label>
                <asp:TextBox CssClass="textsearch" ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="buttonsearch" />
                <div class="float-right">
                    <asp:Label ID="lblUsername" runat="server" CssClass="username"></asp:Label>
                    <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" CssClass="button-logout" />
                </div>
            </div>

            <div class="body-content">
                <div class="title">Vote by User</div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" CssClass="gridview">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Average Score" HeaderText="Avarage Score" />
                        <asp:TemplateField HeaderText="Go">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnGo" runat="server" OnClick="btnGo_Click">Go</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:GridView>
            </div>
            <!--#include file="footer.html" -->
            <%-- #include file="footer.html"--%>
        </div>
    </form>
</body>
</html>
