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
public class GrupoDAO {
    public static boolean registrarGrupo(String codigo, String cod_curso,String curso, int semestre) {
        String sql = "INSERT INTO grupo (cod_grupo, cod_curso, curso, semestre) VALUES (?, ?, ?, ?)";
        try(PreparedStatement stmt = ConexionBD.getInstance().tomarConexion().prepareStatement(sql)){
            stmt.setString(1, codigo);
            stmt.setString(2, cod_curso);
            stmt.setString(3, curso);
            stmt.setInt(4, semestre);
            boolean exec=stmt.executeUpdate() > 0;
            ConexionBD.getInstance().liberarConexion();
            return exec;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
