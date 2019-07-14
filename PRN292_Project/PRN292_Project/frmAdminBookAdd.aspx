<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminBookAdd.aspx.cs" Inherits="PRN292_Project.frmAdminBookAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 368px">
    
&nbsp;&nbsp;&nbsp;
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
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Book" />
    
    </div>
    </form>
</body>
</html>
