<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="SADIsoft.registrar_usuario.RegistroUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #a1 
        {
            float:left;
            margin-left:10px;
       
        }
    #a2 
    {
        float:left;
        margin-left:10px;
    }
    #a3
    {
        float:left;
        margin-left:10px;
    }
    #a4 
    {
        float:left;
        margin-left:10px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Mantenimiento Usuario</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textEmail">Email</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextEmail" runat="server" type="text" class="form-control input-md" placeholder="Email O Usuario"></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group"">
                <asp:Label ID="laTipo" class="col-md-4 control-label" Visible="false" runat="server" Text="Tipo Usuario"></asp:Label>
                <div class="col-md-4"> 
                    <asp:RadioButton ID="rbAd" runat="server" Visible="false" Checked="false" GroupName="tipoUsuario" Text="Usuario" />
                    <asp:RadioButton ID="rbUsu" Checked="true" Visible="false" runat="server" GroupName="tipoUsuario" Text="Administrador" />
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <asp:Label ID="laEstado" class="col-md-4 control-label" runat="server" Text="Estado"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtcategoria" runat="server" Width="100px" type="text" class="form-control input-md"></asp:TextBox>
                   <asp:RadioButton ID="c1" runat="server" Visible="false" Checked="false" GroupName="tipoUsuario" Text="Activo" />
                    <asp:RadioButton ID="c2" Checked="false" Visible="false" runat="server" GroupName="tipoUsuario" Text="Inactivo" />
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <asp:Label ID="laCategoria" class="col-md-4 control-label" runat="server" Text="Categoria"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtestado" runat="server" Width="100px" type="text" class="form-control input-md"></asp:TextBox>
                    <asp:RadioButton ID="r1" runat="server" Visible="false" Checked="false" GroupName="tipo" Text="Usuario" />
                    <asp:RadioButton ID="r2" Checked="false" Visible="false" runat="server" GroupName="tipo" Text="Administrador" />
                </div>
            </div>
            
            <!-- Button -->
            <div class="form-group" id="a1">
                <label class="col-md-4 control-label" for="btn"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" class="btn btn-primary" OnClick="btnNuevo_Click" Width="86px"/>
                &nbsp;&nbsp;
                </div>
            </div>

            <!-- Button -->
            <div class="form-group" id="a2">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" class="btn btn-primary" OnClick="btnRegistrarUsuario_Click" Enabled="False" Width="82px"/>
                &nbsp;&nbsp;
                </div>
            </div>

             <!-- Button -->
            <div class="form-group" id="a3">
                <label class="col-md-4 control-label" for="btn"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" class="btn btn-primary"  Enabled="False" Width="82px" OnClick="btnActualizar_Click"/>
                &nbsp;&nbsp;
                </div>
            </div>

             <!-- Button -->
            <div class="form-group" id="a4">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" class="btn btn-primary" Width="82px" Enabled="False"/>
                &nbsp;&nbsp;
                </div>
            </div>


        </fieldset>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UsuarioId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="555px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" SortExpression="NombreUsuario" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" ReadOnly="True" SortExpression="Categoria" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT UsuarioId, NombreUsuario, 
	   CASE (Tipo) WHEN 1 THEN 'Administrador' WHEN 2 THEN 'Usuario' WHEN 3 THEN 'Propietario' END Categoria, 
	   CASE (Estado) WHEN 0 THEN 'Inactivo' WHEN 1 THEN 'Activo' END Estado 
FROM Usuarios
ORDER BY Categoria"></asp:SqlDataSource>
        <br />
    </form>
</asp:Content>
