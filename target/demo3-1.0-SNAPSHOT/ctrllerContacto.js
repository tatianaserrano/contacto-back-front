/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module('demo3', []);
app.controller('controladorContactos', function ($scope, $http) {
    var alertPlaceholder = document.getElementById('liveAlertPlaceholder')

    function alertPrueba(message, type) {
        var wrapper = document.createElement('div')
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

        alertPlaceholder.append(wrapper)
    }

    $scope.guardarContacto = function () {
        let regexNumbers = /^[0-9]*$/;
        console.log('entra');
        console.log('val: ', regexNumbers.test($scope.identificacion))
        if ($scope.nombre === undefined) {
            alert("Todos los campos son obligatorios");
        } else if (!regexNumbers.test($scope.identificacion)) {
            alert("El identificador debe ser numérico");
        } else {
            let contacto = {
                proceso: "guardarContacto",
                identificacion: $scope.identificacion,
                nombre: $scope.nombre,
                apellido: $scope.apellido,
                genero: $scope.genero,
                tipoIdentificacion: $scope.tipoIdentificacion,
                telefono: $scope.telefono,
                direccion: $scope.direccion,
                correo: $scope.correo
            };
            $http({
                method: 'POST',
                url: 'apiContacto.jsp',
                params: contacto
            }).then(function (res) {
                console.log(res.data);
                alert("Guardado con éxito");
            }).catch(function (error) {
                alertPrueba('Error al guardar contacto!', 'danger');
            });
        }

    };

    $scope.listarContactos = function () {
        console.log('Entra listar contactos');
        $scope.mostrarLista = true;
        let params = {
            proceso: "listarContactos"
        };
        $http({
            method: 'GET',
            url: 'apiContacto.jsp',
            params: params
        }).then(function (res) {
            $scope.contactos = res.data.Contactos;
        });
    };


    $scope.eliminarContacto = function () {
        if ($scope.idToDelete === undefined) {
            alert("La identificación del registro debe ser un número")
        } else {

            let contacto = {
                proceso: "eliminarContacto",
                identificacion: $scope.idToDelete
            };
            $http({
                method: 'GET',
                url: 'apiContacto.jsp',
                params: contacto
            }).then(function (res) {
                if (res.data.eliminarContacto === true) {
                    $scope.listarContactos();
                    alertPrueba('Contacto eliminado exitosamente!', 'success');
                } else {
                    alert("Por favor vefifique sus datos");
                }
            });
        }
    };

    $scope.actualizarContacto = function () {
        if ($scope.nombre === undefined || $scope.apellido === undefined || $scope.genero === undefined || $scope.tipoIdentificacion === undefined || $scope.telefono === undefined || $scope.direccion === undefined || $scope.correo === undefined) {
            alert("Todos los campos son obligatorios");
        } else if (typeof $scope.identificacion !== 'number') {
            alert("El identificador debe ser numérico");
        } else {
            let contacto = {
                proceso: "actualizarContacto",
                identificacion: $scope.identificacion,
                nombre: $scope.nombre,
                apellido: $scope.apellido,
                genero: $scope.genero,
                tipoIdentificacion: $scope.tipoIdentificacion,
                telefono: $scope.telefono,
                direccion: $scope.direccion,
                correo: $scope.correo
            };
            $http({
                method: 'GET',
                url: 'apiContacto.jsp',
                params: contacto
            }).then(function (res) {
                if (res.data.actualizarContacto === true) {
                    alert("actualizarcontacto con éxito");
                    //                                cn.listarContactos();
                } else {
                    alert("Por favor vefifique sus datos");
                }
            });

        }
    };

    $scope.setContacto = function (contacto) {
        $scope.actualizar = true;
        $scope.mostrarLista = false;
        $scope.identificacion = contacto.identificacion;
        $scope.nombre = contacto.nombre;
        $scope.apellido = contacto.apellido;
        $scope.genero = contacto.genero;
        $scope.tipoIdentificacion = contacto.tipoIdentificacion;
        $scope.telefono = contacto.telefono;
        $scope.direccion = contacto.direccion;
        $scope.correo = contacto.correo;
    };

    $scope.cleanContacto = function () {
        $scope.actualizar = false;
        $scope.mostrarLista = false;
        $scope.identificacion = undefined;
        $scope.nombre = undefined;
        $scope.apellido = undefined;
        $scope.genero = undefined;
        $scope.tipoIdentificacion = undefined;
        $scope.telefono = undefined;
        $scope.direccion = undefined;
        $scope.correo = undefined;
    };

    $scope.openModal = function (identificacion) {
        console.log('entra a borrar')
        console.log(identificacion)
        $scope.idToDelete = identificacion;
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        myModal.show();
    }




});

