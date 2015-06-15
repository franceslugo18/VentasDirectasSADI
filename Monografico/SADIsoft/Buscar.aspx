<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Buscar.aspx.cs" Inherits="SADIsoft.Buscar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="get" runat="server">
    <asp:Label ID="ResPropiedad" runat="server" style="font-weight: 700; " 
            Text="0" CssClass="style1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Table ID="Table1" runat="server" BorderColor="White" 
        BorderStyle="Outset" ForeColor="White" Height="51px" Width="499px" 
        HorizontalAlign="Center" style="font-size: medium; background-color: #CCFF99;">
    </asp:Table>
        </form>
        
<br />
</asp:Content>
