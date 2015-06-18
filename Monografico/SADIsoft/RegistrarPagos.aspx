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
        <asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label2" runat="server" Text="No. de Contrato:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtNoContrato" runat="server"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Dia de pago:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtDiaPago" runat="server"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Mensualidad:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtMensualidad" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="DataSourceCuotasCliente" AutoGenerateColumns="False" DataKeyNames="FacturaId">
            <Columns>
                <asp:BoundField DataField="FacturaId" HeaderText="FacturaId" InsertVisible="False" ReadOnly="True" SortExpression="FacturaId" />
                <asp:BoundField DataField="NumeroCuota" HeaderText="NumeroCuota" SortExpression="NumeroCuota" />
                <asp:BoundField DataField="Mora" HeaderText="Mora" SortExpression="Mora" />
                <asp:BoundField DataField="TotalCuota" HeaderText="TotalCuota" SortExpression="TotalCuota" />
                <asp:BoundField DataField="FechaGenerada" HeaderText="FechaGenerada" SortExpression="FechaGenerada" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataSourceCuotasCliente" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="select  
		
		Facturas.FacturaId,
		Facturas.NumeroCuota,
		Facturas.Mora,
		Facturas.TotalCuota, 
		Facturas.FechaGenerada 
		 
		 from Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
					   
where Contratos.ContratoId = @ContratoId and Facturas.Estado = 0">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNoContrato" Name="ContratoId" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Realizar pago a cuota" />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click1" Text="Button" />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
