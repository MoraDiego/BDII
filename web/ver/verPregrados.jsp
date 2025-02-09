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
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Creditos</th>
                    <th>Nota Mi�nima</th>
                    <th>Asignaturas</th>
                    <th>Sede</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(int i=0;i<10;i++){
                %>
                <tr>
                    <td><% out.println(i);%></td>
                    <td>Ingeniería de Sistemas</td>
                    <td>160</td>
                    <td>3.0</td>
                    <td>
                        <a href="verCursos.jsp" >
                            <button class="button">Ver Cursos</button>
                        </a>
                        <form action="../registrar/regCursos.jsp" method="POST">
                            <button class="button" name="preg" type="submit" value=<%=i%>>Crear Curso</button>
                        </form>
                            
                        <a href="../eliminar/eliminarCursos.jsp" >
                            <button class="button">Eliminar Curso</button>
                        </a>
                    </td>
                    <td>Norte</td>
                </tr>
                <%}%>
                <!-- Más filas pueden ser añadidas dinámicamente -->
            </tbody>
        </table>
        <a href="../index.html" >
            <button class="button">Volver</button>
        </a>
    </div>
</body>
</html>
