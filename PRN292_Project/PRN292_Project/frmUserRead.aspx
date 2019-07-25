<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserRead.aspx.cs" Inherits="PRN292_Project.frmUserRead" %>

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
                <h1>Typemoon</h1>
                <span>Welcome to this website</span>

            </div>
            <div class="menu">
                <a class="active" href="frmUserHome.aspx">Home</a>
                <a href="frmUserCategoryList.aspx">Category</a>
                <div class="float-right">
                    <asp:Label ID="lblUsername" runat="server" CssClass="username"></asp:Label>
                    <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" CssClass="button-logout" />
                </div>
            </div>
            <div class="body-content">
                <div class="center-line">
                    <asp:Label ID="Label2" runat="server" Text="Load Title vào đây" Font-Bold="True" Font-Size="Large"></asp:Label>
                </div>
                &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="textread" ReadOnly="True"></asp:TextBox>

                <div class="groupbutton">
                    <asp:LinkButton ID="btnPrevious" runat="server" OnClick="btnPrevious_Click">Previous Chapter</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click">Back To Home Page</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click">Next Chapter</asp:LinkButton>
                    <br />
                </div>
            </div>
            <!--#include file="footer.html" -->
        </div>
    </form>
</body>
</html>
