<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ContratoLitis.aspx.cs" Inherits="SADIsoft.vw.ContratoLitis" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
             <!-- Form Name -->
            <legend>Contrato Litis</legend>

               <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNunicio">Seleccione Propietario</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlPropietario1" runat="server" class="form-control" AutoPostBack="True"  OnSelectedIndexChanged="ddlPropietario1_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            
             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Seleccione Inmuble</label>
                <div class="col-md-4">
                    <asp:GridView ID="GridView1" runat="server" Width="491px" AutoGenerateColumns="False" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="InmuebleId" HeaderText="InmuebleId" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
                            <asp:CheckBoxField DataField="TipoInmueble" HeaderText="TipoInmueble" SortExpression="TipoInmueble" />
                            <asp:BoundField DataField="Direccion" HeaderText="Direccion" ReadOnly="True" SortExpression="Direccion" />
                            <asp:ImageField DataImageUrlField="foto1" DataImageUrlFormatString="\Images\{0}" HeaderText="foto">
                                <ControlStyle Height="100px" Width="100px" />
                                <ItemStyle Height="5px" Width="5px" />
                            </asp:ImageField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SadiConnectionString %>" SelectCommand="SELECT I.InmuebleId, I.TipoInmueble, I.foto1, D.Calle + ', No. ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + Pr.Nombre AS Direccion FROM Inmuebles AS I INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId INNER JOIN Sectores AS S ON D.SectorId = S.SectorId WHERE I.PropietarioId = @PropietarioId
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPropietario1" Name="PropietarioId" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="Generar Contrato Litis" name="singlebutton" class="btn btn-primary" OnClick="Button1_Click" />
                </div>
            </div>
            
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"  WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="734px" SizeToReportContent="false" ShowCredentialPrompts="False" AsyncRendering="False" ProcessingMode="Remote" ShowParameterPrompts="False">
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
                    <br />
                    <br />
                    <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
                            
        </fieldset>
    </form>
</asp:Content>