<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // 1. Recibir parámetros (Paso 3 de la guía)
    String mascota = request.getParameter("mascota");
    String tipo = request.getParameter("tipo");
    String adoptante = request.getParameter("adoptante");

    // 2. Recuperar la lista actual de la sesión (o crear una si no existe)
    List<String> adopciones = (List<String>) session.getAttribute("lista_adopciones");
    if (adopciones == null) {
        adopciones = new ArrayList<>();
    }

    // 3. Agregar el nuevo registro a la lista
    if (mascota != null && adoptante != null) {
        String nuevoRegistro = "🐾 " + mascota + " (" + tipo + ") fue adoptado por " + adoptante;
        adopciones.add(nuevoRegistro);
        
        // 4. Guardar la lista actualizada en la sesión (Paso 3 de la guía)
        session.setAttribute("lista_adopciones", adopciones);
    }

    // 5. Redirigir a index.jsp (Paso 4 de la guía: validar 302 Redirect)
    response.sendRedirect("index.jsp");
%>