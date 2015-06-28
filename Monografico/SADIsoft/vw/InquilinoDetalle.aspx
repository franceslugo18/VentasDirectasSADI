<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="InquilinoDetalle.aspx.cs" Inherits="SADIsoft.vw.InquilinoDetalle"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 </asp:Content>  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
            <!-- Form Name -->
            <legend>Detalle Inquilino</legend>
            
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Nombre</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox1" class="form-control input-md" runat="server" Enabled="False" Width="197px"></asp:TextBox>
                </div>
            </div>
              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Direccion: Inmueble</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox2" class="form-control input-md" runat="server" Enabled="False" Width="449px"></asp:TextBox>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Propietario</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox3" class="form-control input-md" runat="server" Enabled="False" Width="206px"></asp:TextBox>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Cuota Mensual</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox4" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Cuotas pagadas con mora</label>
                <div class="col-md-4">
                     <asp:TextBox ID="TextBox5" class="form-control input-md" runat="server" Enabled="False" Width="31px"></asp:TextBox>
                      <b>De</b>  
                    <asp:TextBox ID="TextBox9" class="form-control input-md" runat="server" Enabled="False" Width="29px"></asp:TextBox>    
                    
                    
                </div>
            </div>
              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Cuotas Pendientes</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox6" class="form-control input-md"  runat="server" Enabled="False" Width="29px"></asp:TextBox>
                       <b>De</b>
                    <asp:TextBox ID="TextBox8" class="form-control input-md"  runat="server" Enabled="False" Width="29px"></asp:TextBox>
                </div>
            </div>
              <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="text">Tipo De Actualizacion De Contrato</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox7" class="form-control input-md" runat="server" Enabled="False" Width="122px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" class="btn btn-primary" OnClick="Button1_Click1" Text="Cambiar aumento Manual/Automatico" />
                </div>
            </div>  
        </fieldset>
    </form>
</asp:Content>
