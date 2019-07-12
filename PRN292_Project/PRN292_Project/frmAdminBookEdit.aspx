<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminBookEdit.aspx.cs" Inherits="PRN292_Project.frmAdminBookEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 929px">
    
        <asp:Label ID="Label1" runat="server" Text="Book ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoodID" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblSummary" runat="server" Text="Summary"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:TextBox ID="txtSummary" runat="server" Height="74px" TextMode="MultiLine" Width="705px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Author"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnEdit" runat="server" Text="Edit" />
        <br />
        <br />
        <asp:GridView ID="GridViewBookDetail" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" PageSize="3" Width="698px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Summary" HeaderText="Summary" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Edit Category"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Delete Category"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" Text="Book Category"></asp:Label>
        <asp:GridView ID="GridViewBookCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" EnableModelValidation="True" ForeColor="Black" GridLines="None" PageSize="3" Width="700px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                <asp:BoundField DataField="CategoryID" HeaderText="Category ID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Add Category"></asp:Label>
        <br />
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="True" Text="List Category"></asp:Label>
        <asp:GridView ID="GridViewCategoryList" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" PageSize="3" Width="700px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CategoryID" HeaderText="ID" />
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
