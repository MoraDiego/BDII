/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Logica.ConexionBD;
import Logica.Pregrado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author diego
 */

public class PregradoDAO {
public static boolean registrarPregrado(String codigo, String nombre, int creditos,
        int notaMinima, String sede) {
    String sql = "INSERT INTO pregrado (cod_pregrado, nombre, creditos, nota_minima, sede) VALUES (?, ?, ?, ?, ?)";
    
    try (PreparedStatement stmt = ConexionBD.getInstance().tomarConexion().prepareStatement(sql)) {
        // Configurar los parámetros del PreparedStatement
        stmt.setString(1, codigo);
        stmt.setString(2, nombre);
        stmt.setInt(3, creditos);
        stmt.setInt(4, notaMinima);
        stmt.setString(5, sede);
        
        // Ejecutar la consulta y verificar si se insertó correctamente
        int rowsAffected = stmt.executeUpdate();
        ConexionBD.getInstance().liberarConexion(); // Liberar la conexión al pool
        return rowsAffected > 0;
        
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
 // Nuevo método para consultar todos los pregrados

    public static List<Pregrado> consultarPregrados() {
        String sql = "SELECT * FROM pregrado";
        List<Pregrado> pregrados = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Tomar la conexión
            conn = ConexionBD.getInstance().tomarConexion();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            // Recorrer el ResultSet y crear objetos Pregrado
            while (rs.next()) {
                String codigo = rs.getString("cod_pregrado");
                String nombre = rs.getString("nombre");
                int creditos = rs.getInt("creditos");
                int notaMinima = rs.getInt("nota_minima");
                String sede = rs.getString("sede");

                Pregrado pregrado = new Pregrado(codigo, nombre, creditos, notaMinima, sede);
                pregrados.add(pregrado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Liberar la conexión y cerrar recursos
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

        return pregrados;
    }


}
