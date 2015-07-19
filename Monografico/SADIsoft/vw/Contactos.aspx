<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Contactos.aspx.cs" Inherits="SADIsoft.vw.Contactos" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #dire 
        {
            width:500px;
            height:300px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form-horizontal">
        <fieldset>

            <!-- Form Name -->
            <legend>Contacto</legend>

            <!-- Text input-->
            <div class="form-group" id ="dire">
                <label class="col-md-4 control-label" for="textinput">Direccion</label>
                <div class="col-md-4">
                    <iframe src="../prueba/mapa.html" style="height:475px; width: 600px">

                    </iframe>
                </div>
            </div>
            <br />
            <br />
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput"></label>
                <div class="col-md-4">
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Email</label>
                <div class="col-md-4">
                    Aqui Va
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Telefonos</label>
                <div class="col-md-4">
                    Aqui Va
                </div>
            </div>

        </fieldset>
    </form>
</asp:Content>
