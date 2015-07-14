<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="RegistrarPropietarios.aspx.cs" Inherits="SADIsoft.registrar_propietarios.RegistrarPropietarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #regis 
        {
            margin-left:210px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form class="form-horizontal" runat="server" id="rr">
        <fieldset>

            <!-- Form Name -->
            <legend>Registrar Propietarios</legend>

           <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Nombre</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtNombreP" runat="server" type="text" class="form-control input-md" placeholder="Nombre" required ></asp:TextBox>
                   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Apellido</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtApellidoP" runat="server" type="text" class="form-control input-md" placeholder="Apelllido" required ></asp:TextBox>
                   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Cedula</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCedulaP" runat="server" type="text" class="form-control input-md" placeholder="Cedula" required ></asp:TextBox>
                   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textDireccion">Direccion</label>
                <div class="col-md-4"> 
                    <asp:TextBox ID="txtDireccionP" runat="server" class="form-control" required ></asp:TextBox>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Telefono 1</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTelefonos1P" runat="server" type="text" class="form-control input-md" placeholder="Telefono1" required ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Debe de Introducir un numero de telefono valido" ControlToValidate="txtTelefonos1P" ForeColor="Red" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Telefono 2</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTelefonos2P" runat="server" type="text" class="form-control input-md" placeholder="Telefono Opcional" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Debe de introducir un numero valido" ControlToValidate="txtTelefonos2P" ForeColor="Red" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Email</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtEmail1P" runat="server" type="text" class="form-control input-md" placeholder="Email" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" class="col-md-4 control-label" ControlToValidate="txtEmail1P" ErrorMessage="correo invalido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>

           <!-- Button -->
            <div class="form-group" id="regis">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnRegistrarPropietario" runat="server" Text="Registrar Propietario" class="btn btn-primary" OnClick="btnRegistrarPropietario_Click"/>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="* La cedula no es valida" Visible="False"></asp:Label>
                </div>
            </div>


        </fieldset>
        
        
        
    </form>


</asp:Content>
