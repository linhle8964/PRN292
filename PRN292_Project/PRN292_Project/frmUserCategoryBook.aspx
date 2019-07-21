<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserCategoryBook.aspx.cs" Inherits="PRN292_Project.frmUserCategoryBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 266px">
    
        <asp:Label ID="lblUsername" runat="server"></asp:Label>
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" />
        <br />
        <br />
        <asp:LinkButton ID="btnHome" runat="server" OnClick="btnHome_Click">Home Page</asp:LinkButton>
        <br />
        <br />
        <asp:Label ID="lblCategoryName" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Width="656px">
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
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
