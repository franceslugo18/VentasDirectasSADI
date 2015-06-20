<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="RegistrarPagos.aspx.cs" Inherits="SADIsoft.vw.RegistrarPagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        #centrado
        {
            
            border:solid 1px;
            padding:inherit;
            margin:auto;
            width:350px;


        }
       
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <form id="Form1" runat="server" class="form-horizontal">

        <fieldset>
            <!-- Form Name -->
            <legend>Registrar Pagos</legend>
             <!-- Text input-->
            <div id="centrado">
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCedula">Introduzca Cedula</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtCedula"  runat="server" type="text" class="form-control input-md" placeholder="Introducir Cedula"></asp:TextBox>
                    </div>
                </div>
                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="btnBUscar"></label>
                    <div class="col-md-4">
                        <asp:Button ID="btnBuscar" runat="server" Text="BUscar" class="btn btn-primary" OnClick="btnBuscar_Click" />
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textNombre">Nombre</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextNombre" runat="server" type="text" class="form-control input-md" placeholder="Nombre" Enabled="false"></asp:TextBox>

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textContrato">N. Contrato</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNoContrato" runat="server" type="text" class="form-control input-md" placeholder="N.Contrato" Enabled="false"></asp:TextBox>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textDiaPago">Dia Pago</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextDiaPago" runat="server" type="text" class="form-control input-md" placeholder="Dia Pago" Enabled="false"></asp:TextBox>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textCMensualidad">Mensualidad</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextMensualidad" runat="server" type="text" class="form-control input-md" placeholder="Mensualidad" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textGrip"></label>
                <div class="col-md-4">
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="DataSourceCuotasCliente" AutoGenerateColumns="False" DataKeyNames="FacturaId" Width="555px" CellSpacing="5" Height="208px" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="FacturaId" HeaderText="No. de Factura" InsertVisible="False" ReadOnly="True" SortExpression="FacturaId" />
                            <asp:BoundField DataField="NumeroCuota" HeaderText="No. de Cuota" SortExpression="NumeroCuota" />
                            <asp:BoundField DataField="FechaGenerada" HeaderText="Fecha de generacion de la factura" SortExpression="FechaGenerada" />
                            <asp:BoundField DataField="Mora" HeaderText="Mora" SortExpression="Mora" />
                            <asp:BoundField DataField="TotalCuota" HeaderText="Total a Pagar por Cuota" SortExpression="TotalCuota" />
                            <asp:TemplateField>
                                
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkMarca" runat="server" AutoPostBack="True"/>
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Realizar pago" />
                    <asp:SqlDataSource ID="DataSourceCuotasCliente" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="select  
		
		                Facturas.FacturaId,
		                Facturas.NumeroCuota,
		                Facturas.Mora,
		                Facturas.TotalCuota, 
		                Facturas.FechaGenerada 
		 
		                 from Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
					   
                            where Contratos.ContratoId = @ContratoId and Facturas.Estado = 0">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtNoContrato" Name="ContratoId" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </div>
            </div>

        </fieldset>
    </form>

</asp:Content>
