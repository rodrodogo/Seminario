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
    
    
    
    public Ingrediente consultarInv(String busqueda){
         System.out.println(busqueda);
        for (Ingrediente i : ingredientes) {
            System.out.println("en busqueda " + i.getNombre()+ " valor " + busqueda);
            System.out.println(busqueda.equals(i.getNombre()));
            if(i.getNombre().equals(busqueda) || i.getNombre() == busqueda){
                System.out.println("encontrado");
                System.out.println(i.getNombre());
                return i;
                
            }
        }
        System.out.println("null culia");
        return null;
    }
    //cambio de parametros en el modelod de clases
    public void modificarInv(String[] modificaciones){
        System.out.println("antes");
        
        Ingrediente temp = consultarInv(modificaciones[0]);
        
        temp.setNombre(modificaciones[0]);
        
        temp.setCategoria(modificaciones[1]);
        temp.setCantidad(Integer.parseInt(modificaciones[2]));
        temp.setPrecio(Integer.parseInt(modificaciones[3]));
        temp.setCambiable(JSType.toBoolean(modificaciones[4]));
        temp.setCaracteristicas(modificaciones[5]);
        

    }
}
