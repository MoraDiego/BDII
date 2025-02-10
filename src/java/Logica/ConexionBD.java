package Logica;

import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;

/**
 * Recursos Humanos
 *
 * @author Alba Consuelo Nieto
 */
public class ConexionBD {

    /**
     * Instancia del ServiceLocator
     */
    private static ConexionBD instance = null;

    /**
     * Conexion compartida a la Base de Datos
     */
    private Connection conexion = null;

    /**
     * Bandera que indica el estado de la conexion
     */
    private boolean conexionLibre = true;

    /**
     * @return instancia del ServiceLocator para el manejo de la conexion
     */
    public static ConexionBD getInstance() {
        if (instance == null) {
            try {
                instance = new ConexionBD();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return instance;
    }

    /**
     * @throws Exception dice si no se pudo crear la conexion
     */
    private ConexionBD() throws Exception {
        try {
            // Se registra el Driver y se crea la conexion
            //String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String url = "jdbc:postgresql://localhost:5432/Chapinero";
            String usuario = "postgres";
            String password = "BDII"; //Debe reemplazarse por el password en su propia instalación
            Class.forName("org.postgresql.Driver").newInstance();
            conexion = DriverManager.getConnection(url, usuario, password);
            conexion.setAutoCommit(true);
        } catch (Exception e) {
            throw new CaException("ServiceLocator", "ERROR_CONEXION_BD " + e);
        }
    }

    /**
     * Toma la conexion para que ningun otro proceso la puedan utilizar
     * Toma la conexion para que ningun otro proceso la puedan utilizar
     *
     * @return da la conexion a la base de datos
     */
    public synchronized Connection tomarConexion() {
        while (!conexionLibre) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        conexionLibre = false;
        notify();
        return conexion;
    }

    /**
     * Libera la conexion de la bases de datos para que ningun otro proceso la
     * pueda utilizar
     */
    public synchronized void liberarConexion() {
    conexionLibre = true;
    notify(); // Notifica a otros hilos que la conexión está disponible
}

    /**
     * Cierra la conexion a la base de datos cuando se termina de ejecutar el
     * programa
     */
    public void close() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Realiza los cambios en la base de datos. Con este metodo se asegura que
     * no halla inconsitencias en el modelo relacional de la Base de datos.
     *
     * Se utiliza cuando el procedimiento de insercion es terminado
     * correctamente y se asegura que los datos en el modelo estan bien
     * relacionados.
     */
    public void commit() {
        try {
            conexion.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Deshace los cambios en la base de datos. Con este metodo se asegura que
     * no halla inconsitencias en el modelo relacional de la Base de datos.
     *
     * Se utiliza por lo general cuando se devuelve una Exepcion. Los
     * procedimientos intermedios no deberia quedar almacenados en la base de
     * datos.
     */
    public void rollback() {
        try {
            conexion.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
