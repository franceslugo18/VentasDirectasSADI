<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="MantenimientoContratos.aspx.cs" Inherits="SADIsoft.vw.MantenimientoContratos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    Contratos Activos
    <br/>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ContratoId" DataSourceID="SqlDataSource1" ForeColor="Black">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ContratoId" HeaderText="Contrato No." InsertVisible="False" ReadOnly="True" SortExpression="ContratoId" />
            <asp:BoundField DataField="Column1" HeaderText="Contrato Anterior" ReadOnly="True" SortExpression="Column1" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha de creacion" SortExpression="Fecha" />
            <asp:BoundField DataField="NombreCli" HeaderText="Nombre de Cliente" ReadOnly="True" SortExpression="NombreCli" />
            <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT C.ContratoId, ISNULL(C.ContratoAnteriorId,0), C.Fecha, Cl.Nombre + ' ' + Cl.Apellido AS NombreCli,Cl.Cedula 
FROM Contratos AS C INNER JOIN Clientes AS Cl ON C.ClienteId = Cl.ClienteId
WHERE isActivo = 1
"></asp:SqlDataSource>
        <br />
        <br />
    <asp:Button ID="Button1" runat="server" Text="Cancelar Contrato" OnClick="Button1_Click" />

</form>

</asp:Content>
