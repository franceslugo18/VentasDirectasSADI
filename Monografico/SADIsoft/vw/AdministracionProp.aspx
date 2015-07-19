<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="AdministracionProp.aspx.cs" Inherits="SADIsoft.vw.AdministracionProp" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="Form1" class="form-horizontal" runat="server">  
         <div>
         </div>
         <div style="margin-left: 40px">
             Bienvenido
             <asp:Label ID="Label1" runat="server"></asp:Label>
             <br />
             <br />
             Que desea ver:&nbsp;&nbsp;
            <asp:DropDownList ID="ddlReportes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlReportes_SelectedIndexChanged1">
                <asp:ListItem Value="0">- Selecione -</asp:ListItem>
                <asp:ListItem Value="PropReporteMensual">Reporte Mensual</asp:ListItem>
                <asp:ListItem Value="propEstadoInmuebles">Estado de Inmuebles</asp:ListItem>
             </asp:DropDownList>


             <br />
             <asp:ScriptManager ID="ScriptManager1" runat="server">
             </asp:ScriptManager>
             <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="667px">
             </rsweb:ReportViewer>
        </div>
    </form>
</asp:Content>
