/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Logica.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import Logica.Curso;

/**
 *
 * @author diego
 */
public class CursoDAO {
   public static boolean registrarCurso(String codigo, String cod_pregrado, int capacidad_estudiantes, String sede) {
    String sql = "INSERT INTO curso (cod_curso, cod_pregrado, capacidad_estudiantes) VALUES (?, ?, ?)";
    
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Tomar la conexión según la sede
        conn = ConexionBD.getInstance().tomarConexionPorSede(sede);
        stmt = conn.prepareStatement(sql);

        // Configurar los parámetros del PreparedStatement
        stmt.setString(1, codigo);
        stmt.setString(2, cod_pregrado);
        stmt.setInt(3, capacidad_estudiantes);

        // Ejecutar la consulta y verificar si se insertó correctamente
        int rowsAffected = stmt.executeUpdate();
        ConexionBD.getInstance().liberarConexion(); // Liberar la conexión
        return rowsAffected > 0;

    } catch (SQLException e) {
        System.err.println("Error al registrar curso: " + e.getMessage());
        e.printStackTrace();
        return false;

    } finally {
        // Cerrar recursos
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
   
   public static List<Curso> consultarCursosPorPregrado(String cod_pregrado, String sede) {
        String sql = "SELECT * FROM curso WHERE cod_pregrado = ?";
        List<Curso> cursos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Tomar la conexión según la sede
            conn = ConexionBD.getInstance().tomarConexionPorSede(sede);
            stmt = conn.prepareStatement(sql);

            // Configurar el parámetro del PreparedStatement
            stmt.setString(1, cod_pregrado);

            // Ejecutar la consulta
            rs = stmt.executeQuery();

            // Recorrer el ResultSet y crear objetos Curso
            while (rs.next()) {
                String codigo = rs.getString("cod_curso");
                int capacidadEstudiantes = rs.getInt("capacidad_estudiantes");

                Curso curso = new Curso(codigo, cod_pregrado, capacidadEstudiantes);
                cursos.add(curso);
            }

        } catch (SQLException e) {
            System.err.println("Error al consultar cursos por pregrado: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Liberar recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ConexionBD.getInstance().liberarConexion(); // Liberar la conexión
        }

        return cursos;
    }

   

}
   
    

