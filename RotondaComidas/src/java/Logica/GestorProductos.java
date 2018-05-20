/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.ArrayList;

/**
 *
 * @author Rodrigon
 */
public class GestorProductos {

    private ArrayList<Producto> productos;

    public GestorProductos() {
        productos = new ArrayList<Producto>();
        ArrayList<String> ingre = new ArrayList<String>();
        ingre.add("arina");
        Producto a = new Producto("pizza", ingre, false, 5000);
        productos.add(a);
    }
    
    public Producto consultarInv(String busqueda) {
        System.out.println(busqueda);
        for (Producto i : productos) {

            if (i.getNombreP().equals(busqueda) || i.getNombreP() == busqueda) {

                return i;

            }
        }

        return null;
    }
    
    public void actualizarProducto(Producto in) {


        Producto temp = consultarInv(in.getNombreP());

        if (temp == null) {
            productos.add(in);

        } else {
            temp.setNombreP(in.getNombreP());
            temp.setIngredientes(in.getIngredientes());
            temp.setPersonalisable(in.isPersonalisable());
            temp.setPrecio(in.getPrecio());
            
        }

    }
    

}