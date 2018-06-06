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

    ArrayList<String> obtenerDatos() {
        ArrayList<String> res = new ArrayList<String>();
        for (int i = 0; i < productos.size(); i++) {
            res.add(productos.get(i).getNombreP());
            String ingre = "";

            Producto temp = productos.get(i);
            ArrayList<String> st = temp.getIngredientes();
            for (String p : st) {
                ingre = ingre + " " + p;
            }

            res.add(ingre);
            res.add("" + productos.get(i).getPrecio());
            res.add("" + productos.get(i).isPersonalisable());

        }
        return res;
    }

    public void agregarIngrediente(String nomP, String ing) {
        System.out.println("1 : "+nomP);
         System.out.println("2 : "+ing);
        for (Producto p : productos) {
            if (p.getNombreP().equals(nomP)) {
                p.agregarIng(ing);
                System.out.println("la wea si funciona");
            }
        }
    }
}
