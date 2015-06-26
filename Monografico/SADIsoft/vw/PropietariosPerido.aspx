<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="PropietariosPerido.aspx.cs" Inherits="SADIsoft.vw.PropietariosPerido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
             <!-- Form Name -->
            <legend>Propietarios Peridos</legend>
      
             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text"></label>
                <div class="col-md-4">
                     Grip Para El informe aqui
                </div>
            </div>
            
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="Generar Informe" name="singlebutton" class="btn btn-primary" />
                </div>
            </div>
                           
        </fieldset>
    </form>

</asp:Content>
