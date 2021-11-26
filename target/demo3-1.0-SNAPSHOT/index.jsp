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
        <title>Contactos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <style>
            th,td{
                text-align: center;
            }
            #liveAlertPlaceholder{
                width: 90%;
                margin:20px auto;
            }
        </style>
    </head>
    <body>
        <div ng-app="demo3" ng-controller="controladorContactos">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/demo3/index.jsp">Inicio</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="" ng-click="cleanContacto()">Guardar contactos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="" ng-click="listarContactos()">Listar contactos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id="liveAlertPlaceholder"></div>
            <div class="container-fluid" ng-show="!mostrarLista">
                <div class="row">
                    <div class="col-12">
                        <h1 style="text-align: center">Formulario de contacto</h1>
                    </div>
                </div>
                <div class="row d-flex justify-content-center" style="margin-bottom: 50px;">
                    <div class="col-6">
                        <label for="exampleFormControlInput1" class="form-label">Identificacion</label>
                        <input type="text" class="form-control" placeholder="Escriba su identificacion" ng-model="identificacion" ng-disabled="actualizar"><br/>

                        <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                        <input type="text" class="form-control" placeholder="Escriba su nombre" ng-model="nombre"><br/>

                        <label for="exampleFormControlInput1" class="form-label">Apellido</label>
                        <input type="text" class="form-control" placeholder="Escriba su apellido" ng-model="apellido"><br/>

                        <label class="form-label">Genero</label>
                        <select class="form-select" aria-label="Default select example" ng-model="genero">
                            <option selected>Femenino</option>
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

                        <button  class="btn btn-success" ng-click="guardarContacto()" id="liveAlertBtn" ng-show="!actualizar">Guardar</button>
                        <button  class="btn btn-success" ng-click="actualizarContacto()" id="liveAlertBtn" ng-show="actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
            <div class="container-fluid" ng-show="mostrarLista">
                <div class="row">
                    <div class="col-12">
                        <h1 style="text-align: center">Lista de contactos</h1>
                    </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>  
                            <th>Nombre</th>  
                            <th>Apellido</th>  
                            <th>Genero</th>  
                            <th>Tipo id</th>  
                            <th>Telefono</th>  
                            <th>Direccion</th>  
                            <th>Correo</th>
                            <th>Borrar</th>
                            <th>Actualizar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat = "contacto in contactos">  
                            <td>{{ contacto.identificacion}}</td>  
                            <td>{{ contacto.nombre}}</td>  
                            <td>{{ contacto.apellido}}</td>  
                            <td>{{ contacto.genero}}</td>  
                            <td>{{ contacto.tipoIdentificacion}}</td>  
                            <td>{{ contacto.telefono}}</td>  
                            <td>{{ contacto.direccion}}</td>  
                            <td>{{ contacto.correo}}</td>
                            <td style="cursor: pointer;" ng-click="openModal(contacto.identificacion)"><img src="./images/trash.png" alt="borrar"/></td>  
                            <td style="cursor: pointer;" ng-click="setContacto(contacto)"><img src="./images/edit.png" alt="actualizar"/></td>  
                        </tr> 
                    </tbody>
                </table>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Borrar contacto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Está seguro que desea borrar el contacto?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" ng-click="eliminarContacto()">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <script src="ctrllerContacto.js"></script>
</html>
