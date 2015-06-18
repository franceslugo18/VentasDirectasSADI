<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarPagos.aspx.cs" Inherits="SADIsoft.RegistrarPagos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        Inquilino
        <br />
        Introduzca Cedula:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Buscar" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="DataSourceCuotasCliente">
        </asp:GridView>
        <asp:SqlDataSource ID="DataSourceCuotasCliente" runat="server"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Realizar pago a cuota" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
