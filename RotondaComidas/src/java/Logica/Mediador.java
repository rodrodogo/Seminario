/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.ArrayList;
import jdk.nashorn.internal.runtime.JSType;

/**
 *
 * @author Rodrigon
 */
public class Mediador {

    private GestorInventario gInventario;
    private GestorRestaurante gRestaurante;
    private GestorProductos gProductos;
    private GestorMenu gMenu;
    private GestorFactura gVentas;
    private GestorDatos gDatos;

    private ArrayList<String> tempMenu;

    public Mediador() {

        gInventario = new GestorInventario();
        gRestaurante = new GestorRestaurante();
        gProductos = new GestorProductos();
        gVentas = new GestorFactura();
        gMenu = new GestorMenu();
        tempMenu = new ArrayList<>();
        gDatos = new GestorDatos();
        System.out.println("la wea team");
        cargaDatos();
    }

    public void actualizarIng(String[] actualizacion) {
        Ingrediente ing = new Ingrediente(Integer.parseInt(actualizacion[2]),
                actualizacion[5], actualizacion[1], actualizacion[0],
                Integer.parseInt(actualizacion[3]));

        gInventario.modificarInv(ing);
    }

    public ArrayList<String> obtenerRestaurantes() {
        return gRestaurante.obtenerDatos();
    }

    public ArrayList<String> obtenerMenus() {
        return gMenu.obtenerDatos();
    }

    public ArrayList<String> obtenerProductos() {
        return gProductos.obtenerDatos();
    }

    public void productoAMenu(String p, String M) {
        gMenu.agregarProducto(p, M);
    }

    public ArrayList<String> obtenerIngredientes() {

        return gInventario.obtenerDatos();
    }

    public void añadirProductoCarrito(String nombre, String cantidad) {
        Menu temp = gMenu.consultarMenu(nombre);

        ArrayList<String> arrayProductos = temp.getProductos();
        for (int j = 0; j < Integer.parseInt(cantidad); j++) {
            tempMenu.add(nombre);
            for (int i = 0; i < arrayProductos.size(); i++) {

                Producto tempPro = gProductos.consultarInv(arrayProductos.get(i));

                gVentas.añadirACarrito(tempPro);
            }
        }

    }

    public ArrayList<String> tempCarrito() {
        return tempMenu;
    }

    public void eliminarProductoCarrito(int index) {
        Menu temp = gMenu.consultarMenu(tempMenu.get(index));
        ArrayList<String> arrayProductos = temp.getProductos();
        for (int i = 0; i < arrayProductos.size(); i++) {

            Producto tempPro = gProductos.consultarInv(arrayProductos.get(i));

            gVentas.borrarACarrito(tempPro);
        }
    }

    public void finalizarOrden() {
        gVentas.finalizarCarrito();
        tempMenu.clear();
    }

    public ArrayList<String> obtenerOrdenes() {
        Producto pizza = gProductos.consultarInv("pizza");
        String[] venta = new String[4];
        venta[0] = "2305180001";
        venta[1] = "0.20";
        venta[2] = "20 de mayo 1996";
        venta[3] = "Luis Mendez";
        gVentas.añadirProducto(pizza, venta);
        pizza = gProductos.consultarInv("pizza2");
        venta[0] = "2305180002";
        gVentas.añadirProducto(pizza, venta);
        gVentas.terminarVenta("2305180001");
        return gVentas.obtenerDatos();
    }

    public void agregarIngAProducto(String nP, String nI) {
        gProductos.agregarIngrediente(nP, nI);
    }

    public boolean registrarRestaurante(String[] actualizacion, int op) {
        Restaurante r = new Restaurante(actualizacion);
        //operacion de registrar
        boolean res = false;
        if (op == 1) {
            res = gRestaurante.guardarDatos(r);
        } else {
            res = gRestaurante.actualizarDatos(r);
        }

        return res;
    }

    public String[] consultarIng(String key) {
        Ingrediente busqueda = gInventario.consultarInv(key);
        if (busqueda == null) {
            String[] envio = new String[6];
            envio[0] = "no existe";
            envio[1] = "no existe";
            envio[2] = "no existe";
            envio[3] = "no existe";
            envio[4] = "no existe";
            envio[5] = "no existe";

            return envio;
        } else {

            String[] envio = new String[6];
            envio[0] = busqueda.getNombre();
            envio[1] = busqueda.getCategoria();
            envio[2] = "" + busqueda.getCantidad();
            envio[3] = "" + busqueda.getPrecio();
            envio[4] = "" + busqueda.isCambiable();
            envio[5] = "" + busqueda.getCaracteristicas();
            return envio;
        }
    }

    public String[] buscarProducto(String key) {
        Producto busqueda = gProductos.consultarInv(key);
        if (busqueda == null) {
            String[] envio = new String[4];
            envio[0] = "no existe";
            envio[1] = "no existe";
            envio[2] = "no existe";
            envio[3] = "no existe";

            return envio;
        } else {
            String[] envio = new String[4];
            envio[0] = busqueda.getNombreP();
            String ingredites = "";

            for (int i = 0; i < busqueda.getIngredientes().size(); i++) {
                if (i == busqueda.getIngredientes().size() - 1) {
                    ingredites += busqueda.getIngredientes().get(i);
                } else {
                    ingredites += busqueda.getIngredientes().get(i) + " ";
                }

            }

            envio[1] = ingredites;
            envio[2] = "" + busqueda.getPrecio();
            envio[3] = "" + busqueda.isPersonalisable();

            return envio;
        }

    }

    public void registrarProducto(String[] actualizacion) {
        String ingredientes = actualizacion[1];
        ArrayList<String> arrayIngre = new ArrayList<String>();

        arrayIngre.add(ingredientes);

        Producto pro = new Producto(actualizacion[0], arrayIngre, JSType.toBoolean(actualizacion[3]), Integer.parseInt(actualizacion[2]));
        gProductos.actualizarProducto(pro);
    }

    public String[] consultarMenu(String key) {
        Menu busqueda = gMenu.consultarMenu(key);
        if (busqueda == null) {
            String[] envio = new String[3];
            envio[0] = "no existe";
            envio[1] = "no existe";
            envio[2] = "no existe";

            return envio;
        } else {
            String[] envio = new String[4];
            envio[0] = busqueda.getNombre();
            String productos = "";

            for (int i = 0; i < busqueda.getProductos().size(); i++) {
                if (i == busqueda.getProductos().size() - 1) {
                    productos += busqueda.getProductos().get(i);
                } else {
                    productos += busqueda.getProductos().get(i) + " ";
                }

            }

            envio[1] = productos;
            envio[2] = "" + busqueda.getPrecio();

            return envio;
        }

    }

    public void gestionarMenu(String[] actualizacion) {
        String producto = actualizacion[1];

        Menu menutemp = new Menu(actualizacion[0], producto, Integer.parseInt(actualizacion[2]));
        gMenu.actualizarMenu(menutemp);
    }

    private void cargaDatos() {
        ArrayList<String> ingredientes = gDatos.leerIngredientes();
        ArrayList<String> productos = gDatos.leerProductos();
        ArrayList<String> menus = gDatos.leerMenus();
        ArrayList<String> restaurantes = gDatos.leerRestaurante();
        ArrayList<String> facturas = gDatos.leerFactura();
        ArrayList<String> menuProdu = gDatos.leerMenuProducto();
        ArrayList<String> produIngre = gDatos.leerProductoIngredientes();
        for (int i = 0; i < ingredientes.size(); i++) {
            String[] ingrediente = new String[5];
            ingrediente = ingredientes.get(i).split(",");
            actualizarIng(ingrediente);
        }

        for (int i = 0; i < productos.size(); i++) {
            String[] producto = new String[3];
            String[] productoFinal = new String[4];
            producto = productos.get(i).split(",");
            String listaIngredientes = new String();
            listaIngredientes = "";
            for (int j = 0; j < produIngre.size(); j++) {
                String[] proIng = produIngre.get(j).split(",");
                if (producto[0].equals(proIng[0])) {
                    listaIngredientes = listaIngredientes +" "+ proIng[1];
                }
            }
            productoFinal[0]=producto[0];
            productoFinal[1]=listaIngredientes;
            productoFinal[2]=producto[2];
            productoFinal[3]=producto[1];
            registrarProducto(productoFinal);
        }
        
        for (int i = 0; i < menus.size(); i++) {
            String [] menu = new String[2];
            String [] menuFinal = new String[3];
            menu = menus.get(i).split(",");
            String listaProductos = new String();
            listaProductos ="";
            for (int j = 0; j < menuProdu.size(); j++) {
                String [] menPro =menuProdu.get(j).split(",");
                if (menu[0].equals(menPro[0])) {
                    listaProductos = listaProductos +" "+ menPro[1];
                }
            }
           menuFinal[0]=menu[0];
           menuFinal[1]=listaProductos;
           menuFinal[2]=menu[1];
            gestionarMenu(menuFinal);
        }
        registrarRestaurante(restaurantes.get(0).split(","), 1);  
    }

//    private void machete() {
//        Ingrediente in = new Ingrediente(10, "listo", "base", "arina", 1000);
//        gInventario.modificarInv(in);
//        ArrayList<String> ingre = new ArrayList<String>();
//        ingre.add("arina");
//        Producto pro = new Producto("pizza", ingre, true, 0);
//        gProductos.actualizarProducto(pro);
//        ArrayList<String> prodi = new ArrayList<String>();
//        prodi.add("pizza");
//        Menu men = new Menu("Combo1", prodi, 1000);
//        gMenu.actualizarMenu(men);
//        
//        Ingrediente ina = new Ingrediente(10, "listo", "base", "arroz", 1000);
//        gInventario.modificarInv(ina);
//        ArrayList<String> ingres = new ArrayList<String>();
//        ingres.add("arroz");
//        Producto pros = new Producto("arroz", ingres, true, 0);
//        gProductos.actualizarProducto(pros);
//        ArrayList<String> prodis = new ArrayList<String>();
//        prodis.add("arroz");
//        Menu mens = new Menu("Combo2", prodis, 1000);
//        gMenu.actualizarMenu(mens);
//    }
}
