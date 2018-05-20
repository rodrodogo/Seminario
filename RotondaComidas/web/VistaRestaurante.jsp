<%-- 
    Document   : vistaRestaurante
    Created on : 20/05/2018, 10:17:41 AM
    Author     : fcher
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Mediador"%>
<%@page import="Logica.GestorRestaurante"%>
<%@page import="Logica.Restaurante"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
    </head>
    <body>
        <%!
            Mediador m= new Mediador();
            
            %>
        <section class="container">
            <form>
                <div class="form-group">
                    <label for="direccion">Direccion restaurante</label>
                    <input name ="dir" type="text" class="form-control" id="direccion" required ="true" placeholder="Ingrese la direccion del restaurante">
                    
                </div>
                 <div class="form-group">
                    <label for="dueño">Dueño restaurante</label>
                    <input name ="owner" type="text" class="form-control" id="dueño" required ="true" placeholder="Ingrese el nombre del dueño del rest...">
                    
                </div>
                 <div class="form-group">
                    <label for="nit">Nit restaurante</label>
                    <input name ="nit"  type="number" class="form-control" id="nit" required ="true" placeholder="Ingrese el nit del restaurante">
                    
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre restaurante</label>
                    <input name ="nombre"  type="text" class="form-control" id="nombre" required ="true" placeholder="Ingrese el nombre del restaurante">
                    
                </div>
                <div class="form-group">
                    <label for="tel">telefono restaurante</label>
                    <input name ="tel"  type="number" class="form-control" id="nit"  required ="true" placeholder="Ingrese el telefono del restaurante">
                    
                </div>
                <button type="submit" class="btn btn-primary" name="registrar">Registrar</button>
               <% if (request.getParameter("registrar") != null) {
                String[] actualizacion = new String[6];
                actualizacion[0] = request.getParameter("dir");
                actualizacion[1] = request.getParameter("owner");
                actualizacion[2] = request.getParameter("nit");
                actualizacion[3] = request.getParameter("nombre");
                actualizacion[4] = request.getParameter("tel");
                m.registrarRestaurante(actualizacion);
}

        %>
            </form>
        </section>       
        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
    </body>
</html>
