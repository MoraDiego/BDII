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
    <title>Información Registrada</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="containerVer">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <h2>Información Registrada</h2>
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
                <tr>
                    <td>Ing Sis</td>
                    <td>01</td>
                    <td>160</td>
                    <td>
                        <a href="../ver/verGrupos.html" >
                            <button class="button">Ver Grupos</button>
                        </a>
                        <a href="../registrar/regGrupos.jsp" >
                            <button class="button">Crear Grupo</button>
                        </a>
                        <a href="../eliminar/cerrarGrupos.html" >
                            <button class="button">Cerrar Grupo</button>
                        </a>
                    </td>
                </tr>
                <!-- Más filas pueden ser añadidas dinámicamente -->
            </tbody>
        </table>
        <a href="verPregrados.html" >
            <button class="button">Volver</button>
        </a>
    </div>
</body>
</html>