<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserHome.aspx.cs" Inherits="PRN292_Project.frmUserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 267px;
        }
    </style>

    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
        <asp:Label ID="lblUsername" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" />
        <br />
            </div>
        <asp:Label ID="Label1" runat="server" Text="Home Page"></asp:Label>
        <br />
    <div style="height: 67px">
    
        <asp:Label ID="Label2" runat="server" Text="Search"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
        <br />
        <br />
        <asp:LinkButton ID="btnCategory" runat="server" OnClick="btnCategory_Click">Search Book by Category</asp:LinkButton>
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
