<%-- 
    Document   : apiContacto
    Created on : 21-sep-2021, 21:20:14
    Author     : tserrano
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String respuesta = "{";
    String proceso = request.getParameter("proceso");
    Contacto c = new Contacto();

    switch (proceso) {
        case "guardarContacto":
            System.out.println("Botn guardar");
            System.out.println(request.getParameter("identificacion"));
            c.setIdentificacion(Integer.parseInt(request.getParameter("identificacion")));
            c.setNombre(request.getParameter("nombre"));
            c.setApellido(request.getParameter("apellido"));
            c.setGenero(request.getParameter("genero"));
            c.setTipoIdentificacion(request.getParameter("tipoIdentificacion"));
            c.setTelefono(request.getParameter("telefono"));
            c.setDireccion(request.getParameter("direccion"));
            c.setCorreo(request.getParameter("correo"));
            if (c.guardarContacto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "actualizarContacto":
            System.out.println("Botn Actualizar");
            c.setIdentificacion(Integer.parseInt(request.getParameter("identificacion")));
            c.setNombre(request.getParameter("nombre"));
            c.setApellido(request.getParameter("apellido"));
            c.setGenero(request.getParameter("genero"));
            c.setTipoIdentificacion(request.getParameter("tipoIdentificacion"));
            c.setTelefono(request.getParameter("telefono"));
            c.setDireccion(request.getParameter("direccion"));
            c.setCorreo(request.getParameter("correo"));
            if (c.actualizarContacto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "eliminarContacto":
            System.out.println("Botn eliminar");
            int identificacion = Integer.parseInt(request.getParameter("identificacion"));
            if (c.borrarContacto(identificacion)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "listarContactos":
            System.out.println("Boton listar contacto");
            respuesta += "\"ok\": true,";
            List<Contacto> lista = c.listarContactos();
            if (lista.isEmpty()) {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":[]";
            } else {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
            }
            break;
        default:
            respuesta += "\"ok\": false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                    + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";

    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
