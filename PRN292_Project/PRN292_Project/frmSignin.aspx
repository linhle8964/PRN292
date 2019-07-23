<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSignin.aspx.cs" Inherits="PRN292_Project.frmSignin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Style.css" />
    <link rel="stylesheet" runat="server" media="screen" href="/CSS/Login.css" />
    <style type="text/css">
        .auto-style1 {
            height: 20px;
            width: 178px;
        }
        .auto-style2 {
            height: 20px;
            width: 300px;
        }
        .auto-style3 {
            width: 300px;
        }
        .auto-style4 {
            width: 178px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 277px">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;
        <div class="wrap">
            <div class="title">Register</div>
        <table style="width:100%; background-color:#ffffcc" >
            <tr>
                <td class="auto-style1">
                    User Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUsername" runat="server" Width="206px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    Password</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="206px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style4">
                    Email</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" Width="206px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style4">
                    Address</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAddress" runat="server" Width="206px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style4">
                    Phone</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPhone" runat="server" Width="206px"></asp:TextBox>
                </td>
                
            </tr>
        </table>
    
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnSignin" runat="server" OnClick="btnSignin_Click" Text="Register"  CssClass="button-register" />
    </div>
    </div>
    </form>
</body>
</html>
