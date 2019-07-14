<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminBook.aspx.cs" Inherits="PRN292_Project.frmAdminBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 286px">
    
        <asp:Button ID="btnAddBook" runat="server" OnClick="btnAddBook_Click" Text="Add Book" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="148px" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="3" Width="600px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="BookID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:TemplateField HeaderText="Chapter">
                    <ItemTemplate>
                        <asp:Button ID="btnDetail" runat="server" OnClick="btnDetail_Click" Text="Detail" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
