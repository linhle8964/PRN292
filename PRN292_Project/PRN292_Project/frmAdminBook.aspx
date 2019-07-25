<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdminBook.aspx.cs" Inherits="PRN292_Project.frmAdminBook" %>

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
                    <a class="active">Home</a>
                    <a href="frmAdminBookAdd.aspx">Add Book</a>
                    <div class="float-right">
                        <asp:Label ID="lblUsername" runat="server" CssClass="username"></asp:Label>
                        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" CssClass="button-logout" />
                    </div>
                </div>
    
        <br />
        <br />
        <asp:GridView CssClass="gridview" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="148px" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="BookID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:TemplateField HeaderText="Chapter">
                    <ItemTemplate>
                        <asp:Button ID="btnDetail" runat="server" OnClick="btnDetail_Click" Text="Detail" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ButtonType="Button" />
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
    <!--#include file="footer.html" -->
    </div>
    </form>
</body>
</html>
