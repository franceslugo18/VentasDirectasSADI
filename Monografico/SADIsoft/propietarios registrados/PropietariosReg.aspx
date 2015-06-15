<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="PropietariosReg.aspx.cs" Inherits="SADIsoft.propietarios_registrados.PropietariosReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Propietarios Registrados</legend>

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
            <div class="form-group">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="PropietarioId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="PropietarioId" HeaderText="PropietarioId" InsertVisible="False" ReadOnly="True" SortExpression="PropietarioId" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                        <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                        <asp:BoundField DataField="Telefono1" HeaderText="Telefono1" SortExpression="Telefono1" />
                        <asp:BoundField DataField="Telefono2" HeaderText="Telefono2" SortExpression="Telefono2" />
                        <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" SortExpression="NombreUsuario" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                
       
       

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SadiConnectionString %>" SelectCommand="SELECT P.PropietarioId, P.Nombre, P.Apellido, P.Cedula, P.Direccion, P.Telefono1, P.Telefono2, U.NombreUsuario, U.Estado FROM Propietarios AS P LEFT JOIN Usuarios AS U ON P.UsuarioId = U.UsuarioId" UpdateCommand="USP_Actualizar_Propietario" UpdateCommandType="StoredProcedure">
                    <UpdateParameters>
                        <asp:Parameter Name="PropietarioID" Type="Int32" />
                        <asp:Parameter Name="Tel1" Type="String" />
                        <asp:Parameter Name="Tel2" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>

            
        </fieldset>
    </form>
</asp:Content>
