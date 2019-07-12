<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminChapterAdd.aspx.cs" Inherits="PRN292_Project.frmAdminChapterAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 361px">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Add Chapter"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Content"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:TextBox ID="txtContent" runat="server" Height="169px" TextMode="MultiLine" Width="785px"></asp:TextBox>
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back To Previous Page" />
    
    </div>
    </form>
</body>
</html>
