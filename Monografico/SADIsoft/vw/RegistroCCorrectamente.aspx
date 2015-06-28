<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="RegistroCCorrectamente.aspx.cs" Inherits="SADIsoft.vw.RegistroCCorrectamente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" class="form-horizontal" runat="server">
        <fieldset>

            <!-- Form Name -->
            <legend>Cliente Registrado Correctamente</legend>
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btn"></label>
                <div class="col-md-4">
                    
                    <asp:Button ID="btn" runat="server" Text="Volver Al Menu Anterior" class="btn btn-primary"/>
                   
                </div>
            </div>


        </fieldset>
    </form>
</asp:Content>
