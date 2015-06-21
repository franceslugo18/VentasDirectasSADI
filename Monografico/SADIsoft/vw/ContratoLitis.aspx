<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContratoLitis.aspx.cs" Inherits="SADIsoft.vw.ContratoLitis" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 828px">
        Generar Contrato de Cuota Litis<br />
        <br />
        Seleccione propietario:&nbsp;
        <asp:DropDownList ID="ddlPropietario1" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="ddlPropietario1_SelectedIndexChanged" Width="185px">
        </asp:DropDownList>
        <br />
        <br />
        Seleccione Inmueble:<br />
        <asp:GridView ID="GridView1" runat="server" Width="197px" AutoGenerateColumns="False" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT I.InmuebleId, I.TipoInmueble, I.foto1, D.Calle + ', No. ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + Pr.Nombre AS Direccion FROM Inmuebles AS I INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId INNER JOIN Sectores AS S ON D.SectorId = S.SectorId WHERE I.PropietarioId = @PropietarioId AND isContratoLitis = 0
">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPropietario1" Name="PropietarioId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="796px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="964px" SizeToReportContent="True" ShowCredentialPrompts="False" AsyncRendering="False" ProcessingMode="Remote" ShowParameterPrompts="False">
            <ServerReport ReportServerUrl="http://localhost/Reportserver" ReportPath="/InmobiliariaReport/Report1" DisplayName="Cuota Litis" />
            <LocalReport DisplayName="ContratoLItis">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SADIsoft.PostgradoDBDataSetTableAdapters.CuotaLitisTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="InmuebleId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="SADIsoft.PostgradoDBDataSetTableAdapters.CuotaLitisTableAdapter"></asp:ObjectDataSource>
        <br /><br /><br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
    </form>
</body>
</html>
