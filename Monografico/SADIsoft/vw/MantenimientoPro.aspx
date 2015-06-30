<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="MantenimientoPro.aspx.cs" Inherits="SADIsoft.propietarios_registrados.PropietariosReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #centra 
        {
            margin-left:5px;
        }
        /*Estilo general para el gridView*/
    .grip {
        margin:0 auto;
        font-size:11px;
        text-align:center;
        border:hidden;
    }
    /*Selecciona las filas pares y las colorea*/
    .grip tr:nth-child(even)
    {
        background-color: #a9c673;
    }
    /*Selecciona las filas impares y las colorea*/
    .grip tr:nth-child(odd)
    {
        background-color: #fff;
    }
    /*Estilo para las casillas del gridView*/
    .grip td {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    .gridViewHeader{
        height:35px;
    }
     /*Estilo para las Cabezeras del gridView*/
    .grip th {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Mantenimiento Propietarios</legend>

              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textTele">Telefono 1</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTelefonops1" runat="server" type="text" class="form-control input-md" placeholder="Telefono" ></asp:TextBox>
                   
                </div>
            </div>

              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textTelefono2">Telefono 2</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTelefonos2" runat="server" type="text" class="form-control input-md" placeholder="Email" ></asp:TextBox>
                   
                </div>
            </div>

             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="txtDireccion">Direccion</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDireccion" runat="server" type="text" class="form-control input-md" placeholder="Email"></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textEmail">Email</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextEmail" runat="server" type="text" class="form-control input-md" placeholder="Email"></asp:TextBox>
                   
                </div>
            </div>
                  <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="label"></label>
                <div class="col-md-4">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
             <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnActualizarP" runat="server" Text="Actualizar" class="btn btn-primary" OnClick="btnActualizarP_Click"/>
                </div>
            </div>


              <!-- Text input-->
            <div class="form-group" id="centra">
                <div class="col-md-4">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="grip" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="PropietarioId" DataSourceID="SqlDataSource1" ForeColor="Black" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="900px" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="PropietarioId" HeaderText="PropietarioId" InsertVisible="False" ReadOnly="True" SortExpression="PropietarioId" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                        <asp:BoundField DataField="Cedula" HeaderText="Cedula" ReadOnly="True" SortExpression="Cedula" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                        <asp:BoundField DataField="Telefono1" HeaderText="Telefono1" ReadOnly="True" SortExpression="Telefono1" />
                        <asp:BoundField DataField="Telefono2" HeaderText="Telefono2" ReadOnly="True" SortExpression="Telefono2" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
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
                
       
       

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT 
P.PropietarioId, 
P.Nombre + ' ' + P.Apellido AS Nombre,
SUBSTRING(P.Cedula,0,4) + '-' +  SUBSTRING(P.Cedula,4,7) + '-' + SUBSTRING(P.Cedula,8,1) AS Cedula, 
P.Direccion, 
ISNULL(SUBSTRING(P.Telefono1,0,4) + '-' + SUBSTRING(P.Telefono1,4,3) + '-' + SUBSTRING(P.Telefono1,7,4),'N/A') AS Telefono1,
ISNULL(SUBSTRING(P.Telefono2,0,4) + '-' + SUBSTRING(P.Telefono2,4,3) + '-' + SUBSTRING(p.Telefono2,7,4),'N/A') AS Telefono2, 
ISNULL(U.NombreUsuario,'') AS Email, 
CASE 
	WHEN(U.Estado = 1) THEN 'Activo' ELSE 'Inactivo' END Estado 

FROM Propietarios AS P LEFT JOIN Usuarios AS U ON P.UsuarioId = U.UsuarioId
" UpdateCommand="USP_Actualizar_Propietario" UpdateCommandType="StoredProcedure">
                    <UpdateParameters>
                        <asp:Parameter Name="PropietarioID" Type="Int32" />
                        <asp:Parameter Name="Tel1" Type="String" />
                        <asp:Parameter Name="Tel2" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </div>

            
        </fieldset>
    </form>
</asp:Content>
