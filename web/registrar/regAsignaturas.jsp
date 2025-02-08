<%-- 
    Document   : regAsignaturas
    Created on : 7 feb 2025, 21:32:18
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Pregrado</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <div class="form">
            <h2>Registro de Asignatura</h2>
            <form action="#" method="POST">
                <label for="codigo">Código:</label>
                <input type="text" id="codigo" name="codigo" required>

                <label for="horas">Horas semanales:</label>
                <input type="number" id="horas" name="horas" min="1" required>
                
                <button type="submit" class="button">Registrar</button>
            </form>
            <a href="../index.html" >
                <button class="button">Volver</button>
            </a>
        </div>
    </div>
</body>
</html>