<%-- 
    Document   : verCursos
    Created on : 8 feb 2025, 19:09:27
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <table class="info">
            <thead>
                <tr>
                    <th>Pregrado</th>
                    <th>Codigo</th>
                    <th>Capacidad estudiantes</th>
                    <th>Grupos</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(int i=0;i<10;i++){
                %>
                <tr>
                    <td>Ing Sis</td>
                    <td>01</td>
                    <td>160</td>
                    <td>
                        <a href="../ver/verGrupos.jsp" >
                            <button class="button">Ver Grupos</button>
                        </a>
                        <form action="../registrar/regGrupos.jsp" method="POST">
                            <button class="button" name="curso" type="submit" value=<%=i%>>Crear Grupo</button>
                        </form>
                        <a href="../eliminar/cerrarGrupos.html" >
                            <button class="button">Cerrar Grupo</button>
                        </a>
                    </td>
                </tr>
                <%}%>
                <!-- Más filas pueden ser añadidas dinámicamente -->
            </tbody>
        </table>
        <a href="verPregrados.jsp" >
            <button class="button">Volver</button>
        </a>
    </div>
</body>
</html>