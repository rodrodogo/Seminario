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
public class GestorInventario {

    private ArrayList<Ingrediente> ingredientes;

    public GestorInventario() {
        ingredientes = new ArrayList<Ingrediente>();
        Ingrediente a = new Ingrediente(5, "bueno", "a", "a", 1);
        Ingrediente b = new Ingrediente(5, "bueno", "b", "b", 1);
        Ingrediente c = new Ingrediente(5, "bueno", "c", "c", 1);
        Ingrediente d = new Ingrediente(5, "bueno", "d", "d", 1);
        ingredientes.add(a);
        ingredientes.add(b);
        ingredientes.add(c);
        ingredientes.add(d);
    }

    public Ingrediente consultarInv(String busqueda) {
        System.out.println(busqueda);
        for (Ingrediente i : ingredientes) {

            if (i.getNombre().equals(busqueda) || i.getNombre() == busqueda) {

                return i;

            }
        }

        return null;
    }

    //cambio de parametros en el modelod de clases
    public void modificarInv(Ingrediente in) {


        Ingrediente temp = consultarInv(in.getNombre());

        if (temp == null) {
            ingredientes.add(in);

        } else {
            temp.setNombre(in.getNombre());
            temp.setCategoria(in.getCategoria());
            temp.setCantidad(in.getCantidad());
            temp.setPrecio(in.getPrecio());
            temp.setCambiable(in.isCambiable());
            temp.setCaracteristicas(in.getCaracteristicas());
        }

    }
}
