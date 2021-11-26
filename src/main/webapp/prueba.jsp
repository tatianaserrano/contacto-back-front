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
    Contacto c = new Contacto();

    switch (proceso) {
        case "guardarContacto":
            int ident = Integer.parseInt(request.getParameter("identificacion"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            
            c.setIdentificacion(ident);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setGenero(genero);
            c.setTipoIdentificacion(tipoident);
            c.setTelefono(telefono);
            c.setDireccion(direccion);
            c.setCorreo(correo);
            System.out.println("Botn guardar");
            if (c.guardarContacto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "actualizarcontacto":
            break;
        case "eliminarcontacto":
            break;
        case "listarcontacto":
            respuesta += "\"ok\": true,";
            try {
                List<Contacto> lista = c.listarContactos();
                respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":[]";
                Logger.getLogger(Contacto.class.getName()).log(Level.SEVERE, null, ex);
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
