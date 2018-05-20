/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

/**
 *
 * @author fcher
 */
public class Restaurante {

    private String descripcion;
    private String direccion;
    private String dueño;
    private int nit;
    private String nombre;
    private int telefono;

    Restaurante(String[] data) {
        direccion = data[0];
        dueño = data[1];
        nit = Integer.parseInt(data[2]);
        nombre = data[3];
        telefono = Integer.parseInt(data[4]);
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public void setNit(int nit) {
        this.nit = nit;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getDueño() {
        return dueño;
    }

    public int getNit() {
        return nit;
    }

    public String getNombre() {
        return nombre;
    }

    public int getTelefono() {
        return telefono;
    }
   
    
public void crearMenu(String[] actualizacion){
       
    }
public void eliminarMenu (String[] actualizacion){
       
    }
}
