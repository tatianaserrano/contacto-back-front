<%-- 
    Document   : api.jsp
    Created on : 16-sep-2021, 9:01:03
    Author     : tserrano
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Contacto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>
<%
    String respuesta = "{";

//Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarcontacto",
        "eliminarcontacto",
        "listarcontacto",
        "guardarContacto"
    });

    String proceso = request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";

        Contacto c = new Contacto();
        try {
            List<Contacto> lista = c.listarContactos();
            respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
        } catch (SQLException ex) {
            respuesta += "\"" + proceso + "\": true,\"Contactos\":[]";
            Logger.getLogger(Contacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>
