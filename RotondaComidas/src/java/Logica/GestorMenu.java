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
public class GestorMenu {
    private ArrayList<Menu> menus;

    public GestorMenu() {
        menus = new ArrayList<Menu>();
        ArrayList<String> product = new ArrayList<String>();
        
    }
    
    public Menu consultarMenu(String busqueda) {
        System.out.println(busqueda);
        for (Menu i : menus) {

            if (i.getNombre().equals(busqueda) || i.getNombre() == busqueda) {

                return i;

            }
        }

        return null;
    }
    
    public void actualizarMenu(Menu in) {


        Menu temp = consultarMenu(in.getNombre());

        if (temp == null) {
            menus.add(in);

        } else {
            temp.setNombre(in.getNombre());
            temp.setProductos(in.getProductos());            
            temp.setPrecio(in.getPrecio());
            
        }

    }

    public ArrayList<String>  obtenerDatos (){
       ArrayList<String> res=new ArrayList<String>();
        for (int i = 0; i < menus.size(); i++) {
           res.add(menus.get(i).getNombre());
           String productos = "";

            for (int j = 0; j < menus.get(i).getProductos().size(); j++) {
                if (j == menus.get(i).getProductos().size() - 1) {
                    productos += menus.get(i).getProductos().get(j);
                } else {
                    productos += menus.get(i).getProductos().get(j) + " ";
                }

            }
                   
           res.add(productos);
           res.add(""+menus.get(i).getPrecio());
           
       }
        return res;
    }
    
}
