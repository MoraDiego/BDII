/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Logica.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author diego
 */
public class CursoDAO {
    public static boolean registrarCurso(String codigo,String cod_pregrado, int capacidad_estudiantes) {
        String sql = "INSERT INTO curso (cod_curso, cod_pregrado, capacidad_estudiantes)"
                + " VALUES (?, ?, ?)";
        try(PreparedStatement stmt = ConexionBD.getInstance().tomarConexion().prepareStatement(sql)){
            stmt.setString(1, codigo);
            stmt.setString(2, cod_pregrado);
            stmt.setInt(3, capacidad_estudiantes);
            boolean exec=stmt.executeUpdate() > 0;
            ConexionBD.getInstance().liberarConexion();
            return exec;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
