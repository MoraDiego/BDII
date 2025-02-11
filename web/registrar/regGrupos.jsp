<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAOs.GrupoDAO" %>
<%@ page import="Logica.Grupo" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Grupo</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <div class="form">
            <h2>Registro de Grupo</h2>

            <%
                // Verificar si se envió el formulario (método POST)
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    // Obtener los parámetros del formulario
                    String codigoGrupo = request.getParameter("codigo");
                    String codigoCurso = request.getParameter("cod_curso");
                    String nombreCurso = request.getParameter("nombre_curso");
                    String sede = request.getParameter("sede");

                    // Validar que todos los campos obligatorios estén presentes
                    if (codigoGrupo == null || codigoGrupo.isEmpty()) {
                        out.println("<p style='color: red;'>Error: El campo 'Código del Grupo' es obligatorio.</p>");
                    } else if (codigoCurso == null || codigoCurso.isEmpty()) {
                        out.println("<p style='color: red;'>Error: El campo 'Código del Curso' es obligatorio.</p>");
                    } else if (nombreCurso == null || nombreCurso.isEmpty()) {
                        out.println("<p style='color: red;'>Error: El campo 'Nombre del Curso' es obligatorio.</p>");
                    } else if (sede == null || sede.isEmpty()) {
                        out.println("<p style='color: red;'>Error: El campo 'Sede' es obligatorio.</p>");
                    } else {
                        // Validar el campo 'semestre'
                        String semestreStr = request.getParameter("semestre");
                        if (semestreStr == null || semestreStr.isEmpty()) {
                            out.println("<p style='color: red;'>Error: El campo 'Semestre' es obligatorio.</p>");
                        } else {
                            try {
                                int semestre = Integer.parseInt(semestreStr); // Convertir a entero

                                // Crear un objeto Grupo
                                Grupo grupo = new Grupo(codigoGrupo, codigoCurso, nombreCurso, semestre);

                                // Registrar el grupo en la base de datos
                                boolean registrado = GrupoDAO.registrarGrupo(grupo, sede);

                                if (registrado) {
                                    out.println("<p style='color: green;'>El grupo ha sido registrado correctamente en " + sede.toUpperCase() + ".</p>");
                                } else {
                                    out.println("<p style='color: red;'>Error: El código del grupo ya existe o hubo un problema al registrar.</p>");
                                }
                            } catch (NumberFormatException e) {
                                out.println("<p style='color: red;'>Error: El campo 'Semestre' debe ser un número entero válido.</p>");
                            } catch (SQLException e) {
                                out.println("<p style='color: red;'>Error al conectar con la base de datos: " + e.getMessage() + "</p>");
                            }
                        }
                    }
                }
            %>

            <!-- Mostrar el formulario -->
            <form action="regGrupos.jsp" method="POST">
                <!-- Parámetros ocultos -->
                <input type="hidden" name="cod_curso" value="<%= request.getParameter("cod_curso") %>">

                <!-- Campos del formulario -->
                <label for="codigo">Código del Grupo:</label>
                <input type="text" id="codigo" name="codigo" required>

                <label for="nombre_curso">Nombre del Curso:</label>
                <input type="text" id="nombre_curso" name="nombre_curso" required>

                <label for="semestre">Semestre:</label>
                <input type="number" id="semestre" name="semestre" min="1" required>

                <!-- Selección de Sede -->
                <label for="sede">Sede:</label>
                <select id="sede" name="sede" required>
                    <option value="chapinero">Chapinero</option>
                    <option value="macarena">Macarena</option>
                    <option value="ciudad bolivar">Ciudad Bolívar</option>
                </select><br><br>

                <button type="submit" class="button">Registrar</button>
            </form>
            <a href="../ver/verCursos.jsp?cod_pregrado=<%= request.getParameter("cod_pregrado") %>&sede=<%= request.getParameter("sede") %>">
                <button class="button">Volver</button>
            </a>
        </div>
    </div>
</body>
</html>