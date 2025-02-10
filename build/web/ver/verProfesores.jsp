<%@ page import="DAOs.ProfesorDAO" %>
<%@ page import="Logica.Profesor" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profesores</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="containerVer">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <h2>Profesores</h2>
        <table class="info">
            <thead>
                <tr>
                    <th>Documento</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Categoría</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Obtener la lista de profesores desde la base de datos
                    List<Profesor> profesores = ProfesorDAO.consultarProfesores();

                    if (profesores.isEmpty()) {
                %>
                <tr>
                    <td colspan="6">No hay profesores registrados.</td>
                </tr>
                <%
                    } else {
                        // Iterar sobre la lista y mostrar cada profesor en una fila de la tabla
                        for (Profesor profesor : profesores) {
                %>
                <tr>
                    <td><%= profesor.getDocumento() %></td>
                    <td><%= profesor.getNombre() %></td>
                    <td><%= profesor.getDireccion() %></td>
                    <td><%= profesor.getTelefono() %></td>
                    <td><%= profesor.getEmail() %></td>
                    <td><%= profesor.getCategoria() %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <a href="../index.html">
            <button class="button">Volver</button>
        </a>
    </div>
</body>
</html>