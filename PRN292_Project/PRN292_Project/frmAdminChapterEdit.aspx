<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminChapterEdit.aspx.cs" Inherits="PRN292_Project.frmAdminChapterEdit" %>

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

        &nbsp;<asp:Label ID="lblSeries" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="Chapter ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblChapterID" runat="server" Text="Load chapterID vào đây"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="cTitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Content"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="textread"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack" runat="server" Text="Back to Previous Page" OnClick="btnBack_Click" />
     <!--#include file="footer.html" -->
    </div>
    </form>
</body>
</html>
