<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="ContratoAlquiler.aspx.cs" Inherits="SADIsoft.vw.ContratoAlquiler" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="Content3">

    <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
            <!-- Form Name -->
            <legend>Contrato Alquiler</legend>
        </fieldset>

           <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNunicio">Seleccione Cliente</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlCliente1" runat="server" class="form-control">
                    </asp:DropDownList>
                </div>
            </div>
            
         <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textNunicio">Seleccione Propietario</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlPropietario1" runat="server" class="form-control" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
            </div>
         <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textCalle">Seleccione Inmuble</label>
            <div class="col-md-4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InmuebleId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="408px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="InmuebleId" HeaderText="InmuebleId" InsertVisible="False" ReadOnly="True" SortExpression="InmuebleId" />
                        <asp:CheckBoxField DataField="TipoInmueble" HeaderText="TipoInmueble" SortExpression="TipoInmueble" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" ReadOnly="True" SortExpression="Direccion" />
                        <asp:ImageField DataAlternateTextField="foto1" DataImageUrlField="foto1" DataImageUrlFormatString="\Images\{0}" HeaderText="foto1">
                            <ControlStyle Height="50px" Width="50px" />
                        </asp:ImageField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SadiConnectionString %>" SelectCommand="SELECT I.InmuebleId, I.TipoInmueble, I.foto1, D.Calle + ', No. ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + Pr.Nombre AS Direccion FROM Inmuebles AS I INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId INNER JOIN Sectores AS S ON D.SectorId = S.SectorId WHERE I.PropietarioId = @PropietarioId">
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
                <asp:TextBox ID="txtDia" runat="server" type="text" class="form-control input-md" placeholder="Dia Pago" required></asp:TextBox>

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



