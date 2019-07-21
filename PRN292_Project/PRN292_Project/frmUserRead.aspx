<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserRead.aspx.cs" Inherits="PRN292_Project.frmUserRead" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 360px">
    
        <asp:Label ID="lblUsername" runat="server"></asp:Label>
        <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click">Log Out</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="btnHome" runat="server" OnClick="btnHome_Click">Home Page</asp:LinkButton>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Load Title vào đây"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="182px" TextMode="MultiLine" Width="775px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:LinkButton ID="btnPrevious" runat="server" OnClick="btnPrevious_Click">Previous Chapter</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click">Back To Home Page</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click">Next Chapter</asp:LinkButton>
        <br />
    
    </div>
    </form>
</body>
</html>
