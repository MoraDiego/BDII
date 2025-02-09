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
public class AsignaturaDAO {
    public static boolean registrarAsignatura(String codigo, String cod_grupo, int horas_semanales) {
        String sql = "INSERT INTO asignatura (cod_asignatura, cod_grupo, horas_semanales) VALUES (?, ?, ?)";
        try{
            Connection conn=ConexionBD.getInstance().tomarConexion();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, codigo);
            stmt.setString(2, cod_grupo);
            stmt.setInt(3, horas_semanales);
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
