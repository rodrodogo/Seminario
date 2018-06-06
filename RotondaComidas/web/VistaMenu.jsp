<%-- 
    Document   : VistaMenu
    Created on : 22/05/2018, 03:21:48 PM
    Author     : Rodrigon
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/estilos.css" />
    </head>
    <body>
        <% Mediador m = (Mediador) application.getAttribute("mediadorP");
            String[] consulta = new String[3];%>
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
                                Busqueda de Menus
                            </a>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                        <form>
                            <label>  Ingrese el nombre del Menu a buscar</label>
                            <input type="text" name ="nombre">
                            <button type="submit" name="busIng" class="btn btn-primary"> buscar</button>
                        </form>

                    </div>
                </div>


            </div>
            <%

                for (int i = 0; i < 3; i++) {
                    consulta[i] = "";
                }

                if (request.getParameter("busIng") != null) {

                    consulta = m.consultarMenu(request.getParameter("nombre"));
                }
                if (request.getParameter("registrar") != null) {
                    String[] actualizacion = new String[6];
                    actualizacion[0] = request.getParameter("nombre");
                    actualizacion[1] = request.getParameter("productos");
                    actualizacion[2] = request.getParameter("precio");

                    m.gestionarMenu(actualizacion);

                }

            %>
            <div id="accordion" role="tablist">
                <div class="card">
                    <div class="card-header" role="tab" id="headingOne">
                        <h5 class="mb-0">
                            <a data-toggle="collapse" href="#collapse2" role="button" aria-expanded="true" aria-controls="collapseOne">
                                Cree un menu
                            </a>
                        </h5>
                    </div>

                    <div id="collapse2" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">

                        <section class ="row">

                            <section class="col-sm-4 offset-sm-4">  
                                <form>
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input name ="nombre" type="text" class="form-control" id="direccion" required ="true" placeholder="Ingrese el nombre del menu" value="<%=consulta[0]%>">

                                    </div>

                                    <label for="productos">Productos</label>
                                    <!---<input name ="productos" type="text" class="form-control" id="dueño" required ="true" placeholder="Ingrese los productos del restaurante" value="<%=consulta[1]%>"> -->
                                    <select class="custom-select form-control" name ="productos">


                                        <%
                                            ArrayList<String> prod = m.obtenerProductos();
                                            for (int i = 0; i < prod.size(); i += 4) {
                                                out.println("<option class= \"\" value =\"" + prod.get(i) + "\">" + prod.get(i) + "</option>");
                                            }
                                        %>
                                    </select>

                                    <div class="form-group">
                                        <label for="precio">Precio</label>
                                        <input name ="precio"  type="number" class="form-control" id="nit" required ="true" placeholder="Ingrese el costo del menu" value="<%=consulta[2]%>">

                                    </div>                
                                    <button type="submit" class="btn btn-primary" name="registrar">Actualizar</button>


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
                            <a data-toggle="collapse" href="#collapse3" role="button" aria-expanded="true" aria-controls="collapseOne">
                                Agregue productos al menu
                            </a>
                        </h5>
                    </div>

                    <div id="collapse3" class="collapse show" role="tabpanel" aria-labelledby="heading3" data-parent="#accordion">

                        <section class ="row">

                            <section class="col-sm-4 offset-sm-4">  
                                <form>
                                    <div class="form-group">
                                        <label for="nombreM">Nombre</label>
                                        <select class="custom-select form-control"  name = "nombreM">
                                            <%
                                                ArrayList<String> m2 = m.obtenerMenus();
                                                //name ="nombreM" 
                                                for (int i = 0; i < m2.size(); i += 3) {
                                                    out.println("<option  class= \"\" value =\"" + m2.get(i) + "\">" + m2.get(i) + "</option>");
                                                   
                                                }
                                            %>
                                        </select>

                                    </div>

                                    <label for="productosA">Productos</label>
                                    <!---<input name ="productos" type="text" class="form-control" id="dueño" required ="true" placeholder="Ingrese los productos del restaurante" value="<%=consulta[1]%>"> -->
                                    <select class="custom-select form-control" name ="productosA">

                                        <%
                                            ArrayList<String> prod2 = m.obtenerProductos();
                                            for (int i = 0; i < prod.size(); i += 4) {
                                                out.println("<option class= \"\" value =\"" + prod2.get(i) + "\">" + prod2.get(i) + "</option>");
                                            }
                                        %>
                                    </select>
                                    <%if (request.getParameter("AgregarP") != null) {
                                            String p = request.getParameter("productosA");
                                            String menu = request.getParameter("nombreM");
                                            System.out.println("mireme: "+p);
                                            System.out.println("mireme : "+ menu);
                                            m.productoAMenu(p, menu);
                                        }

                                    %>


                                    <button type="submit" class="btn btn-primary" name="AgregarP">Agregar Producto</button>


                                </form>

                            </section>


                        </section>
                    </div>
                </div>
            </div>
            <form>

                <button name ="ver" class="btn btn-primary bg-success" type ="submit" >
                    Ver Menus
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


                        <%                            
                            if (request.getParameter("ver") != null) {
                                ArrayList<String> datos = m.obtenerMenus();
                                for (int i = 0; i < datos.size(); i += 3) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"col\">" + (i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 2) + "</th>");
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
