<%-- 
    Document   : VistaIngrediente
    Created on : 19/05/2018, 08:34:54 PM
    Author     : Rodrigon
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar ingredientes</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/estilos.css" />
    </head>
    <body>
        <% Mediador m = (Mediador) application.getAttribute("mediadorP");%>
        <%!
            String[] consulta = new String[6];

        %>
        <nav class="navbar navbar-expand-lg navbar-light "  style="background-color: #e3f2fd;">
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
            <article class="jumbotron">
                <h1>Seccion de busqueda</h1>
            </article>
            <div id="accordion" role="tablist">
                <div class="card">
                    <div class="card-header" role="tab" id="headingOne">
                        <h5 class="mb-0">
                            <a data-toggle="collapse" href="#collapseOne" role="button" aria-expanded="true" aria-controls="collapseOne">
                                Busqueda de ingrediente
                            </a>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                        <form>
                            <label> ingrese el nombre del ingrediente a buscar</label>
                            <input type="text" name ="nombre">
                            <button type="submit" name="busIng" class="btn btn-primary"> buscar</button>
                        </form>

                    </div>
                </div>
            </div>
            <script src="scripts/jquery-3.2.1.min.js"></script>
            <script src ="scripts/popper.js"></script>
            <script src="scripts/bootstrap.min.js"></script>

            <%
                for (int i = 0; i < 6; i++) {
                    consulta[i] = "";
                }

                if (request.getParameter("busIng") != null) {

                    consulta = m.consultarIng(request.getParameter("nombre"));
                }
                if (request.getParameter("actualizarIng") != null) {
                    String[] actualizacion = new String[6];
                    actualizacion[0] = request.getParameter("nom");
                    actualizacion[1] = request.getParameter("categoria");
                    actualizacion[2] = request.getParameter("cantidad");
                    actualizacion[3] = request.getParameter("precio");
                    actualizacion[4] = request.getParameter("cambiable");
                    actualizacion[5] = request.getParameter("caracteristicas");
                    m.actualizarIng(actualizacion);

                }

            %>
            <section class ="row">
                <section class="col-sm-4 offset-sm-4">  
            <form>
                <div class="form-group">
                    <label for="direccion">Nombre</label>
                    <input name ="nom" type="text" class="form-control" id="direccion" required ="true" placeholder="Ingrese el nombre del menu" value="<%=consulta[0]%>">

                </div>
                <div class="form-group">
                    <label for="dueño">Categoria</label>
                    <input name ="categoria" type="text" class="form-control" id="dueño" required ="true" placeholder="Ingrese los productos del restaurante" value="<%=consulta[1]%>">

                </div>
                <div class="form-group">
                    <label for="nit">Cantidad</label>
                    <input name ="cantidad"  type="number" class="form-control" id="nit" required ="true" placeholder="Ingrese el costo del menu" value="<%=consulta[2]%>">

                </div>
                    <div class="form-group">
                    <label for="nit">Precio</label>
                    <input name ="precio"  type="number" class="form-control" id="nit" required ="true" placeholder="Ingrese el costo del menu" value="<%=consulta[3]%>">

                </div>
                    <div class="form-group">
                    <label for="nit">Cambiable</label>
                    <input name ="cambiable"  type="text" class="form-control" id="nit" required ="true" placeholder="Ingrese el costo del menu" value="<%=consulta[4]%>">

                </div>
                    <div class="form-group">
                    <label for="nit">Caracteristica</label>
                    <input name ="caracteristicas"  type="text" class="form-control" id="nit" required ="true" placeholder="Ingrese el costo del menu" value="<%=consulta[5]%>">

                </div>
                <button type="submit" class="btn btn-primary" name="actualizarIng">Actualizar</button>
            </form>
                </section>
            </section>
                    
            <form>

                <button name ="ver" class="btn btn-link" type ="submit" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Ver Ingredientes
                </button>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre </th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cambiable</th>
                            <th scope="col">Caracteristica</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%if (request.getParameter("ver") != null) {
                                ArrayList<String> datos = m.obtenerIngredientes();
                                for (int i = 0; i < datos.size(); i += 6) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"col\">" + (i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 2) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 3) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 4) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 5) + "</th>");
                                    out.println("</tr>");
                                }

                            }
                        %>
                    </tbody>
                </table>
            </form>  
        </section>
    </body>
</html>
