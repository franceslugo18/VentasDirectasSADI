<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="MantenimientoCli.aspx.cs" Inherits="SADIsoft.vw.MantenimientoCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #centra {
            margin-left: 5px;
        }
                /*Estilo general para el gridView*/
    .grip1 {
        margin:0 auto;
        font-size:11px;
        text-align:center;
        border:hidden;
    }
    /*Selecciona las filas pares y las colorea*/
    .grip1 tr:nth-child(even)
    {
        background-color: #a9c673;
    }
    /*Selecciona las filas impares y las colorea*/
    .grip1 tr:nth-child(odd)
    {
        background-color: #fff;
    }
    /*Estilo para las casillas del gridView*/
    .grip1 td {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    .gridViewHeader{
        height:35px;
    }
     /*Estilo para las Cabezeras del gridView*/
    .grip1 th {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <form id="Form1" class="form-horizontal" runat="server">
        <fieldset>
            <!-- Form Name -->
            <legend>Mantenimiento Clientes</legend>

              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textTele">Telefono 1</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTelefonops1" runat="server" type="text" class="form-control input-md" placeholder="Telefono" ></asp:TextBox>
                   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textEmail">Email</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextEmail" runat="server" type="text" class="form-control input-md" placeholder="Email"></asp:TextBox>
                   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textEmail">Direccion</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextDireccion" runat="server" type="text" class="form-control input-md" placeholder="Direccion"></asp:TextBox>
                   
                </div>
            </div>
             <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="btnRegistrarr"></label>
                <div class="col-md-4">
                    <asp:Button ID="btnActualizarCl" runat="server" Text="Actualizar" class="btn btn-primary"/>
                </div>
            </div>
            
              <!-- Text input-->
            <div class="form-group" id="centra">
                <div class="col-md-4">
                   <asp:GridView ID="GridView1" runat="server" CssClass="grip1" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="652px">
                       <AlternatingRowStyle BackColor="White" />
                       <Columns>
                           <asp:CommandField ShowSelectButton="True" />
                           <asp:BoundField DataField="Telefono1" HeaderText="Telefono1" SortExpression="Telefono1" />
                           <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                           <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PostgradoDBConnectionString %>" SelectCommand="SELECT [Telefono1], [Email], [Direccion] FROM [Clientes]"></asp:SqlDataSource>
                </div>
            </div>

            
        </fieldset>
    </form>
</asp:Content>
