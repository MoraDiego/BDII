package DAOs;

import Logica.Profesor;
import Logica.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;


public class ProfesorDAO {

public static boolean registrarProfesor(String numero_documento, int categoria,
    String nombre, String direccion, String telefono, String e_mail) {
    String sql = "INSERT INTO profesor (numero_documento, categoria, nombre, direccion, telefono, e_mail) VALUES (?, ?, ?, ?, ?, ?)";
    
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
    System.out.println("Tomando conexión...");
    conn = ConexionBD.getInstance().tomarConexion();
    System.out.println("Conexión tomada.");

    stmt = conn.prepareStatement(sql);
    stmt.setString(1, numero_documento);
    stmt.setInt(2, categoria);
    stmt.setString(3, nombre);
    stmt.setString(4, direccion);
    stmt.setString(5, telefono);
    stmt.setString(6, e_mail);

    System.out.println("Ejecutando consulta...");
    int rowsAffected = stmt.executeUpdate();
    System.out.println("Consulta ejecutada. Filas afectadas: " + rowsAffected);

    ConexionBD.getInstance().liberarConexion();
    System.out.println("Conexión liberada.");
    
    return rowsAffected > 0;

} catch (SQLException e) {
    System.err.println("Error al registrar profesor: " + e.getMessage());
    e.printStackTrace();
    return false;
}

    
    
    
    
}
    
    
     // Nuevo método para consultar todos los profesores
    
    public static List<Profesor> consultarProfesores() {
    String sql = "SELECT * FROM profesor";
    List<Profesor> profesores = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Tomar la conexión
        conn = ConexionBD.getInstance().tomarConexion();
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        // Recorrer el ResultSet y crear objetos Profesor
        while (rs.next()) {
            String numeroDocumento = rs.getString("numero_documento");
            int categoria = rs.getInt("categoria");
            String nombre = rs.getString("nombre");
            String direccion = rs.getString("direccion");
            String telefono = rs.getString("telefono");
            String email = rs.getString("e_mail");

            Profesor profesor = new Profesor(numeroDocumento, nombre, direccion, telefono, email, categoria);
            profesores.add(profesor);
        }

    } catch (SQLException e) {
        System.err.println("Error al consultar profesores: " + e.getMessage());
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

    return profesores;
}
    
    
}
    
