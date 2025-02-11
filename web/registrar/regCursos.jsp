<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAOs.CursoDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Curso</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <div class="form">
            <h2>Registro de Curso</h2>
            <form action="regCursos.jsp" method="POST">
                <!-- Código del Pregrado -->
                <label for="codigo"><% out.println(request.getParameter("preg")); %></label>
                
                <!-- Código del Curso -->
                <label for="codigo">Código del Curso:</label>
                <input type="text" id="codigo" name="codigo" required>
                
                <!-- Capacidad de Estudiantes -->
                <label for="capacidad">Capacidad de estudiantes:</label>
                <input type="number" id="capacidad" name="capacidad" min="1" required>
                
                <!-- Selección de Sede -->
                <label for="sede">Sede:</label>
                <select id="sede" name="sede" required>
                    <option value="chapinero">Chapinero</option>
                    <option value="macarena">Macarena</option>
                    <option value="ciudad bolivar">Ciudad Bolívar</option>
                </select><br><br>
                
                <!-- Botón de Registro -->
                <button type="submit" class="button" name="preg" value="<%=request.getParameter("preg")%>">Registrar</button>
            </form>
            
            <!-- Botón para Volver -->
            <a href="../index.html">
                <button class="button">Volver</button>
            </a>

            <!-- Procesamiento del Formulario -->
            <%
                String referer = request.getHeader("Referer");
                if (request.getMethod().equals("POST") && referer.contains("registrar/regCursos.jsp")) {
                    // Obtener los parámetros del formulario
                    String codigo = request.getParameter("codigo");
                    String cod_pregrado = request.getParameter("preg");
                    int capacidad_estudiantes = Integer.parseInt(request.getParameter("capacidad"));
                    String sede = request.getParameter("sede"); // Nueva variable para la sede

                    // Registrar el curso usando el DAO
                    boolean registrado = CursoDAO.registrarCurso(codigo, cod_pregrado, capacidad_estudiantes, sede);

                    // Mostrar mensaje de éxito o error
                    if (registrado) {
                        out.println("<p style='color: green;'>Registro exitoso en " + sede.toUpperCase() + "</p>");
                    } else {
                        out.println("<p style='color: red;'>Error al registrar el curso en " + sede.toUpperCase() + "</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>