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
    public static boolean registrarCurso(String codigo, String capacidad_estudiantes,int cod_pregrado) {
        String sql = "INSERT INTO curso (cod_curso, capacidad_estudiantes, cod_pregrado)"
                + " VALUES (?, ?, ?)";
        try{
            Connection conn=ConexionBD.getInstance().tomarConexion();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, codigo);
            stmt.setString(2, capacidad_estudiantes);
            stmt.setInt(3, cod_pregrado);
            boolean exec=stmt.executeUpdate() > 0;
            ConexionBD.getInstance().liberarConexion();
            ConexionBD.getInstance().close();
            return exec;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
