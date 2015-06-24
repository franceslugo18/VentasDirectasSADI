<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="SADIsoft.vw.Administracion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Inquilinos a pagar hoy<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DataSorucesInquilinosHoy" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                <asp:BoundField DataField="ContratoId" HeaderText="No. Contrato" SortExpression="ContratoId" />
                <asp:BoundField DataField="TotalCuota" HeaderText="Total a Pagar" SortExpression="TotalCuota" />
                <asp:BoundField DataField="Telefono1" HeaderText="Telefono 1" SortExpression="Telefono1" />
                <asp:BoundField DataField="Telefono2" HeaderText="Telefono 2" ReadOnly="True" SortExpression="Telefono2" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="DataSorucesInquilinosHoy" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT Facturas.FechaGenerada, Facturas.ContratoId, Facturas.TotalCuota, Clientes.Nombre + ' ' + Clientes.Apellido AS Nombre, Clientes.Telefono1, ISNULL(Clientes.Telefono2,'') AS Telefono2, ISNULL(Clientes.Email,'') AS Email
FROM Facturas
INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
WHERE Facturas.FechaGenerada = CONVERT(DATE,GETDATE()) AND Facturas.Estado = 0"></asp:SqlDataSource>
        <br />
        <br />
        Inquilinos con Mora hoy<br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DataSourceInquilinosMoraHoy" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                <asp:BoundField DataField="ContratoId" HeaderText="No. Contrato" SortExpression="ContratoId" />
                <asp:BoundField DataField="CuotaMensual" HeaderText="Cuota Mensual" SortExpression="CuotaMensual" />
                <asp:BoundField DataField="Mora" HeaderText="Mora" SortExpression="Mora" />
                <asp:BoundField DataField="TotalCuota" HeaderText="Total Cuota" SortExpression="TotalCuota" />
                <asp:BoundField DataField="Telefono1" HeaderText="Telefono 1" SortExpression="Telefono1" />
                <asp:BoundField DataField="Telefono2" HeaderText="Telefono 2" ReadOnly="True" SortExpression="Telefono2" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="DataSourceInquilinosMoraHoy" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="
SELECT Facturas.FechaGenerada, Facturas.ContratoId, Facturas.TotalCuota, Clientes.Nombre + ' ' + Clientes.Apellido AS Nombre, Clientes.Telefono1, ISNULL(Clientes.Telefono2,'') AS Telefono2, ISNULL(Clientes.Email,'') AS Email, Facturas.CuotaMensual, Facturas.Mora
FROM Facturas
INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
WHERE Facturas.FechaGenerada = DATEADD(dd,-6,CONVERT(DATE,GETDATE())) AND  Facturas.Estado = 0 AND Facturas.isMoraAplicada = 1"></asp:SqlDataSource>
        <br />
        <br />
        Contratos que vencen el proximo mes<br />
        <br />
        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ContratoId" DataSourceID="DataSoruceContratosProximoMes" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                <asp:BoundField DataField="ContratoId" HeaderText="No. Contrato" InsertVisible="False" ReadOnly="True" SortExpression="ContratoId" />
                <asp:BoundField DataField="CuotaMensual" HeaderText="Cuota Mensual" SortExpression="CuotaMensual" />
                <asp:BoundField DataField="actualizacion" HeaderText="Tipo de Actualizacion" ReadOnly="True" SortExpression="actualizacion" />
                <asp:BoundField DataField="Telefono1" HeaderText="Telefono 1" SortExpression="Telefono1" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="DataSoruceContratosProximoMes" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT Contratos.ContratoId, Clientes.Nombre + ' ' + Clientes.Apellido AS Nombre, Clientes.Telefono1, Clientes.Email, CASE Contratos.ActualizarAutom WHEN 0 THEN 'Manual' WHEN 1 THEN 'Automatica' END actualizacion, Contratos.CuotaMensual 
FROM Contratos INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
WHERE CONVERT(DATE,DATEADD(yy,1,Fecha)) = DATEADD(MM,1,CONVERT(DATE,GETDATE())) AND isActivo = 1"></asp:SqlDataSource>
        <br />
        <br />
        Contratos actualizados<br />
        <br />
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ContratoId" DataSourceID="ContratosActualizados" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ContratoId" HeaderText="No. Contrato" InsertVisible="False" ReadOnly="True" SortExpression="ContratoId" />
                <asp:BoundField DataField="ContratoAnterior" HeaderText="Contrato Anterior" ReadOnly="True" SortExpression="ContratoAnterior" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                <asp:BoundField DataField="CuotaMensual" HeaderText="Cuota Mensual Nueva" SortExpression="CuotaMensual" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="ContratosActualizados" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT Contratos.ContratoId, ISNULL(Contratos.ContratoAnteriorId,0) AS ContratoAnterior, Clientes.Nombre + ' ' + Clientes.Apellido AS Nombre, Contratos.CuotaMensual 
FROM Contratos 
INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
WHERE CONVERT(DATE,Fecha) = CONVERT(DATE,GETDATE()) AND ContratoAnteriorId IS NOT NULL"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
