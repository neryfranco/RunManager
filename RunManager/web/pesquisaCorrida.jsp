<%-- 
    Document   : pesquisaCorrida
    Created on : 16/10/2017, 17:45:17
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
        <title>Pesquisa de Corridas</title>
        <script src="angular.min.js"></script>
    </head>
    <body class="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Corridas</h1>
        <table class="customers">
            <input ng-model="search.nome" placeholder="Filtrar por Nome: " class="caixatexto">
            <tr>
                <th>Nome</th>
                <th>Local Largada</th>
                <th>Hora Largada</th>
                <th>Data da Corrida</th>
                <th colspan=2>Ação</th>
            </tr>          
                <tr ng-repeat="corrida in corridas|filter:search:strict">
                    <td>{{corrida.nome}}</td>
                    <td>{{corrida.localLargada}}</td>
                    <td>{{corrida.horaLargada}}</td>
                    <td>{{corrida.dataCorrida}}</td>  
                    <td><a href="ManterCorridaController?acao=prepararEditar&codCorrida={{corrida.id}}"/>Editar</a></td>
                    <td><a href="ManterCorridaController?acao=prepararExcluir&codCorrida={{corrida.id}}"/>Excluir</a></td>
                </tr>

            </table>
            <form action="ManterCorridaController?acao=prepararIncluir" method="post">
                <input class="botao" type="submit" name="btnIncluir" value="Incluir">
                <button onclick="location.href = '/RunManager';" class="botao" >Voltar</button>
            </form>
                <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("CorridaApi")
                                    .then(function successCallback(response) {
                                        $scope.corridas = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
        </body>
    </html>