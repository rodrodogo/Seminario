/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.ArrayList;

/**
 *
 * @author fcher
 */
public class GestorRestaurante {
private ArrayList <Restaurante> rest;

    public GestorRestaurante() {
        this.rest = new ArrayList<Restaurante>();
    }

    public boolean guardarDatos(Restaurante r) {
        boolean cre=false;
        for (int i = 0; i < rest.size(); i++) {
            if (rest.get(i).getNit()==r.getNit()){
                cre=true;
            }
        }
        if (cre==false){
            rest.add(r);
        }
        return !cre;
        
        //tendria que guardar datos en base de datos
    }
    public boolean actualizarDatos (Restaurante r){
       boolean cre=false;//para saber si se modifico o no
        for (int i = 0; i < rest.size(); i++) {
            if (rest.get(i).getNit()==r.getNit()){
                cre=true;
                Restaurante temp= rest.get(i);
                temp.setDescripcion(r.getDescripcion());
                temp.setDireccion(r.getDireccion());
                temp.setDueño(r.getDueño());
                temp.setNit(r.getNit());
                temp.setNombre(r.getNombre());
                temp.setTelefono(r.getTelefono());
                break;
            }
        }
        
        return cre;
    }
    public void borrarDatos(String[] actualizacion){
       
    }public void obtenerDatos (String[] actualizacion){
       
    }
    
}
