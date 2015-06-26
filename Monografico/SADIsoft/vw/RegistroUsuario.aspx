<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="SADIsoft.registrar_usuario.RegistroUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Registrar Usuario</legend>

              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textEmail">Email</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtEmail1" runat="server" type="text" class="form-control input-md" placeholder="Email" required ></asp:TextBox>
                   
                    <br />
                    <br />
                    <br />
                    Tipo de Usuario:<br />
                    <asp:RadioButton ID="rbUsuario" runat="server" Checked="True" GroupName="Tipo" Text="Usuario" />
&nbsp;&nbsp;
                    <asp:RadioButton ID="rdAdministrador" runat="server" GroupName="Tipo" Text="Administrador" />
                   
                    <br />
                    <br />
                    Modificar<br />
                    <br />
                    Categoria&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                    <br />
                    <br />
                    Estado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                   
                </div>
            </div>

             <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnRegistrarUsuario" runat="server" Text="Registrar Usuario" class="btn btn-primary" OnClick="btnRegistrarUsuario_Click"/>
                </div>
            </div>
        </fieldset>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UsuarioId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="555px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" SortExpression="NombreUsuario" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" ReadOnly="True" SortExpression="Categoria" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT UsuarioId, NombreUsuario, 
	   CASE (Tipo) WHEN 1 THEN 'Administrador' WHEN 2 THEN 'Usuario' WHEN 3 THEN 'Propietario' END Categoria, 
	   CASE (Estado) WHEN 0 THEN 'Activo' WHEN 1 THEN 'Inactivo' END Estado 
FROM Usuarios
ORDER BY Categoria"></asp:SqlDataSource>
        <br />
    </form>
</asp:Content>
