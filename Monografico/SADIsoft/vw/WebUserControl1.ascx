<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="SADIsoft.prueba.WebUserControl1" %>
 <style type="text/css">
     
     #BUSCADOR
     {
         width:400px;
         height:333px;
         float:right;  
         margin-right:5px;
         margin-left: auto;
         margin-top: auto;
         margin-bottom: auto;
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
         width:450px;
         height:350px;
        
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
     #tipo,div1,div2,div3,div4,div5 
     {
         width:200px;

     }

     #aci
     {
         width:200px;

     }
     #dire 
     {
         width:200px;

     }


     #Div1 {
         width: 200px;
     }
     #Div2 {
         width: 200px;
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

       <fieldset style="height: 484px">

            <!-- Form Name -->
            <legend>Buscar</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textImueble">Provincia</label>
                <div class="col-md-4" id="tipo">
                    <asp:DropDownList ID="ddlTipo" runat="server" class="form-control" AutoPostBack="True">
                        <asp:ListItem Value="0">- Seleccione -</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
           <br />

           <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textImueble">Municipio</label>
                <div class="col-md-4" id="Div1">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True">
                        <asp:ListItem Value="0">- Seleccione - </asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
           <br />

           <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textImueble">Sector</label>
                <div class="col-md-4" id="Div2">
                    <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" AutoPostBack="True">
                        <asp:ListItem Value="0">- Seleccione -</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
           <br />

                      <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textImueble">Precio por debajo de:</label>
                <div class="col-md-4" id="Div3">
                    <asp:TextBox ID="txtPrecioDebajo" runat="server" class="form-control"> </asp:TextBox>
                </div>
            </div>
            <br />
           <br />

           <div class="form-group">
                
                <div class="col-md-4" id="Div4">
            <asp:RadioButton ID="RadioButton1" runat="server" text=" Vivienda"/>
                    <br />
            <asp:RadioButton ID="RadioButton2" runat="server" text=" Local"/>

</div>
            </div>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="Buscar"  name="singlebutton" class="btn btn-primary" OnClick="Button1_Click"/>
                </div>
           <br/>
           
           <div class="form-group">
                
                <div class="col-md-4" id="Div5">

        </div>
            </div>
           <br />
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton"></label>
            </div>

        </fieldset>

    </div>

    <div id="CUERPO">
        
        <asp:Label ID="numero" runat="server" Text="" CssClass="numero"></asp:Label>
        <asp:GridView ID="GridView1" CssClass="gridView" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="OnRowDataBound" AllowPaging="True" AutoGenerateColumns="False" Width="647px">
        </asp:GridView>

        
    </div>

    <div id="anuncio">
       <div class="fb-page" data-href="https://www.facebook.com/facebook" data-width="550" data-height="350" data-hide-cover="true" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/facebook"><a href="https://www.facebook.com/facebook">Facebook</a></blockquote></div></div>
    </div>
    <div id="articulo">
        
    </div>
</form>
