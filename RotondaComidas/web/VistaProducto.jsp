<%-- 
    Document   : VistaProducto
    Created on : 20/05/2018, 04:23:13 PM
    Author     : Rodrigon
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/estilos.css" />
    </head>
    <body>
        <% Mediador m = (Mediador) application.getAttribute("mediadorP");%>
        <%!
            String[] consulta = new String[4];

        %>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="index.jsp">Tu Rotonda</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-na navbar navbar-dark "  >
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
                                Busqueda de Productos
                            </a>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                        <form>
                            <label> ingrese el nombre del Producto a buscar</label>
                            <input type="text" name ="nombre">
                            <button type="submit" name="busIng" class="btn btn-primary"> buscar</button>
                        </form>

                    </div>
                </div>


            </div>
            <% String[] consulta = new String[4];
                for (int i = 0; i < 4; i++) {
                    consulta[i] = "";
                }
                if (request.getParameter("busIng") != null) {

                    consulta = m.buscarProducto(request.getParameter("nombre"));
                }


            %>
            <div id="accordion" role="tablist">
                <div class="card">
                    <div class="card-header" role="tab" id="heading2">
                        <h5 class="mb-0">
                            <a data-toggle="collapse" href="#collapse2" role="button" aria-expanded="true" aria-controls="collapseOne">
                                Cree un producto
                            </a>
                        </h5>
                    </div>

                    <div id="collapse2" class="collapse show" role="tabpanel" aria-labelledby="heading2" data-parent="#accordion">
                        <section class ="row">
                            <section class="col-sm-4 offset-sm-4">  
                                <form>
                                    <div class="form-group">
                                        <label for="nom">Nombre</label>
                                        <input name ="nom" type="text" class="form-control" id="direccion" required ="true" placeholder="Ingrese el nombre del producto" value="<%=consulta[0]%>">

                                    </div>
                                    <div class="form-group">
                                        <label for="ing">Ingredientes</label>

                                        <select class="custom-select form-control" name ="ing">


                                            <%
                                                ArrayList<String> ingre = m.obtenerIngredientes();
                                                for (int i = 0; i < ingre.size(); i += 6) {
                                                    out.println("<option class= \"\" value =\"" + ingre.get(i) + "\">" + ingre.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="costo">Precio</label>
                                        <input name ="costo"  type="number" class="form-control" id="nit" required ="true" placeholder="Ingrese el costo total del producto" value="<%=consulta[2]%>">

                                    </div>
                                    <div class="form-group">
                                        <label for="per">Personalizable</label>
                                        <input name ="per"  type="text" class="form-control" id="nit" required ="true" placeholder="Ingrese si es personalizable" value="<%=consulta[3]%>">

                                    </div> 
                                    <button type="submit" class="btn btn-primary" name="registrar">Registrar</button>

                                    <%
                                        if (request.getParameter("registrar") != null) {
                                            String[] actualizacion = new String[6];
                                            actualizacion[0] = request.getParameter("nom");
                                            actualizacion[1] = request.getParameter("ing");
                                            actualizacion[2] = request.getParameter("costo");
                                            actualizacion[3] = request.getParameter("per");

                                            m.registrarProducto(actualizacion);

                                        }
                                    %>
                                </form>
                            </section>
                        </section>
                    </div>
                </div>
            </div>
            <div id="accordion" role="tablist">
                <div class="card">
                    <div class="card-header" role="tab" id="heading3">
                        <h5 class="mb-0">
                            <a data-toggle="collapse" href="#collapse2" role="button" aria-expanded="true" aria-controls="collapseOne">
                                Agregue ingredientes a un producto existente
                            </a>
                        </h5>
                    </div>

                    <div id="collapse3" class="collapse show" role="tabpanel" aria-labelledby="heading3" data-parent="#accordion">
                        <section class ="row">
                            <section class="col-sm-4 offset-sm-4">  
                                <form>
                                    <div class="form-group">
                                        <label for="productosAgre">Nombre</label>

                                        <select class="custom-select form-control" name ="productosAgre">


                                            <%                                            ArrayList<String> prod = m.obtenerProductos();
                                                for (int i = 0; i < prod.size(); i += 4) {
                                                    out.println("<option class= \"\" value =\"" + prod.get(i) + "\">" + prod.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="ingAgre">Ingredientes</label>

                                        <select class="custom-select form-control" name ="ingAgre">


                                            <%
                                                ArrayList<String> ingrediente = m.obtenerIngredientes();
                                                for (int i = 0; i < ingrediente.size(); i += 6) {
                                                    out.println("<option class= \"\" value =\"" + ingrediente.get(i) + "\">" + ingrediente.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary" name="actualizar">Actualizar</button>
                                    <%
                                        if (request.getParameter("actualizar") != null) {
                                            String nomP = request.getParameter("productosAgre");
                                            String nomIng = request.getParameter("ingAgre");

                                            m.agregarIngAProducto(nomP, nomIng);

                                        }
                                    %>

                                </form>
                            </section>
                        </section>
                    </div>
                </div>
            </div>
            <form>

                <button name ="ver" class="btn btn-primary bg-success" type ="submit" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Ver Productos
                </button>




                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre </th>
                            <th scope="col">Productos</th>
                            <th scope="col">Precio</th>
                        </tr>
                    </thead>
                    <tbody>


                        <%if (request.getParameter("ver") != null) {
                                ArrayList<String> datos = m.obtenerProductos();
                                for (int i = 0; i < datos.size(); i += 4) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"col\">" + (i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 2) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 3) + "</th>");
                                    out.println("</tr>");
                                }

                            }
                        %>




                    </tbody>
                </table>




            </form>
        </section>



        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
    </body>
</html>
