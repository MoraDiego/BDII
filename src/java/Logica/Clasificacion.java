/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

/**
 *
 * @author diego
 */
public class Clasificacion {
    private String descCategoria;
    private int categoria;
    private int nMaxHoras;
    private int sueldo;

    public Clasificacion(String descCategoria, int categoria, int nMaxHoras, int sueldo) {
        this.descCategoria = descCategoria;
        this.categoria = categoria;
        this.nMaxHoras = nMaxHoras;
        this.sueldo = sueldo;
    }

    public String getDescCategoria() {
        return descCategoria;
    }

    public void setDescCategoria(String descCategoria) {
        this.descCategoria = descCategoria;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public int getnMaxHoras() {
        return nMaxHoras;
    }

    public void setnMaxHoras(int nMaxHoras) {
        this.nMaxHoras = nMaxHoras;
    }

    public int getSueldo() {
        return sueldo;
    }

    public void setSueldo(int sueldo) {
        this.sueldo = sueldo;
    }
    
}
