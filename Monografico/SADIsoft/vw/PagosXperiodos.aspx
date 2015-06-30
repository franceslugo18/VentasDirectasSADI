<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="PagosXperiodos.aspx.cs" Inherits="SADIsoft.vw.PagosXperiodos" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
             <!-- Form Name -->
            <legend>Pagos Por Periodos</legend>
      
             <!-- Text input-->
             
             <div class="form-group">
                 <div class="viewer">
                     <br />
&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="Label1" runat="server" Text="Seleccione Reporte:"></asp:Label>
&nbsp;&nbsp;
                     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                         <asp:ListItem>- Seleccione -</asp:ListItem>
                         <asp:ListItem Value="PagosPorPeriodo">Pagos por periodo</asp:ListItem>
                         <asp:ListItem Value="GananciaPorPeriodo">Ganancias por periodo</asp:ListItem>
                         <asp:ListItem Value="PropietarioPeriodo">Pago a propietario por periodo</asp:ListItem>
                         <asp:ListItem Value="PagosNoRealizados">Pagos No Realizados</asp:ListItem>
                         <asp:ListItem Value="NoPagosDia">Pagos no realizados en dia</asp:ListItem>
                     </asp:DropDownList>
                     <br />
&nbsp;
                     <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1002px">
                     </rsweb:ReportViewer>
                     <asp:ScriptManager ID="ScriptManager1" runat="server">
                     </asp:ScriptManager>
                <br />
                     </div>
             </div>
            
            
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="Ver Informe" name="singlebutton" class="btn btn-primary" />
                </div>
            </div>
                           
        </fieldset>
    </form>

</asp:Content>
