﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ContratoLitis.aspx.cs" Inherits="SADIsoft.vw.ContratoLitis" %>

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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPropietario1" ErrorMessage="Debe seleccionar un propietario y un inmueble" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            
             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textCalle">Seleccione Inmuble</label>
                <div class="col-md-4">
                    <asp:GridView ID="GridView1" runat="server" Width="491px" AutoGenerateColumns="False" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="InmuebleId" HeaderText="Inmueble ID" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
                            <asp:BoundField DataField="TipoInmueble" HeaderText="Tipo de Inmueble" ReadOnly="True" SortExpression="TipoInmueble" />
                            <asp:BoundField DataField="Direccion" HeaderText="Direccion" ReadOnly="True" SortExpression="Direccion" />
                            <asp:ImageField DataImageUrlField="foto1" DataImageUrlFormatString="/Images/{0}" HeaderText="Foto 1">
                                <ControlStyle Height="100px" Width="100px" />
                            </asp:ImageField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT 
I.InmuebleId, 
CASE I.TipoInmueble WHEN 0 THEN 'Vivienda' WHEN 1 THEN 'Local Comercial' END TipoInmueble, 
I.foto1, D.Calle + ', No. ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + Pr.Nombre AS Direccion 
FROM 
Inmuebles AS I INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId 
                           INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId
                           INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId 
                           INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId 
                           INNER JOIN Sectores AS S ON D.SectorId = S.SectorId 
WHERE I.PropietarioId = @PropietarioId AND I.isContratoLitis = 0
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPropietario1" Name="PropietarioId" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Debe seleccionar un Inmueble" Visible="False"></asp:Label>
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