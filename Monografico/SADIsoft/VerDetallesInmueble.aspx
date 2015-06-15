<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerDetallesInmueble.aspx.cs" Inherits="SADIsoft.VerDetallesInmueble" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Image ID="Image1" runat="server" Height="161px" Width="190px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image2" runat="server" Height="161px" Width="190px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image3" runat="server" Height="161px" Width="190px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image4" runat="server" Height="161px" Width="190px" />
    
    </div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                Tipo:
                <asp:CheckBox ID="TipoCheckBox" runat="server" Checked='<%# Bind("Tipo") %>' />
                <br />
                PrecioVenta:
                <asp:TextBox ID="PrecioVentaTextBox" runat="server" Text='<%# Bind("PrecioVenta") %>' />
                <br />
                PrecioAlquiler:
                <asp:TextBox ID="PrecioAlquilerTextBox" runat="server" Text='<%# Bind("PrecioAlquiler") %>' />
                <br />
                Depositos:
                <asp:TextBox ID="DepositosTextBox" runat="server" Text='<%# Bind("Depositos") %>' />
                <br />
                Sotano:
                <asp:CheckBox ID="SotanoCheckBox" runat="server" Checked='<%# Bind("Sotano") %>' />
                <br />
                Piscina:
                <asp:CheckBox ID="PiscinaCheckBox" runat="server" Checked='<%# Bind("Piscina") %>' />
                <br />
                Observaciones:
                <asp:TextBox ID="ObservacionesTextBox" runat="server" Text='<%# Bind("Observaciones") %>' />
                <br />
                Marquesina:
                <asp:CheckBox ID="MarquesinaCheckBox" runat="server" Checked='<%# Bind("Marquesina") %>' />
                <br />
                CapacidadMarquesina:
                <asp:TextBox ID="CapacidadMarquesinaTextBox" runat="server" Text='<%# Bind("CapacidadMarquesina") %>' />
                <br />
                NumeroPlantas:
                <asp:TextBox ID="NumeroPlantasTextBox" runat="server" Text='<%# Bind("NumeroPlantas") %>' />
                <br />
                TipoInmueble:
                <asp:CheckBox ID="TipoInmuebleCheckBox" runat="server" Checked='<%# Bind("TipoInmueble") %>' />
                <br />
                Habitaciones:
                <asp:TextBox ID="HabitacionesTextBox" runat="server" Text='<%# Bind("Habitaciones") %>' />
                <br />
                Banos:
                <asp:TextBox ID="BanosTextBox" runat="server" Text='<%# Bind("Banos") %>' />
                <br />
                Calle:
                <asp:TextBox ID="CalleTextBox" runat="server" Text='<%# Bind("Calle") %>' />
                <br />
                Numero:
                <asp:TextBox ID="NumeroTextBox" runat="server" Text='<%# Bind("Numero") %>' />
                <br />
                Provincia:
                <asp:TextBox ID="ProvinciaTextBox" runat="server" Text='<%# Bind("Provincia") %>' />
                <br />
                Municipio:
                <asp:TextBox ID="MunicipioTextBox" runat="server" Text='<%# Bind("Municipio") %>' />
                <br />
                Sector:
                <asp:TextBox ID="SectorTextBox" runat="server" Text='<%# Bind("Sector") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Tipo:
                <asp:CheckBox ID="TipoCheckBox" runat="server" Checked='<%# Bind("Tipo") %>' />
                <br />
                PrecioVenta:
                <asp:TextBox ID="PrecioVentaTextBox" runat="server" Text='<%# Bind("PrecioVenta") %>' />
                <br />
                PrecioAlquiler:
                <asp:TextBox ID="PrecioAlquilerTextBox" runat="server" Text='<%# Bind("PrecioAlquiler") %>' />
                <br />
                Depositos:
                <asp:TextBox ID="DepositosTextBox" runat="server" Text='<%# Bind("Depositos") %>' />
                <br />
                Sotano:
                <asp:CheckBox ID="SotanoCheckBox" runat="server" Checked='<%# Bind("Sotano") %>' />
                <br />
                Piscina:
                <asp:CheckBox ID="PiscinaCheckBox" runat="server" Checked='<%# Bind("Piscina") %>' />
                <br />
                Observaciones:
                <asp:TextBox ID="ObservacionesTextBox" runat="server" Text='<%# Bind("Observaciones") %>' />
                <br />
                Marquesina:
                <asp:CheckBox ID="MarquesinaCheckBox" runat="server" Checked='<%# Bind("Marquesina") %>' />
                <br />
                CapacidadMarquesina:
                <asp:TextBox ID="CapacidadMarquesinaTextBox" runat="server" Text='<%# Bind("CapacidadMarquesina") %>' />
                <br />
                NumeroPlantas:
                <asp:TextBox ID="NumeroPlantasTextBox" runat="server" Text='<%# Bind("NumeroPlantas") %>' />
                <br />
                TipoInmueble:
                <asp:CheckBox ID="TipoInmuebleCheckBox" runat="server" Checked='<%# Bind("TipoInmueble") %>' />
                <br />
                Habitaciones:
                <asp:TextBox ID="HabitacionesTextBox" runat="server" Text='<%# Bind("Habitaciones") %>' />
                <br />
                Banos:
                <asp:TextBox ID="BanosTextBox" runat="server" Text='<%# Bind("Banos") %>' />
                <br />
                Calle:
                <asp:TextBox ID="CalleTextBox" runat="server" Text='<%# Bind("Calle") %>' />
                <br />
                Numero:
                <asp:TextBox ID="NumeroTextBox" runat="server" Text='<%# Bind("Numero") %>' />
                <br />
                Provincia:
                <asp:TextBox ID="ProvinciaTextBox" runat="server" Text='<%# Bind("Provincia") %>' />
                <br />
                Municipio:
                <asp:TextBox ID="MunicipioTextBox" runat="server" Text='<%# Bind("Municipio") %>' />
                <br />
                Sector:
                <asp:TextBox ID="SectorTextBox" runat="server" Text='<%# Bind("Sector") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Tipo:
                <asp:CheckBox ID="TipoCheckBox" runat="server" Checked='<%# Bind("Tipo") %>' Enabled="false" />
                <br />
                PrecioVenta:
                <asp:Label ID="PrecioVentaLabel" runat="server" Text='<%# Bind("PrecioVenta") %>' />
                <br />
                PrecioAlquiler:
                <asp:Label ID="PrecioAlquilerLabel" runat="server" Text='<%# Bind("PrecioAlquiler") %>' />
                <br />
                Depositos:
                <asp:Label ID="DepositosLabel" runat="server" Text='<%# Bind("Depositos") %>' />
                <br />
                Sotano:
                <asp:CheckBox ID="SotanoCheckBox" runat="server" Checked='<%# Bind("Sotano") %>' Enabled="false" />
                <br />
                Piscina:
                <asp:CheckBox ID="PiscinaCheckBox" runat="server" Checked='<%# Bind("Piscina") %>' Enabled="false" />
                <br />
                Observaciones:
                <asp:Label ID="ObservacionesLabel" runat="server" Text='<%# Bind("Observaciones") %>' />
                <br />
                Marquesina:
                <asp:CheckBox ID="MarquesinaCheckBox" runat="server" Checked='<%# Bind("Marquesina") %>' Enabled="false" />
                <br />
                CapacidadMarquesina:
                <asp:Label ID="CapacidadMarquesinaLabel" runat="server" Text='<%# Bind("CapacidadMarquesina") %>' />
                <br />
                NumeroPlantas:
                <asp:Label ID="NumeroPlantasLabel" runat="server" Text='<%# Bind("NumeroPlantas") %>' />
                <br />
                TipoInmueble:
                <asp:CheckBox ID="TipoInmuebleCheckBox" runat="server" Checked='<%# Bind("TipoInmueble") %>' Enabled="false" />
                <br />
                Habitaciones:
                <asp:Label ID="HabitacionesLabel" runat="server" Text='<%# Bind("Habitaciones") %>' />
                <br />
                Banos:
                <asp:Label ID="BanosLabel" runat="server" Text='<%# Bind("Banos") %>' />
                <br />

                Calle:
                <asp:Label ID="CalleLabel" runat="server" Text='<%# Bind("Calle") %>' />
                <br />
                Numero:
                <asp:Label ID="NumeroLabel" runat="server" Text='<%# Bind("Numero") %>' />
                <br />
                Provincia:
                <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Bind("Provincia") %>' />
                <br />
                Municipio:
                <asp:Label ID="MunicipioLabel" runat="server" Text='<%# Bind("Municipio") %>' />
                <br />
                Sector:
                <asp:Label ID="SectorLabel" runat="server" Text='<%# Bind("Sector") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SadiConnectionString %>" SelectCommand="USP_Detalle_Inmueble" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="InmuebleId" QueryStringField="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
