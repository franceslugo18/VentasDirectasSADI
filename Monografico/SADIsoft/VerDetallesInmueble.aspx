<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="VerDetallesInmueble.aspx.cs" Inherits="SADIsoft.VerDetallesInmueble"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #imagenes 
        {
            margin-left:25px;
        }
        #cuerpo 
        {
            margin-left:25px;
            border:none;
        }
      
    </style>
    
    <!--efecto lightbox-->

    <script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery_min.js"></script>
    <script type="text/javascript" src="js/slimbox2.js"></script>
    <link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" />

    <!--efecto lightbox-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server" class="form-horizontal">
        <fieldset>

            <!-- Form Name -->
            <legend>Detalles Inmuebles</legend>

            <div id="imagenes">
               
                <asp:HyperLink ID="HyperLink1" rel="lightbox" runat="server">
                    <asp:Image ID="Image1" runat="server" Height="161px" Width="190px" />
                </asp:HyperLink>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                <asp:HyperLink ID="HyperLink2" rel="lightbox" runat="server">
                    <asp:Image ID="Image2" runat="server" Height="161px" Width="190px" />
                </asp:HyperLink>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink3" rel="lightbox" runat="server">
                    <asp:Image ID="Image3" runat="server" Height="161px" Width="190px" />
                </asp:HyperLink>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink4" rel="lightbox" runat="server">
                    <asp:Image ID="Image4" runat="server" Height="161px" Width="190px" />
                </asp:HyperLink>

            </div>
            <div id="cuerpo">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        PrecioAlquiler:
                        <asp:TextBox ID="PrecioAlquilerTextBox" runat="server" Text='<%# Bind("PrecioAlquiler") %>' />
                        <br />
                        Depositos:
                        <asp:TextBox ID="DepositosTextBox" runat="server" Text='<%# Bind("Depositos") %>' />
                        <br />
                        Sotano:
                        <asp:TextBox ID="SotanoTextBox" runat="server" Text='<%# Bind("Sotano") %>' />
                        <br />
                        Pisina:
                        <asp:TextBox ID="PisinaTextBox" runat="server" Text='<%# Bind("Pisina") %>' />
                        <br />
                        Observaciones:
                        <asp:TextBox ID="ObservacionesTextBox" runat="server" Text='<%# Bind("Observaciones") %>' />
                        <br />
                        Marquesina:
                        <asp:TextBox ID="MarquesinaTextBox" runat="server" Text='<%# Bind("Marquesina") %>' />
                        <br />
                        CapacidadMarquesina:
                        <asp:TextBox ID="CapacidadMarquesinaTextBox" runat="server" Text='<%# Bind("CapacidadMarquesina") %>' />
                        <br />
                        NumeroPlantas:
                        <asp:TextBox ID="NumeroPlantasTextBox" runat="server" Text='<%# Bind("NumeroPlantas") %>' />
                        <br />
                        Tipo:
                        <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Habitaciones:
                        <asp:TextBox ID="HabitacionesTextBox" runat="server" Text='<%# Bind("Habitaciones") %>' />
                        <br />
                        Banos:
                        <asp:TextBox ID="BanosTextBox" runat="server" Text='<%# Bind("Banos") %>' />
                        <br />
                        Foto1:
                        <asp:TextBox ID="Foto1TextBox" runat="server" Text='<%# Bind("Foto1") %>' />
                        <br />
                        Foto2:
                        <asp:TextBox ID="Foto2TextBox" runat="server" Text='<%# Bind("Foto2") %>' />
                        <br />
                        Foto3:
                        <asp:TextBox ID="Foto3TextBox" runat="server" Text='<%# Bind("Foto3") %>' />
                        <br />
                        Foto4:
                        <asp:TextBox ID="Foto4TextBox" runat="server" Text='<%# Bind("Foto4") %>' />
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
                        PrecioAlquiler:
                        <asp:TextBox ID="PrecioAlquilerTextBox" runat="server" Text='<%# Bind("PrecioAlquiler") %>' />
                        <br />
                        Depositos:
                        <asp:TextBox ID="DepositosTextBox" runat="server" Text='<%# Bind("Depositos") %>' />
                        <br />
                        Sotano:
                        <asp:TextBox ID="SotanoTextBox" runat="server" Text='<%# Bind("Sotano") %>' />
                        <br />
                        Pisina:
                        <asp:TextBox ID="PisinaTextBox" runat="server" Text='<%# Bind("Pisina") %>' />
                        <br />
                        Observaciones:
                        <asp:TextBox ID="ObservacionesTextBox" runat="server" Text='<%# Bind("Observaciones") %>' />
                        <br />
                        Marquesina:
                        <asp:TextBox ID="MarquesinaTextBox" runat="server" Text='<%# Bind("Marquesina") %>' />
                        <br />
                        CapacidadMarquesina:
                        <asp:TextBox ID="CapacidadMarquesinaTextBox" runat="server" Text='<%# Bind("CapacidadMarquesina") %>' />
                        <br />
                        NumeroPlantas:
                        <asp:TextBox ID="NumeroPlantasTextBox" runat="server" Text='<%# Bind("NumeroPlantas") %>' />
                        <br />
                        Tipo:
                        <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Habitaciones:
                        <asp:TextBox ID="HabitacionesTextBox" runat="server" Text='<%# Bind("Habitaciones") %>' />
                        <br />
                        Banos:
                        <asp:TextBox ID="BanosTextBox" runat="server" Text='<%# Bind("Banos") %>' />
                        <br />
                        Foto1:
                        <asp:TextBox ID="Foto1TextBox" runat="server" Text='<%# Bind("Foto1") %>' />
                        <br />
                        Foto2:
                        <asp:TextBox ID="Foto2TextBox" runat="server" Text='<%# Bind("Foto2") %>' />
                        <br />
                        Foto3:
                        <asp:TextBox ID="Foto3TextBox" runat="server" Text='<%# Bind("Foto3") %>' />
                        <br />
                        Foto4:
                        <asp:TextBox ID="Foto4TextBox" runat="server" Text='<%# Bind("Foto4") %>' />
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
                        PrecioAlquiler:
                        <asp:Label ID="PrecioAlquilerLabel" runat="server" Text='<%# Bind("PrecioAlquiler") %>' />
                        <br />
                        Depositos:
                        <asp:Label ID="DepositosLabel" runat="server" Text='<%# Bind("Depositos") %>' />
                        <br />
                        Sotano:
                        <asp:Label ID="SotanoLabel" runat="server" Text='<%# Bind("Sotano") %>' />
                        <br />
                        Pisina:
                        <asp:Label ID="PisinaLabel" runat="server" Text='<%# Bind("Pisina") %>' />
                        <br />
                        Observaciones:
                        <asp:Label ID="ObservacionesLabel" runat="server" Text='<%# Bind("Observaciones") %>' />
                        <br />
                        Marquesina:
                        <asp:Label ID="MarquesinaLabel" runat="server" Text='<%# Bind("Marquesina") %>' />
                        <br />
                        CapacidadMarquesina:
                        <asp:Label ID="CapacidadMarquesinaLabel" runat="server" Text='<%# Bind("CapacidadMarquesina") %>' />
                        <br />
                        NumeroPlantas:
                        <asp:Label ID="NumeroPlantasLabel" runat="server" Text='<%# Bind("NumeroPlantas") %>' />
                        <br />
                        Tipo:
                        <asp:Label ID="TipoLabel" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Habitaciones:
                        <asp:Label ID="HabitacionesLabel" runat="server" Text='<%# Bind("Habitaciones") %>' />
                        <br />
                        Banos:
                        <asp:Label ID="BanosLabel" runat="server" Text='<%# Bind("Banos") %>' />
                        <br />
                        Calle:
                        <asp:Label ID="CalleLabel" runat="server" Text='<%# Bind("Calle") %>' />
                        , Casa
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="USP_Detalle_Inmueble" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InmuebleId" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </fieldset>
    </form>
</asp:Content>

