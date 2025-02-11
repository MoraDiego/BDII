<%@ page import="DAOs.PregradoDAO" %>
<%@ page import="Logica.Pregrado" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pregrados</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="containerVer">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <h2>Pregrados</h2>
        <table class="info">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Créditos</th>
                    <th>Nota Mínima</th>
                    <th>Acciones</th>
                    <th>Sede</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Obtener la lista de pregrados desde la base de datos
                    List<Pregrado> pregrados = PregradoDAO.consultarPregrados();
                    
                    // Iterar sobre la lista y mostrar cada pregrado en una fila de la tabla
                    for (Pregrado pregrado : pregrados) {
                        String cod_pregrado = pregrado.getCodigo();
                        String nombre = pregrado.getNombre();
                        int creditos = pregrado.getCreditos();
                        double notaMinima = pregrado.getNotaMinima();
                        String sede = pregrado.getSede(); // Asumimos que cada pregrado tiene una sede asociada
                %>
                <tr>
                    <td><%= cod_pregrado %></td>
                    <td><%= nombre %></td>
                    <td><%= notaMinima %></td>
                    <td><%= creditos %></td>
                    <td>
                        <!-- Botón para ver cursos -->
                        <a href="verCursos.jsp?cod_pregrado=<%= cod_pregrado %>&sede=<%= sede %>">
                            <button class="button">Ver Cursos</button>
                        </a>
                        
                        <!-- Formulario para crear curso -->
                        <form action="../registrar/regCursos.jsp" method="POST" style="display: inline;">
                            <button class="button" name="preg" type="submit" value="<%= cod_pregrado %>">Crear Curso</button>
                        </form>
                        
                        <!-- Enlace para eliminar curso -->
                        <a href="../eliminar/eliminarCursos.jsp?cod_pregrado=<%= cod_pregrado %>">
                            <button class="button">Eliminar Curso</button>
                        </a>
                    </td>
                    <td><%= sede %></td>
                </tr>
                <%
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