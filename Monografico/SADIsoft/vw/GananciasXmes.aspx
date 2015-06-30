<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="GananciasXmes.aspx.cs" Inherits="SADIsoft.vw.GananciasXmes" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
             <!-- Form Name -->
            <legend>Ganancias Por Mes</legend>
      
             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text"></label>
                <div class="col-md-4">
                     <br />
                     <rsweb:ReportViewer ID="ReportViewer1" runat="server">
                     </rsweb:ReportViewer>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                </div>
            </div>
            
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="Button11" runat="server" Text="Generar Informe" name="singlebutton" class="btn btn-primary" OnClick="Button11_Click" />
                </div>
            </div>
                           
        </fieldset>
    </form>

</asp:Content>
