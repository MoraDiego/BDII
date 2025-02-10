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
public class ProfesorDAO {
    public static boolean registrarProfesor(String numero_documento, int categoria,
            String nombre, String direccion, String telefono, String e_mail) {
        String sql = "INSERT INTO profesor (numero_documento, categoria, nombre,"
                + " direccion, telefono, e_mail) VALUES (?, ?, ?, ?, ?, ?)";
        try{
            Connection conn=ConexionBD.getInstance().tomarConexion();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, numero_documento);
            stmt.setInt(2, categoria);
            stmt.setString(3, nombre);
            stmt.setString(4, direccion);
            stmt.setString(5, telefono);
            stmt.setString(6, e_mail);
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
