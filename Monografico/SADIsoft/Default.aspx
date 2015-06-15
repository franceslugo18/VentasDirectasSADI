<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SADIsoft.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <div>
    <div class="col-md-5">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Buscar Inmuebles</legend>

                </fieldset>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textNiveles">Tipo Imueble</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlTipo" name="ddlTipo" runat="server" class="form-control" AutoPostBack="True">
                            <asp:ListItem>-Seleccione-</asp:ListItem>
                            <asp:ListItem Value="0">Vivienda</asp:ListItem>
                            <asp:ListItem Value="1">Local</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="col-md-5">
                <div class="form-group">
                    <br />
                    <label class="col-md-4 control-label" for="textNiveles">Accion</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlAccion" name="ddlAccion" runat="server" class="form-control" AutoPostBack="True">
                            <asp:ListItem>-Seleccione-</asp:ListItem>
                            <asp:ListItem Value="0">Alquiler</asp:ListItem>
                            <asp:ListItem Value="1">Venta</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <!-- Text input-->
            <div class="col-md-5">
                <div class="form-group">
                    <br />
                    <label class="col-md-4 control-label" for="textNiveles">Direccion</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" AutoPostBack="True">
                            <asp:ListItem>-Seleccione-</asp:ListItem>
                            <asp:ListItem>Villlas Agricolas</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="col-md-5">
                <div class="form-group">
                    <br />
                    <div class="col-md-4">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" class="btn btn-success" PostBackUrl="~/Buscar.aspx" />
                    </div>
                </div>
            </div>
    </div>
    </form>
</body>
</html>
