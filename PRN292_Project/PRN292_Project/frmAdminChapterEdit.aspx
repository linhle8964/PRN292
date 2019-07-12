<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminChapterEdit.aspx.cs" Inherits="PRN292_Project.frmAdminChapterEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 311px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 205px">
    
        <asp:Label ID="Label1" runat="server" Text="Chapter ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblChapterID" runat="server" Text="Load chapterID vào đây"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Content"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtContent" runat="server" Height="122px" OnTextChanged="TextBox2_TextChanged" TextMode="MultiLine" Width="800px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="btnEdit" runat="server" Text="Edit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack" runat="server" Text="Back to Previous Page" />
    
    </div>
    </form>
</body>
</html>
