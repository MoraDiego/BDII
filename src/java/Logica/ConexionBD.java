package Logica;

import java.sql.Connection;
import java.sql.DriverManager;
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
     * Conexión compartida a la Base de Datos (Chapinero)
     */
    private Connection conexion = null;

    /**
     * Conexiones adicionales para Macarena y Ciudad Bolívar
     */
    private Connection conexionMacarena = null;
    private Connection conexionCiudadBolivar = null;

    /**
     * Bandera que indica el estado de la conexión
     */
    private boolean conexionLibre = true;

    /**
     * @return instancia del ServiceLocator para el manejo de la conexión
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
     * Constructor privado para inicializar las conexiones
     *
     * @throws Exception si no se puede crear alguna conexión
     */
    private ConexionBD() throws Exception {
        try {
            // Conexión Chapinero (existente)
            String urlChapinero = "jdbc:postgresql://localhost:5432/Chapinero";
            String usuario = "postgres";
            String password = "yo042002"; // Debe reemplazarse por el password en su propia instalación
            Class.forName("org.postgresql.Driver").newInstance();
            conexion = DriverManager.getConnection(urlChapinero, usuario, password);
            conexion.setAutoCommit(true);

            // Conexión Macarena
            String urlMacarena = "jdbc:postgresql://localhost:5432/Macarena";
            conexionMacarena = DriverManager.getConnection(urlMacarena, usuario, password);
            conexionMacarena.setAutoCommit(true);

            // Conexión Ciudad Bolívar
            String urlCiudadBolivar = "jdbc:postgresql://localhost:5432/CiudadBolivar";
            conexionCiudadBolivar = DriverManager.getConnection(urlCiudadBolivar, usuario, password);
            conexionCiudadBolivar.setAutoCommit(true);

            System.out.println("Conexiones establecidas para Chapinero, Macarena y Ciudad Bolívar.");
        } catch (Exception e) {
            throw new RuntimeException("ERROR_CONEXION_BD: " + e.getMessage());
        }
    }

    /**
     * Toma la conexión predeterminada (Chapinero)
     *
     * @return la conexión predeterminada
     */
    public synchronized Connection tomarConexion() {
        while (!conexionLibre) {
            try {
                wait(); // Espera hasta que la conexión esté libre
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        conexionLibre = false;
        notify(); // Notifica que la conexión está ocupada
        return conexion; // Devuelve la conexión predeterminada (Chapinero)
    }

    /**
     * Toma la conexión según la sede especificada
     *
     * @param sede la sede para la cual se necesita la conexión
     * @return la conexión correspondiente a la sede
     */
    public synchronized Connection tomarConexionPorSede(String sede) {
        while (!conexionLibre) {
            try {
                wait(); // Espera hasta que la conexión esté libre
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        conexionLibre = false;
        notify(); // Notifica que la conexión está ocupada

        switch (sede.toLowerCase()) {
            case "chapinero":
                return conexion; // Conexión predeterminada (Chapinero)
            case "macarena":
                return conexionMacarena;
            case "ciudad bolivar":
                return conexionCiudadBolivar;
            default:
                throw new IllegalArgumentException("Sede no válida: " + sede);
        }
    }

    /**
     * Libera la conexión para que otros procesos puedan utilizarla
     */
    public synchronized void liberarConexion() {
        conexionLibre = true;
        notify(); // Notifica a otros hilos que la conexión está disponible
    }

    /**
     * Cierra todas las conexiones a las bases de datos cuando se termina de ejecutar el programa
     */
    public void close() {
        try {
            if (conexion != null) conexion.close();
            if (conexionMacarena != null) conexionMacarena.close();
            if (conexionCiudadBolivar != null) conexionCiudadBolivar.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Realiza los cambios en la base de datos. Con este método se asegura que
     * no haya inconsistencias en el modelo relacional de la Base de datos.
     */
    public void commit() {
        try {
            if (conexion != null) conexion.commit();
            if (conexionMacarena != null) conexionMacarena.commit();
            if (conexionCiudadBolivar != null) conexionCiudadBolivar.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Deshace los cambios en la base de datos. Con este método se asegura que
     * no haya inconsistencias en el modelo relacional de la Base de datos.
     */
    public void rollback() {
        try {
            if (conexion != null) conexion.rollback();
            if (conexionMacarena != null) conexionMacarena.rollback();
            if (conexionCiudadBolivar != null) conexionCiudadBolivar.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}