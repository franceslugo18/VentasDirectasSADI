<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="VerticalMenueP.aspx.cs" Inherits="SADIsoft.prueba.VerticalMenueP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        
        #MainMenu
        {
            width:400px;
            margin-left:5px;
            margin-top:50px;
            float:left;
        }
        #pp
        {
            width:900px;
            height:600px;
            border:solid 1px;
            float:right;
            margin-right:10px;
            margin-top:50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div id="MainMenu">
        <div class="list-group panel">
            <label>Menu Admin</label>
            
            <a href="#demo1" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Propietarios</a>
            <div class="collapse" id="demo1">
                <a href="#SubMenu1" class="list-group-item" data-toggle="collapse" data-parent="#SubMenu1"> <i class="fa fa-caret-down"></i></a>
                <a href="javascript:;" class="list-group-item">Agregar</a>
                <a href="javascript:;" class="list-group-item">Actualizar</a>
                <a href="javascript:;" class="list-group-item">Eliminar</a>
                <a href="javascript:;" class="list-group-item">Ver</a>
            </div>
            
            <a href="#demo2" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Inmueble</a>
            <div class="collapse" id="demo2">
                <a href="../registrar inmueble/RegistrarInmuebles.aspx" class="list-group-item">Agregar</a>
                <a href="" class="list-group-item">Actualizar</a>
                <a href="" class="list-group-item">Eliminar</a>
                <a href="javascript:;" class="list-group-item">Ver</a>
            </div>
            
            <a href="#demo3" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Cliente</a>
            <div class="collapse" id="demo3">
                <a href="" class="list-group-item">Agregar</a>
                <a href="" class="list-group-item">Actualizar</a>
                <a href="" class="list-group-item">Eliminar</a>
                <a href="javascript:;" class="list-group-item">Ver</a>
            </div>

            <a href="#demo4" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Contratos</a>
            <div class="collapse" id="demo4">
                <a href="" class="list-group-item">Cuota Litis</a>
                <a href="" class="list-group-item">General Contrato</a>
                <a href="" class="list-group-item">Ver</a>
            </div>

            <a href="#demo5" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Pagos</a>
            <div class="collapse" id="demo5">
                <a href="" class="list-group-item">Realizar pagos</a>
                <a href="" class="list-group-item">Estado Inquilino</a>
            </div>

             <a href="#demo6" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Reportes</a>
            <div class="collapse" id="demo6">
                <a href="" class="list-group-item">Reporte Por Mes</a>
            </div>

        </div>
    </div>
    <div id="pp">
        <form class="form-horizontal" runat="server">
            <fieldset>

                <!-- Form Name -->
                <legend>Registrar Clientes</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Nombre</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNombre1" runat="server" type="text" class="form-control input-md" placeholder="Nombre" required></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Apellido</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtApellido1" runat="server" type="text" class="form-control input-md" placeholder="Apelllido" required></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Cedula</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtCedula1" runat="server" type="text" class="form-control input-md" placeholder="Cedula" required></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Direccion</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtDireccion1" runat="server" type="text" class="form-control input-md" placeholder="Direccion" required></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Telefono 1</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTelefonos1" runat="server" type="text" class="form-control input-md" placeholder="Telefono1" required></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Telefono 2</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTelefonos2" runat="server" type="text" class="form-control input-md" placeholder="Telefono Opcional" required></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCalle">Email</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtEmail1" runat="server" type="text" class="form-control input-md" placeholder="Email" required></asp:TextBox>

                    </div>
                </div>

                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                    <div class="col-md-4">
                        <asp:Button ID="btnRegistrarCliente" runat="server" Text="Registrar Cliente" class="btn btn-primary"/>
                    </div>
                </div>


            </fieldset>
        </form>

    </div>
</asp:Content>
