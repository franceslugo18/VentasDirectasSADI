<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SADIsoft.prueba.haber" %>

<%@ Register Src="~/vw/WebUserControl1.ascx" TagPrefix="uc1" TagName="WebUserControl1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bs-example">
        <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">
            <!-- Carousel indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>
            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="active item">
                    <h2></h2>
                    <div class="carousel-caption">
                        <img src="/imagenes/imagen1.jpg" class="img-thumbnail" />
                        <h3>Todo lo que necesitas en un solo lugar</h3>
                        <p>Los mejores Inmuebles de todo el Pais estan aqui.</p>
                    </div>
                </div>
                <div class="item">
                    <h2></h2>
                    <div class="carousel-caption">
                        <img src="/imagenes/imagen2.jpg" class="img-thumbnail" />
                        <h3>La mejor forma de visualizar tus Inmuebles</h3>
                        <p>Alquila o compra uno de estos inmuebles</p>
                    </div>
                </div>
                <div class="item">
                    <h2></h2>
                    <div class="carousel-caption">
                        <img src="/imagenes/imagen3.jpg" class="img-thumbnail" />
                        <h3>Las mejores ofertas del mercado</h3>
                        <p>Aqui encontraras todo lo que necesitas.</p>
                    </div>
                </div>
                <div class="item">
                    <h2></h2>
                    <div class="carousel-caption">
                        <img src="/imagenes/imagen4.jpg" class="img-thumbnail" />
                        <h3>maximisa tus ingresos de todos tus inmuebles</h3>
                        <p>Ingresos 100% de ganancia en todos tus ingresos.</p>
                    </div>
                </div>
                <div class="item">
                    <h2></h2>
                    <div class="carousel-caption">
                        <img src="/imagenes/imagen5.jpg" class="img-thumbnail" />
                        <h3>Casas con pisinas y mucho mas</h3>
                        <p>Las mejores casas y apartamento estan a tu alcanse aqui.</p>
                    </div>
                </div>
            </div>
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>
    <!-- START THE FEATURETTES -->
    <hr class="featurette-divider">

    <uc1:WebUserControl1 runat="server" id="WebUserControl1" />

     <!-- START THE FEATURETTES -->
    <hr class="featurette-divider">
    <footer style="margin:auto">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>© 2014 SADI, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
      </footer>
</asp:Content>
