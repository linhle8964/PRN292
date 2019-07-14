<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminBookAdd.aspx.cs" Inherits="PRN292_Project.frmAdminBookAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 368px">
    
        <asp:Label ID="Label5" runat="server" Text="Book ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBookID" runat="server"></asp:TextBox>
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
        <asp:Label ID="Label4" runat="server" Text="Category"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" PageSize="3" Width="631px" DataKeyNames="CategoryID" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                <asp:TemplateField HeaderText="Add Category">
                    <ItemTemplate>
                        <asp:Button ID="btnAddCategory" runat="server" OnClick="btnAddCategory_Click" Text="Add" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
