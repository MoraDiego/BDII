<%@ page import="DAOs.ProfesorDAO"%>
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
            <h2>Registro de Profesores</h2>
            <form action="regProfesores.jsp" method="POST">
                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documento" required>
                
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="direccion">Direccion:</label>
                <input type="text" id="direccion" name="direccion" required>
                
                <label for="telefono">Telefono:</label>
                <input type="tel" id="telefono" name="telefono" required>
                
                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="categoria">Categor�a:</label>
                <select id="categoria" name="categoria" required>
                    <option value="1">Instructor Auxiliar</option>
                    <option value="5">Instructor</option>
                    <option value="10">Profesor Asistente</option>
                    <option value="15">Profesor Asociado</option>
                    <option value="20">Profesor Titular</option>
                    <option value="30">Profesor Senior</option>
                    <option value="40">Investigador Asociado</option>
                    <option value="50">Investigador Senior</option>
                    <option value="70">Catedr�tico Distinguido</option>
                    <option value="99">Profesor Em�rito</option>
                </select>
                
                <button type="submit" class="button">Registrar</button>
            </form>
            <a href="../index.html" >
                <button class="button">Volver</button>
            </a>
            <%
                if (request.getMethod().equals("POST")) {
                    String documento = request.getParameter("documento");
                    String nombre = request.getParameter("nombre");
                    String direccion = request.getParameter("direccion");
                    String telefono = request.getParameter("telefono");
                    String correo = request.getParameter("correo");
                    int categoria = Integer.parseInt(request.getParameter("categoria"));
                    boolean registrado = ProfesorDAO.registrarProfesor(documento,
                    categoria, nombre, direccion, telefono, correo);

                    if (registrado) {
                        out.println("<p>Registro exitoso</p>");
                    } else {
                        out.println("<p>Error al registrar</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>