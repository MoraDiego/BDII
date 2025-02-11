package DAOs;

import Logica.Grupo;
import Logica.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class GrupoDAO {

    public static boolean registrarGrupo(Grupo grupo, String sede) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Obtener la conexión específica para la sede
            conn = ConexionBD.getInstance().tomarConexionPorSede(sede);

            // Consulta SQL para insertar el grupo
            String sql = "INSERT INTO grupo (cod_grupo, cod_curso, curso, semestre) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, grupo.getCodigoGrupo()); // Código del grupo
            stmt.setString(2, grupo.getCodigoCurso()); // Código del curso
            stmt.setString(3, grupo.getCurso());       // Nombre del curso
            stmt.setInt(4, grupo.getSemestre());       // Semestre

            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0; // Retorna true si se insertó al menos una fila
        } finally {
            // Cerrar recursos
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            // Liberar la conexión
            ConexionBD.getInstance().liberarConexion();
            // No cerrar la conexión aquí, ya que el pool la gestionará
        }
    }
}