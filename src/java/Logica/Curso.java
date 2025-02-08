/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

/**
 *
 * @author diego
 */
public class Curso {
    private String codigoCurso;
    private String codigoPregrado;
    private int capacidadEstudiantes;

    public Curso(String codigoCurso, String codigoPregrado, int capacidadEstudiantes) {
        this.codigoCurso = codigoCurso;
        this.codigoPregrado = codigoPregrado;
        this.capacidadEstudiantes = capacidadEstudiantes;
    }
    
    public String getCodigoCurso() {
        return codigoCurso;
    }

    public void setCodigoCurso(String codigoCurso) {
        this.codigoCurso = codigoCurso;
    }

    public String getCodigoPregrado() {
        return codigoPregrado;
    }

    public void setCodigoPregrado(String codigoPregrado) {
        this.codigoPregrado = codigoPregrado;
    }

    public int getCapacidadEstudiantes() {
        return capacidadEstudiantes;
    }

    public void setCapacidadEstudiantes(int capacidadEstudiantes) {
        this.capacidadEstudiantes = capacidadEstudiantes;
    }
    
    
}
