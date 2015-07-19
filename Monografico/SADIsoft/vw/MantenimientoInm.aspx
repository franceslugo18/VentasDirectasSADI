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

    <script type="text/javascript">
        function Mensaje() {
            alert('Datos Actualizados');
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Mantenimiento Inmubles</legend>
            

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textAlquilerP">Precio Alquiler</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPrecioAlquiler1" runat="server" type="text" class="form-control input-md" placeholder="Precio Alquiler" required ></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textDepositos">Depositos</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox1" runat="server" type="text" class="form-control input-md" placeholder="Depositos" required ></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNiveles">Niveles</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control input-md" placeholder="Niveles" required ></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="texthabitaciones">Habitaciones</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox3" runat="server" type="text" class="form-control input-md" placeholder="Habitaciones" required ></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textbanios">Baños</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox4" runat="server" type="text" class="form-control input-md" placeholder="Baños" required ></asp:TextBox>
                   
                </div>
            </div>

             
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textarea">Comentario</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtComentarios1" runat="server" Height="58px" TextMode="MultiLine" Width="308px"></asp:TextBox>
                </div>
            </div>

            <!-- Multiple Radios -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="radios">Modificar Imagenes</label>
                <div class="col-md-4">
                    <div class="radio">
                        <label for="radios-0">
                            <asp:RadioButton ID="RadioButton1" GroupName="activa" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="RadioButton1_CheckedChanged" />    
                            Si
                        </label>
                    </div>
                    <div class="radio">
                        <label for="radios-1">
                            <asp:RadioButton ID="RadioButton2" GroupName="activa" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" />  
                            No
                        </label>
                    </div>
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
                    <asp:Button ID="btnRegistrar1" runat="server" Text="Actualizar" class="btn btn-primary" OnClick="btnRegistrar1_Click" />
                </div>
            </div>
               <!-- Text input-->
            <div class="form-group" id="centra">
                <div class="col-md-4">
                    <asp:GridView ID="GridView1" CssClass="grip2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="770px" DataKeyNames="InmuebleId">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                            <asp:BoundField DataField="PrecioAlquiler" HeaderText="PrecioAlquiler" SortExpression="PrecioAlquiler" />
                            <asp:BoundField DataField="Depositos" HeaderText="Depositos" SortExpression="Depositos" />
                            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                            <asp:BoundField DataField="NumeroPlantas" HeaderText="NumeroPlantas" SortExpression="NumeroPlantas" />
                            <asp:BoundField DataField="Habitaciones" HeaderText="Habitaciones" SortExpression="Habitaciones" />
                            <asp:BoundField DataField="Banos" HeaderText="Banos" SortExpression="Banos" />
                            <asp:BoundField DataField="InmuebleId" HeaderText="InmuebleId" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
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

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT Propietarios.Nombre + ' ' + Propietarios.Apellido AS Nombre, PrecioAlquiler, Depositos, Observaciones, NumeroPlantas, Habitaciones, Banos, InmuebleId FROM Inmuebles INNER JOIN Propietarios ON Inmuebles.PropietarioId = Propietarios.PropietarioId WHERE Inmuebles.isEliminado = @isEliminado ORDER BY Nombre">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="isEliminado" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>


        </fieldset>
    </form>
</asp:Content>
