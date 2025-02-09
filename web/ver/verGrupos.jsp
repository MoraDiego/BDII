<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grupos</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="containerVer">
        <div class="logo">
            <img src="../img/Escudo.png" alt="Logo">
        </div>
        <h2>Grupos</h2>
        <table class="info">
            <thead>
                <tr>
                    <th>Pregrado</th>
                    <th>Codigo Curso</th>
                    <th>Codigo Grupo</th>
                    <th>Nombre</th>
                    <th>Semestre</th>
                    <th>Asignaturas</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(int i=0;i<10;i++){
                %>
                <tr>
                    <td>Ingenieria­a de Sistemas</td>
                    <td>001</td>
                    <td>001</td>
                    <td>Bases II</td>
                    <td>10</td>
                    <td>
                        <a href="../ver/verAsignaturas.jsp" >
                            <button class="button">Ver Asignaturas</button>
                        </a>
                        <form action="../registrar/regAsignaturas.jsp" method="POST">
                            <button class="button" name="grupo" type="submit" value=<%=i%>>Crear Asignatura</button>
                        </form>
                        <a href="../eliminar/cerrarAsignaturas.html" >
                            <button class="button">Cerrar Asignatura</button>
                        </a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <a href="verCursos.jsp" >
            <button class="button">Volver</button>
        </a>
    </div>
</body>
</html>