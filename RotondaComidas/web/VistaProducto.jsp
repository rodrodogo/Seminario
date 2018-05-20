<%-- 
    Document   : VistaProducto
    Created on : 20/05/2018, 04:23:13 PM
    Author     : Rodrigon
--%>

<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
    </head>
    <body>
        <%!
            Mediador m = new Mediador();
            String[] consulta = new String[4];                                        

        %>
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

        </section>


        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>


        <%
            for (int i = 0; i < 4; i++) {
                        consulta[i] = "";
                }            
            
            if (request.getParameter("busIng") != null) {

                consulta = m.buscarProducto(request.getParameter("nombre"));
            }
            if (request.getParameter("actualizarIng") != null) {
                String[] actualizacion = new String[6];
                actualizacion[0] = request.getParameter("nom");
                actualizacion[1] = request.getParameter("categoria");
                actualizacion[2] = request.getParameter("cantidad");
                actualizacion[3] = request.getParameter("precio");
                
                m.registrarProducto(actualizacion);

            }
            
        %>
        <form>
            <div>

            Nombre:<input type="text" name="nom" value="<%=consulta[0]%>"> 
            </br>
            Ingredientes:<input type="text" name="categoria"value="<%=consulta[1]%>"> 
            </br>
            Precio:<input type="text" name="cantidad"value="<%=consulta[2]%>"> 
            </br>
            Personalizable<input type="text" name="precio"value="<%=consulta[3]%>"> 
            </br>            


            <input type="submit" name="actualizarIng" value="Enviar">
            </div>
        </form>  
       

    </body>
</html>
