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
public class PregradoDAO {
    public static boolean registrarPregrado(String codigo, String nombre, int creditos,
            int notaMinima, String sede) {
        String sql = "INSERT INTO pregrado (cod_pregrado, nombre, creditos, nota_minima,"
                + " sede) VALUES (?, ?, ?, ?, ?)";
        try{
            Connection conn=ConexionBD.getInstance().tomarConexion();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, codigo);
            stmt.setString(2, nombre);
            stmt.setInt(3, creditos);
            stmt.setInt(4, notaMinima);
            stmt.setString(5, sede);
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
