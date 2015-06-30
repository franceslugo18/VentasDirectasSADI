<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="MantenimientoInm.aspx.cs" Inherits="SADIsoft.vw.MantenimientoInm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #centra {
            margin-left: 5px;
        }
           /*Estilo general para el gridView*/
    .grip2 {
        margin:0 auto;
        font-size:11px;
        text-align:center;
        border:hidden;
    }
    /*Selecciona las filas pares y las colorea*/
    .grip2 tr:nth-child(even)
    {
        background-color: #a9c673;
    }
    /*Selecciona las filas impares y las colorea*/
    .grip2 tr:nth-child(odd)
    {
        background-color: #fff;
    }
    /*Estilo para las casillas del gridView*/
    .grip2 td {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    .gridViewHeader{
        height:35px;
    }
     /*Estilo para las Cabezeras del gridView*/
    .grip2 th {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Mantenimiento Inmubles</legend>
            

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textTipo">Tipo</label>
                <div class="col-md-4"> 
                    <asp:RadioButton ID="rbAlquiler1" runat="server" GroupName="tipo" Text="Alquiler" AutoPostBack="True" />
                    <asp:RadioButton ID="rbVenta1" runat="server" GroupName="tipo" Text="Venta" AutoPostBack="True" />
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textAlquilerP">Precio Alquiler</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPrecioAlquiler1" runat="server" type="text" class="form-control input-md" placeholder="Precio Alquiler" required ></asp:TextBox>
                   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textDeposito">Depositos</label>
                <div class="col-md-4"> 
                    <asp:DropDownList ID="ddlDepositos1" runat="server" class="form-control">
                        <asp:ListItem>-Seleccione-</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textPrecioV">Precio Venta</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPrecioVenta1" runat="server" type="text" class="form-control input-md" placeholder="Precio Venta" required ></asp:TextBox>
                   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNiveles">Niveles</label>
                <div class="col-md-4"> 
                    <asp:DropDownList ID="ddlNiveles1" runat="server" class="form-control">
                        <asp:ListItem>-Seleccione-</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textTipoIn">Tipo Inmueble</label>
                <div class="col-md-4"> 
                    <asp:RadioButton ID="rbVivienda1" runat="server" GroupName="tipoInmueble" Text="Vivienda" />
                    <asp:RadioButton ID="rbLocal1" runat="server" GroupName="tipoInmueble" Text="Local Comercial" />
                </div>
            </div>

             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textHabitaciones">Habitaciones</label>
                <div class="col-md-4"> 
                    <asp:DropDownList ID="ddlHabitaciones1" runat="server" class="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textBanios">Baños</label>
                <div class="col-md-4"> 
                    <asp:DropDownList ID="ddlBanos1" runat="server" class="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textoption"></label>
                <div class="col-md-4">
                    <asp:CheckBox ID="cbSotano1" runat="server" Text="Sotano" />
                    <asp:CheckBox ID="cbPiscina1" runat="server" Text="Pisina" />
                    <asp:CheckBox ID="cbMarquesina1" runat="server" Text="Marquesina" />
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textNombre">Cantidad Vehiculos</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlCapacidadMarquesina1" runat="server" class="form-control" Width="280px">
                                <asp:ListItem >-Seleccione-</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textarea">Comentario</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtComentarios1" runat="server" Height="58px" TextMode="MultiLine" Width="308px"></asp:TextBox>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textfoto1">Fotos</label>
            </div>

            <!-- File Button --> 
            <div class="form-group">
                <label class="col-md-4 control-label" for="filebutton">Imagen 1</label>
                <div class="col-md-4">
                    <asp:FileUpload ID="FileUpload1" runat="server" class="input-file" type="file" />
                </div>
            </div>

            <!-- File Button --> 
            <div class="form-group">
                <label class="col-md-4 control-label" for="filebutton">Imagen 2</label>
                <div class="col-md-4">
                    <asp:FileUpload ID="FileUpload2" runat="server" class="input-file" type="file" />
                </div>
            </div>

            <!-- File Button --> 
            <div class="form-group">
                <label class="col-md-4 control-label" for="filebutton">Imagen 3</label>
                <div class="col-md-4">
                    <asp:FileUpload ID="FileUpload3" runat="server" class="input-file" type="file" />
                </div>
            </div>

            <!-- File Button --> 
            <div class="form-group">
                <label class="col-md-4 control-label" for="filebutton">Imagen 4</label>
                <div class="col-md-4">
                    <asp:FileUpload ID="FileUpload4" runat="server" class="input-file" type="file" />
                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnRegistrar1" runat="server" Text="Aptualizar" class="btn btn-primary" />
                </div>
            </div>
               <!-- Text input-->
            <div class="form-group" id="centra">
                <div class="col-md-4">
                    <asp:GridView ID="GridView1" CssClass="grip2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="770px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="InmuebleId" HeaderText="InmuebleId" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
                            <asp:BoundField DataField="PrecioVenta" HeaderText="PrecioVenta" SortExpression="PrecioVenta" />
                            <asp:BoundField DataField="PrecioAlquiler" HeaderText="PrecioAlquiler" SortExpression="PrecioAlquiler" />
                            <asp:BoundField DataField="DireccionId" HeaderText="DireccionId" SortExpression="DireccionId" />
                            <asp:CheckBoxField DataField="TipoInmueble" HeaderText="TipoInmueble" SortExpression="TipoInmueble" />
                            <asp:BoundField DataField="Habitaciones" HeaderText="Habitaciones" SortExpression="Habitaciones" />
                            <asp:BoundField DataField="PropietarioId" HeaderText="PropietarioId" SortExpression="PropietarioId" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT [InmuebleId], [PrecioVenta], [PrecioAlquiler], [DireccionId], [TipoInmueble], [Habitaciones], [PropietarioId] FROM [Inmuebles]"></asp:SqlDataSource>

                </div>
            </div>


        </fieldset>
    </form>
</asp:Content>
