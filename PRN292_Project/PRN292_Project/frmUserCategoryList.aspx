<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserCategoryList.aspx.cs" Inherits="PRN292_Project.frmUserCategoryList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 265px">
    
        <asp:Label ID="lblUsername" runat="server"></asp:Label>
        &nbsp;<asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Width="713px">
            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="ID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnGo" runat="server" OnClick="btnGo_Click">Go</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
