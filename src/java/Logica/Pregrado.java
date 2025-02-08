/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

/**
 *
 * @author diego
 */
public class Pregrado {
    private String codigo;
    private String nombre;
    private int notaMinima;
    private int creditos;
    private String sede;

    public Pregrado(String codigo, String nombre, int notaMinima, int creditos, String sede) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.notaMinima = notaMinima;
        this.creditos = creditos;
        this.sede = sede;
    }
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNotaMinima() {
        return notaMinima;
    }

    public void setNotaMinima(int notaMinima) {
        this.notaMinima = notaMinima;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }
    
}
