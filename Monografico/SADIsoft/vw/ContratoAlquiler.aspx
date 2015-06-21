<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContratoAlquiler.aspx.cs" Inherits="SADIsoft.vw.ContratoAlquiler" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Generar Contrato de Alquiler<br />
        <br />
        Seleccione Cliente:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlCliente1" runat="server" Height="16px" Width="140px">
        </asp:DropDownList>
        <br />
        <br />
        Seleccione Propietario:&nbsp;&nbsp;
        <asp:DropDownList ID="ddlPropietario1" runat="server" AutoPostBack="True" Height="16px" Width="137px">
        </asp:DropDownList>
        <br />
        <br />
        Seleccione Inmueble:<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="InmuebleId" HeaderText="InmuebleId" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
                <asp:CheckBoxField DataField="TipoInmueble" HeaderText="TipoInmueble" SortExpression="TipoInmueble" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" ReadOnly="True" SortExpression="Direccion" />
                <asp:ImageField DataImageUrlField="foto1" DataImageUrlFormatString="Images\{0}" HeaderText="foto1">
                    <ControlStyle Height="100px" Width="100px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString2 %>" SelectCommand="SELECT I.InmuebleId, I.TipoInmueble, I.foto1, D.Calle + ', No. ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + Pr.Nombre AS Direccion FROM Inmuebles AS I INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId INNER JOIN Sectores AS S ON D.SectorId = S.SectorId WHERE I.PropietarioId = @PropietarioId AND I.isContratoLitis = 1 AND I.isDisponible = 1">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPropietario1" Name="PropietarioId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Dia de Pago:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo Requerido"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generar Contrato" />
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" ProcessingMode="Remote" ShowParameterPrompts="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="734px">
            <ServerReport ReportPath="InmobiliariaReport/ContratoAlquiler.rcl" />
        </rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
