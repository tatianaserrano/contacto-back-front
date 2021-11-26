<%-- 
    Document   : index.jsp
    Created on : 15-sep-2021, 15:23:25
    Author     : tserrano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar Contacto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/demo3/index.jsp">Inicio</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/demo3/guardarContacto.jsp">Guardar contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Actualizar contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Eliminar contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/demo3/listarContactos.jsp" ng-click="listarContactos()">Listar contactos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid" ng-app="demo3" ng-controller="controladorContactos">
            <div class="row">
                <div class="col-12">
                    <h1 style="text-align: center">Formulario de contacto</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Identificacion</label>
                        <input type="text" class="form-control" placeholder="Escriba su identificacion" ng-model="identificacion"><br/>

                        <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                        <input type="text" class="form-control" placeholder="Escriba su nombre" ng-model="nombre"><br/>

                        <label for="exampleFormControlInput1" class="form-label">Apellido</label>
                        <input type="text" class="form-control" placeholder="Escriba su apellido" ng-model="apellido"><br/>

                        <label class="form-label">Genero</label>
                        <select class="form-select" aria-label="Default select example" ng-model="genero">
                            <option>Femenino</option>
                            <option>Masculino</option>
                        </select><br/>

                        <label class="form-label">Tipo de identificación</label>
                        <select class="form-select" aria-label="Default select example" ng-model="tipoIdentificacion">
                            <option>CC</option>
                            <option>TI</option>
                        </select><br/>

                        <label for="exampleFormControlInput1" class="form-label">Telefono</label>
                        <input type="text" class="form-control" placeholder="Escriba su telefono" ng-model="telefono"><br/>

                        <label for="exampleFormControlInput1" class="form-label">Dirección</label>
                        <input type="text" class="form-control" placeholder="Escriba su direccion" ng-model="direccion"><br/>

                        <label for="exampleFormControlInput1" class="form-label">Correo</label>
                        <input type="text" class="form-control" placeholder="Escriba su correo" ng-model="correo"><br/>

                        <button  class="btn btn-success" ng-click="guardarContacto()">Guardar</button>
                    </div>
                </div>
                <div class="col-4"></div>

            </div>
        </div>
    </body>
    <script src="controlador.js"></script>
</html>
