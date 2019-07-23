<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="PRN292_Project.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Style.css" />
    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Login.css" />
    <style type="text/css">
        .auto-style1 {
            width: 480px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        
    <div style="height: 239px; width: 611px; margin-right: 0px;">
    <div class="container">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="title">Book Reading Website</div>
        <table style="width: 100%; height: 129px; background-color:#ffffcc" class="table" >
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Role"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>User</asp:ListItem>
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblShow" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" ForeColor="White" CssClass="button-login" />
                    <asp:Button ID="btnSignin" runat="server" Text="Sign In" OnClick="btnSignin_Click" ForeColor="White" CssClass="button-signin" />
    </div>
    </div>
    </form>
</body>
</html>
