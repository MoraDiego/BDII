<%@ page import="DAOs.PregradoDAO" %>
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
            <h2>Registro de Pregrado</h2>
            <form action="./regPegrados.jsp" method="POST">
                <label for="codigo">Código:</label>
                <input type="text" id="codigo" name="codigo" required>
                
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="creditos">Cantidad de Créditos:</label>
                <input type="number" id="creditos" name="creditos" min="1" required>
                
                <label for="nota">Nota Mí­nima Aprobatoria:</label>
                <input type="number" id="nota" name="nota" min="0" max="5" step="1" required>
                
                <label for="sede">Sede:</label>
                <select id="sede" name="sede" required>
                    <option value="Chapinero">Chapinero</option>
                    <option value="Macarena">Macarena</option>
                    <option value="Ciudad Bolivar">Ciudad Bolivar</option>
                </select>
                
                <button type="submit" class="button">Registrar</button>
            </form>
            <a href="../index.html" >
                <button class="button">Volver</button>
            </a>
            <%
                if (request.getMethod().equals("POST")) {
                    String codigo = request.getParameter("codigo");
                    String nombre = request.getParameter("nombre");
                    int creditos = Integer.parseInt(request.getParameter("creditos"));
                    int notaMinima = Integer.parseInt(request.getParameter("nota"));
                    String sede = request.getParameter("sede");

                    boolean registrado = PregradoDAO.registrarPregrado(codigo, nombre, creditos, notaMinima, sede);

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
