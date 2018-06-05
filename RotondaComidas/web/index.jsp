<%-- 
    Document   : index
    Created on : 20/05/2018, 09:14:25 PM
    Author     : fcher
--%>

<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% application.setAttribute("mediadorP", new Mediador());%>
<!DOCTYPE html>
<head>

<title>TODO supply a title</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">     
<link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="estilos/estilos.css" />
</head>


<body>

    <section class="container">


        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100 img-fluid" style="width:300px ; height:500px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSamqO4OBPlFGpjTIQbmZ983rAsS_jkLqiWNFYYOJlk7bz7UcZYgA" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Pide algo delicioso</h5>
                        
                       
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
         
        </div> 
        </section>
<section clas="row">
 <a class=" col-sm-12 col-md-4  offset-md-4 btn btn-primary bg-warning " href="VistaCompras.jsp">Realiza tu compra</a>
 <a class=" col-sm-12 col-md-4 offset-md-4 btn btn-primary bg-success " href="VistaRestaurante.jsp">Gestiona tu Restaurante</a>
    </section>

    <script src="scripts/jquery-3.2.1.min.js"></script>
    <script src ="scripts/popper.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
</body>

