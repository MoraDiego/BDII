<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAOs.CursoDAO" %>
<%@ page import="Logica.Curso" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cursos</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="containerVer">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <h2>Cursos</h2>

        <%
            // Obtener los parámetros del request
            String cod_pregrado = request.getParameter("cod_pregrado");
            String sede = request.getParameter("sede");

            // Mensajes de depuración para verificar los parámetros recibidos
          //  out.println("<p style='color: blue;'>Parámetros recibidos:</p>");
           // out.println("<p>Código del Pregrado: " + (cod_pregrado != null ? cod_pregrado : "No proporcionado") + "</p>");
            // out.println("<p>Sede: " + (sede != null ? sede : "No proporcionada") + "</p>");

            if (cod_pregrado == null || sede == null) {
                out.println("<p style='color: red;'>Faltan parámetros: cod_pregrado o sede.</p>");
            } else {
                // Consultar los cursos asociados al pregrado
                List<Curso> cursos = CursoDAO.consultarCursosPorPregrado(cod_pregrado, sede);

                // Mensaje de depuración para verificar los cursos obtenidos
                out.println("<p style='color: green;'>Cursos encontrados: " + cursos.size() + "</p>");

                if (cursos.isEmpty()) {
                    out.println("<p>No hay cursos registrados para este pregrado.</p>");
                } else {
        %>
        <table class="info">
            <thead>
                <tr>
                    <th>Pregrado</th>
                    <th>Código del Curso</th>
                    <th>Capacidad de Estudiantes</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Curso curso : cursos) {
                %>
                <tr>
                    <td><%= cod_pregrado %></td>
                    <td><%= curso.getCodigoCurso() %></td>
                    <td><%= curso.getCapacidadEstudiantes() %></td>
                    <td>
                        <!-- Botón para ver grupos -->
                        <a href="../ver/verGrupos.jsp?cod_curso=<%= curso.getCodigoCurso() %>">
                            <button class="button">Ver Grupos</button>
                        </a>
                        <!-- Botón para crear grupo -->
                        <form action="../registrar/regGrupos.jsp" method="POST" style="display: inline;">
                            <button class="button" name="cod_curso" type="submit" value="<%= curso.getCodigoCurso() %>">Crear Grupo</button>
                        </form>
                        <!-- Botón para cerrar grupo -->
                        <a href="../eliminar/cerrarGrupos.html?cod_curso=<%= curso.getCodigoCurso() %>">
                            <button class="button">Cerrar Grupo</button>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
                }
            }
        %>
        <!-- Botón para Volver -->
        <a href="verPregrados.jsp">
            <button class="button">Volver</button>
        </a>
    </div>
</body>
</html>