<%-- 
    Document   : index
    Created on : 20/05/2018, 09:14:25 PM
    Author     : fcher
--%>

<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">     
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
         <link rel="stylesheet" type="text/css" media="screen" href="estilos/estilos.css" />
        <% application.setAttribute("mediadorP", new Mediador());%>
    
    <body>
        <nav class="navbar navbar-expand-lg navbar-light  "  style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="index.jsp">Tu Rotonda</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-na navbar navbar-dark ">
                    <a class="nav-item nav-link" href="VistaRestaurante.jsp">Gestion Restaurantes</a>                        
                    <a class="nav-item nav-link" href="VistaMenu.jsp">Gestionar menu</a>
                    <a class="nav-item nav-link" href="VistaProducto.jsp">Gestionar productos</a>
                    <a class="nav-item nav-link " href="VistaIngrediente.jsp">Gestion de ingredientes </a>
                    <a class="nav-item nav-link " href="VistaConsultarColaPedidos.jsp">Consultar Cola de pedidos</a>
                </div>
            </div>
        </nav>
        <section class="container">
<<<<<<< HEAD
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="index.jsp">Tu Rotonda</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-na navbar navbar-dark bg-primaryv">
                        <a class="nav-item nav-link" href="VistaRestaurante.jsp">Gestion Restaurantes</a>                        
                        <a class="nav-item nav-link" href="VistaMenu.jsp">Gestionar menu</a>
                        <a class="nav-item nav-link" href="VistaProducto.jsp">Gestionar productos</a>
                        <a class="nav-item nav-link " href="VistaIngrediente.jsp">Gestion de ingredientes </a>
                        <a class="nav-item nav-link " href="VistaConsultarColaPedidos.jsp">Consultar Cola de pedidos</a>
=======

            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">

                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100 img-fluid" style="width:300px ; height:500px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSamqO4OBPlFGpjTIQbmZ983rAsS_jkLqiWNFYYOJlk7bz7UcZYgA" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Pide algo delicioso</h5>
                            <p>Comida Rapida</p>
                        </div>
                    </div>
                     <div class="carousel-item ">
                        <img class="d-block w-100 img-fluid" style="width:300px ; height:500px;" src="http://www.arrierossemos.com/assets/img/calentao.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Pide algo tipico</h5>
                            <p>Calentado</p>
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <img class="d-block w-100 img-fluid" style="width:300px ; height:500px;" src="https://elambato.webnode.com/_files/200000017-189fa1a939/matambre.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Pide lo que quieras</h5>
                            <p>Solicita tu pedido personalizado en Turotonda.com</p>
                        </div>
>>>>>>> 103c40ecf25b32106607be7bc68599ac8deb4b7e
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
                <!--  <div class="carousel-item">
                      <img src="https://viagourmet.viapais.com.ar/sites/default/files/styles/image_700x500/public/alimentos-procesados_0.jpg?itok=EbNWmCE-">
                      <div class="carousel-caption d-none d-md-block">
                          <h5>¿No tienes tiempo?</h5>
                          <p>Pide comida rapida</p>
                      </div>
                  </div>
                   <div class="carousel-item">
                      <img src="http://www.solohonduras.com/img/A216.jpg" alt="link a la imagen roto">
                      <div class="carousel-caption d-none d-md-block">
                          <h5>Pide algo delicioso</h5>
                          <p>Bandeja paisa</p>
                      </div>
                  </div>

                <!--<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a> -->
            </div> 

        </section>

        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
    </body>

