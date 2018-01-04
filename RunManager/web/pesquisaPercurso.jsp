<%-- 
    Document   : pesquisaPercurso
    Created on : 10/10/2017, 08:50:18
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
        <title>Pesquisa de Percursos</title>
        <script src="angular.min.js"></script>
    </head>
    <body class="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Percursos</h1>
        <table class="customers">
            <input ng-model="search.itinerario" placeholder="Filtrar por Nome: " class="caixatexto">
            <tr>
                <th>ID</th>
                <th>Distancia (KM)</th>
                <th>Itinerario</th>
                <th colspan=2>Ação</th>
            </tr>
           
                <tr ng-repeat="percurso in percursos|filter:search:strict">
                    <td>{{percurso.id}}</td>
                    <td>{{percurso.distancia}}</td>
                    <td>{{percurso.itinerario}}</td>
                        <td><a href="ManterPercursoController?acao=prepararEditar&codPercurso={{percurso.id}}"/>Editar</a></td>
                        <td><a href="ManterPercursoController?acao=prepararExcluir&codPercurso={{percurso.id}}"/>Excluir</a></td>
                </tr>
            
        </table>
        <form action="ManterPercursoController?acao=prepararIncluir" method="post">
            <input class="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" class="botao" >Voltar</button>
        </form>
        <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("PercursoApi")
                                    .then(function successCallback(response) {
                                        $scope.percursos = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
