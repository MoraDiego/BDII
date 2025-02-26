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
            <h2>Modificar Pregrado</h2>
            <form action="#" method="POST">
                <label for="codigo">Codigo:</label>
                <input type="text" id="codigo" name="codigo" required>
                
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="creditos">Cantidad de Creditos:</label>
                <input type="number" id="creditos" name="creditos" min="1" required>
                
                <label for="nota">Nota Mi�nima Aprobatoria:</label>
                <input type="number" id="nota" name="nota" min="0" max="5" step="0.1" required>
                
                <label for="sede">Sede:</label>
                <select id="sede" name="sede" required>
                    <option value="norte">Norte</option>
                    <option value="sur">Sur</option>
                    <option value="centro">Centro</option>
                </select>
                
                <button type="submit" class="button">Modificar</button>
            </form>
            <a href="../index.html" >
                <button class="button">Volver</button>
            </a>
        </div>
    </div>
</body>
</html>