<%-- 
    Document   : pesquisaAdminisrador
    Created on : 24/10/2017, 09:17:41
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html ng-app="testApp">
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Administrador</title>
        <script src="angular.min.js"></script>
    </head>
    <body class="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Administradores</h1>
        <table class="customers">
            <input ng-model="search.nome" placeholder="Filtrar por Nome: " class="caixatexto">
            <tr>
                <th>Email</th>
                <th>CPF</th>
                <th>Nome</th>
                <th colspan=2>Ação</th>
            </tr>
            <tr ng-repeat="administrador in administradores|filter:search:strict">
                <td>{{administrador.email}}</td>
                <td>{{administrador.cpf}}</td>
                <td>{{administrador.nome}}</td>
                <td><a href="ManterAdministradorController?acao=prepararEditar&cpfAdministrador={{administrador.cpf}}"/>Editar</a></td>
                <td><a href="ManterAdministradorController?acao=prepararExcluir&cpfAdministrador={{administrador.cpf}}"/>Excluir</a></td>
            </tr>

        </table>
        <form action="ManterAdministradorController?acao=prepararIncluir" method="post">
            <input class="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
        <button onclick="location.href = '/RunManager';" class="botao" >Voltar</button>
        <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("AdministradorApi")
                                    .then(function successCallback(response) {
                                        $scope.administradores = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
