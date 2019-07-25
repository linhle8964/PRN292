<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminBookAdd.aspx.cs" Inherits="PRN292_Project.frmAdminBookAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Style.css" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="wrap">
                <div class="header">
                    <h1>Admin Page</h1>

                </div>
                <div class="menu">
                    <a class="active" href="frmAdminBook.aspx">Home</a>
                    <a href="frmAdminBookAdd.aspx">Add Book</a>
                    <div class="float-right">
                        <asp:Label ID="lblUsername" runat="server" CssClass="username"></asp:Label>
                        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" CssClass="button-logout" />
                    </div>
                </div>

        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Summary"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtSummary" runat="server" Height="80px" TextMode="MultiLine" Width="707px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Author"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <asp:Button CssClass="button-logout" ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Book" />
    <!--#include file="footer.html" -->
    </div>
    </form>
</body>
</html>
