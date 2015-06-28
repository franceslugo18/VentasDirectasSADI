<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="MantenimientoCli.aspx.cs" Inherits="SADIsoft.vw.MantenimientoCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #centra {
            margin-left: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <form id="Form1" class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Mantenimiento Clientes</legend>

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
                    <asp:Button ID="btnActualizarCl" runat="server" Text="Actualizar" class="btn btn-primary"/>
                </div>
            </div>


              <!-- Text input-->
            <div class="form-group" id="centra">
                <div class="col-md-4">
                    Aqui Hiria El Grid
                </div>
            </div>

            
        </fieldset>
    </form>
</asp:Content>
