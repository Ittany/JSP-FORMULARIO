<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Recuperamos la lista de adopciones que está guardada en la sesión
    List<String> adopciones = (List<String>) session.getAttribute("lista_adopciones");
    if (adopciones == null) {
        adopciones = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Refugio JSP</title>
    <style>
        body { font-family: system-ui; max-width: 600px; margin: 40px auto; background: #f4f7f6; }
        form { background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); margin-bottom: 20px; }
        input, select, button { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box;}
        button { background: #9b59b6; color: #fff; border: none; font-weight: bold; cursor: pointer; }
        .card { background: #fff; padding: 15px; border-radius: 8px; border-left: 5px solid #9b59b6; margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>🐾 Adopciones (JSP)</h1>
    
    <form action="procesar.jsp" method="POST">
        <label>Nombre de la mascota:</label>
        <input type="text" name="mascota" required>
        
        <label>Tipo:</label>
        <select name="tipo">
            <option value="Perro">Perro 🐶</option>
            <option value="Gato">Gato 🐱</option>
        </select>
        
        <label>Tu nombre:</label>
        <input type="text" name="adoptante" required>

        <button type="submit">Registrar Adopción</button>
    </form>

    <h2>📋 Registros guardados en Sesión (<%= adopciones.size() %>)</h2>
    
    <% if (adopciones.isEmpty()) { %>
        <p>Aún no hay adopciones registradas.</p>
    <% } else { %>
        <% for (String reg : adopciones) { %>
            <div class="card"><%= reg %></div>
        <% } %>
    <% } %>

</body>
</html>