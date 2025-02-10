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
                %>
                <tr>
                    <td><%= pregrado.getCodigo() %></td>
                    <td><%= pregrado.getNombre() %></td>
                    <td><%= pregrado.getCreditos() %></td>
                    <td><%= pregrado.getNotaMinima() %></td>
                    <td>
                        <a href="verCursos.jsp">
                            <button class="button">Ver Cursos</button>
                        </a>
                        <form action="../registrar/regCursos.jsp" method="POST">
                            <button class="button" name="preg" type="submit" value="<%= pregrado.getCodigo()%>">Crear Curso</button>
                        </form>
                        <a href="../eliminar/eliminarCursos.jsp">
                            <button class="button">Eliminar Curso</button>
                        </a>
                    </td>
                    <td><%= pregrado.getSede() %></td>
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