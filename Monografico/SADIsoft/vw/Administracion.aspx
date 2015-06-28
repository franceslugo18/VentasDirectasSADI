<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="SADIsoft.vw.Administracion"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        #inqui 
        {
            width:900px;
            height:200px;
            border:solid 1px;
            margin-left:50px;
        }
        #mora 
        {
            width:900px;
            height:200px;
            border:solid 1px;
            margin-left:50px;
        }
         #vence 
        {
            width:900px;
            height:200px;
            border:solid 1px;
            margin-left:50px;
        }
         #actulizado 
        {
            width:900px;
            height:200px;
            border:solid 1px;
            margin-left:50px;
        }
        #tex1 
        {
            margin-left:240px;

        }
        #tex2 
        {
            margin-left:250px;

        }
        #tex3
        {
            margin-left:270px;

        }
        #tex4
        {
            margin-left:220px;

        }



    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form2" class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend></legend>
                   <!-- Text input-->
            <div class="form-group" id="inqui">
                <label class="col-md-4 control-label" for="textPripietario" id="tex1">Inquilinos a Pagar Hoy</label>
                
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
                       
            </div>
               <!-- Text input-->
            <div class="form-group" id="mora">
                <label class="col-md-4 control-label" for="textPripietario" id="tex2" >Inquilinos Con Mora Hoy</label>
                
                    <br />
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
                
            </div>
                <!-- Text input-->
            <div class="form-group" id="vence">
                <label class="col-md-4 control-label" for="textPripietario" id="tex3">Contratos Que Vencen El Proximo Mes</label>
                
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ContratoId" DataSourceID="DataSoruceContratosProximoMes" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView3_RowDataBound">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                            <asp:BoundField DataField="ContratoId" HeaderText="No. Contrato" InsertVisible="False" ReadOnly="True" SortExpression="ContratoId" />
                            <asp:BoundField DataField="CuotaMensual" HeaderText="Cuota Mensual" SortExpression="CuotaMensual" />
                            <asp:BoundField DataField="actualizacion" HeaderText="Tipo de Actualizacion" ReadOnly="True" SortExpression="actualizacion" />
                            <asp:BoundField DataField="Telefono1" HeaderText="Telefono 1" SortExpression="Telefono1" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hyp" runat="server" Text="Detalles"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                
            </div>   
               
                   <!-- Text input-->
            <div class="form-group" id="actulizado">
                
                <label class="col-md-4 control-label" for="textPripietario" id="tex4">Contratos Actulizados</label>
                <br />
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
        </fieldset>
    </form>
</asp:Content>