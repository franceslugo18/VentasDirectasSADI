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
        #gri 
        {
            
            width:350px;
        }
        #cedu {
            margin-top:8px;
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
                <div class="form-group" id="cedu">
                    <label class="col-md-4 control-label" for="textCedula">Introduzca Cedula</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtCedula"  runat="server" type="text" class="form-control input-md" placeholder="Cedula"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCedula" ErrorMessage="La cedula debe tener 11 numeros" ForeColor="Red">Ingrese cedula</asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="btnBUscar"></label>
                    <div class="col-md-4">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" class="btn btn-primary" OnClick="btnBuscar_Click" />
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
                         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="16px" Width="175px">
                            <asp:ListItem Value="0">-Seleccione-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SadiConnectionString2" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT Facturas.ContratoId FROM Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId WHERE Clientes.Cedula = @Cedula GROUP BY Facturas.ContratoId">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtCedula" Name="Cedula" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
            <br />
            <div class="form-group">
                <label class="col-md-4 control-label" for="text"></label>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" method="post" action="\vw\CrearFactura.aspx" Text="Realizar pago" name="singlebutton" class="btn btn-primary" ViewStateMode="Disabled" />
                    <br />
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
         
            <div id="gri">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textGrip"></label>
                    <div class="col-md-4">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="555px" Height="208px" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" DataKeyNames="FacturaId" DataSourceID="SadiConnectionString" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" EnableViewState="False">
                            <Columns>
                                <asp:BoundField DataField="FacturaId" HeaderText="Factura ID" InsertVisible="False" ReadOnly="True" SortExpression="FacturaId" />
                                <asp:BoundField DataField="NumeroCuota" HeaderText="Numero de Cuota" SortExpression="NumeroCuota" />
                                <asp:BoundField DataField="Mora" HeaderText="Mora" ReadOnly="True" SortExpression="Mora" />
                                <asp:BoundField DataField="TotalCuota" HeaderText="Total de Cuota" SortExpression="TotalCuota" />
                                <asp:BoundField DataField="FechaGenerada" HeaderText="Fecha Generada" SortExpression="FechaGenerada" />
                            <asp:TemplateField HeaderText="Seleccione">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkMarca" runat="server" AutoPostBack="true" OnCheckedChanged="Checked_change" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                       
                        

                        <asp:SqlDataSource ID="SadiConnectionString" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT  
	                Facturas.FacturaId,
		            Facturas.NumeroCuota,
		            isnull(Facturas.Mora,0) AS Mora,
		            Facturas.TotalCuota, 
		            Facturas.FechaGenerada 
		 
		        FROM Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
                              INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
					   
               WHERE Facturas.ContratoId = @ContratoId and Facturas.Estado = 0">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="ContratoId" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                       
                        

                    </div>
                </div>
            </div>

        </fieldset>
    </form>

</asp:Content>