<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="SADIsoft.prueba.WebUserControl1" %>
 <style type="text/css">
     
     #BUSCADOR
     {
         width:425px;
         height:350px;
         margin:auto;
         float:right;  
         margin-right:5px;
        
     }

     #CUERPO
     {
        
         width:350px;
         height:350px;
         margin-top:25px;
         margin-left:180px;   
        
     }
     #anuncio
     {
         width:350px;
         height:250px;
        
         float:right;        
         margin-right:5px;  
        
     }
     #articulo
     {
         width:650px;
         height:350px;
         margin-left:50px;
     }

     /*Estilo general para el gridView*/
    .gridView {
        margin:0 auto;
        font-size:11px;
        text-align:center;
        border:hidden;
    }
    /*Selecciona las filas pares y las colorea*/
    .gridView tr:nth-child(even)
    {
        background-color: #a9c673;
    }
    /*Selecciona las filas impares y las colorea*/
    .gridView tr:nth-child(odd)
    {
        background-color: #fff;
    }
    /*Estilo para las casillas del gridView*/
    .gridView td {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    .gridViewHeader{
        height:35px;
    }
     /*Estilo para las Cabezeras del gridView*/
    .gridView th {
        padding-left:3px;
        padding-right:3px;
        border:hidden;
    }
    .numero
    {
        text-align:center;
        color:#0094ff;
        background-color:aqua;
       
    }


 </style>
<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<form runat="server">
    <div id="BUSCADOR">

       <fieldset>

            <!-- Form Name -->
            <legend>Buscar</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textImueble">Tipo Imueble</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlTipo" runat="server" class="form-control">
                        <asp:ListItem>-Seleccione-</asp:ListItem>
                        <asp:ListItem>Vivienda</asp:ListItem>
                        <asp:ListItem>Local</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <!-- Text input-->
            <div class="form-group">
                <br />
                <label class="col-md-4 control-label" for="textNiveles">Accion</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlAccion" runat="server" class="form-control">
                        <asp:ListItem>-Seleccione-</asp:ListItem>
                        <asp:ListItem>Alquiler</asp:ListItem>
                        <asp:ListItem>Venta</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
           <br />
            <!-- Text input-->
            <div class="form-group">
                <br />
                <label class="col-md-4 control-label" for="textNiveles">Direccion</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                        <asp:ListItem>-Seleccione-</asp:ListItem>
                        <asp:ListItem>Villlas Agricolas</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
           <br />
           <br />
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton"></label>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="Buscar"  name="singlebutton" class="btn btn-primary" OnClick="Button1_Click"/>
                </div>
            </div>

        </fieldset>

    </div>

    <div id="CUERPO">
        
        <asp:Label ID="numero" runat="server" Text="" CssClass="numero"></asp:Label>
        <asp:GridView ID="GridView1" CssClass="gridView" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="OnRowDataBound" AllowPaging="True" AutoGenerateColumns="False" Width="547px">
        </asp:GridView>

        
    </div>

    <div id="anuncio">
       <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="350" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
    </div>
    <div id="articulo">
        <div class="fb-page" data-href="https://www.facebook.com/facebook" data-width="650" data-height="350" data-hide-cover="true" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/facebook"><a href="https://www.facebook.com/facebook">Facebook</a></blockquote></div></div>
    </div>
</form>
