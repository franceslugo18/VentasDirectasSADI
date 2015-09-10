<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ContratoAlquiler.aspx.cs" Inherits="SADIsoft.vw.ContratoAlquiler" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="Content3">

    <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
            <!-- Form Name -->
            <legend>Crear Contrato De Alquiler</legend>
        </fieldset>

           <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNunicio">Seleccione Cliente</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlCliente1" runat="server" class="form-control" OnSelectedIndexChanged="ddlCliente1_SelectedIndexChanged">
                    </asp:DropDownList>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCliente1" ErrorMessage="Debe seleccionar un Cliente" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            
         <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNunicio">Seleccione Propietario</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlPropietario1" runat="server" class="form-control" AutoPostBack="True">
                    </asp:DropDownList>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPropietario1" ErrorMessage="Debe seleccionar un Propietario" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
         <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textCalle">Seleccione Inmuble</label>
            <div class="col-md-4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="408px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="InmuebleId" HeaderText="Inmueble ID" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
                        <asp:BoundField DataField="TipoInmueble" HeaderText="Tipo de Inmueble" ReadOnly="True" SortExpression="TipoInmueble" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" ReadOnly="True" SortExpression="Direccion" />
                        <asp:ImageField DataImageUrlField="foto1" DataImageUrlFormatString="/Images/{0}" HeaderText="Foto">
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
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Debe seleccionar un Inmueble"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT
 I.InmuebleId, 
CASE I.TipoInmueble WHEN 0 THEN 'Vivienda' WHEN 1 THEN 'Local Comercial' END TipoInmueble,
 I.foto1, D.Calle + ', No. ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + Pr.Nombre AS Direccion
 FROM 
Inmuebles AS I 
INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId 
INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId 
INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId 
INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId 
INNER JOIN Sectores AS S ON D.SectorId = S.SectorId 
WHERE 
I.PropietarioId = @PropietarioId AND I.IsDisponible = 1 AND I.isContratoLitis = 1">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPropietario1" Name="PropietarioId" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
          <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textCalle">Dia De Pago</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlDia" runat="server" class="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem Value="31">31</asp:ListItem>
                    </asp:DropDownList>

            </div>
        </div>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="btnRegistrarr"></label>
            <div class="col-md-4">
                <asp:Button ID="Button1" runat="server" Text="Generar Contrato" name="singlebutton" class="btn btn-primary" OnClick="Button1_Click"/>
            </div>
        </div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" ProcessingMode="Remote" ShowParameterPrompts="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="734px" >
            <ServerReport ReportPath="InmobiliariaReport/ContratoAlquiler.rdl" />
        </rsweb:ReportViewer>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         

    </form>

</asp:Content>



