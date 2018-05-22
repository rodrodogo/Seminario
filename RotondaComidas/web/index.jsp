<%-- 
    Document   : index
    Created on : 20/05/2018, 09:14:25 PM
    Author     : fcher
--%>

<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">     
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
        <% application.setAttribute("mediadorP", new Mediador()); %>
    </head>
    <body>
        <section class="container">
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
                        <a class="nav-item nav-link " href="#">Consultar Cola de pedidos</a>
                    </div>
                </div>
            </nav>
        </section>

        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
    </body>
</html>
