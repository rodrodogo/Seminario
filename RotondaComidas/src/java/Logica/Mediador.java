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

    public Mediador() {

        gInventario = new GestorInventario();
        gRestaurante = new GestorRestaurante();
        gProductos = new GestorProductos();

    }

    public void actualizarIng(String[] actualizacion) {
        Ingrediente ing = new Ingrediente(Integer.parseInt(actualizacion[2]),
                actualizacion[5], actualizacion[1], actualizacion[0],
                Integer.parseInt(actualizacion[3]));

        gInventario.modificarInv(ing);
    }
public ArrayList<String>  obtenerRestaurantes(){
    return gRestaurante.obtenerDatos();
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
                if (i == busqueda.getIngredientes().size()-1 ) {
                    ingredites += busqueda.getIngredientes().get(i);
                }else{
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
        String[] ingredientes = actualizacion[1].split(" ");
        ArrayList<String> arrayIngre = new ArrayList<String>();
        for (int i = 0; i < ingredientes.length; i++) {
            arrayIngre.add(ingredientes[i]);
        }
        System.out.println(actualizacion[0]+actualizacion[1]+actualizacion[2]+actualizacion[3]);
        Producto pro =  new Producto(actualizacion[0],arrayIngre,JSType.toBoolean(actualizacion[3]),Integer.parseInt(actualizacion[2]));
        gProductos.actualizarProducto(pro);
    }
}
