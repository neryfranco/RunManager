<%-- 
    Document   : pesquisaKit
    Created on : 24/10/2017, 10:13:23
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
        <title>Pesquisa Kit</title>
        <script src="angular.min.js"></script>
    </head>
    <body class="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Kits</h1>
        <table class="customers">
            <input ng-model="search.numPeito" placeholder="Filtrar por Número: " class="caixatexto">
            <tr>
                <th>Número de Peito</th>
                <th>Chip</th>
                <th>Camisa</th>
                <th colspan=2>Ação</th>
            </tr>
            
                <tr ng-repeat="kit in kits|filter:search:strict">
                    <td>{{kit.numPeito}}</td>
                    <td>{{kit.chip_num}}</td>
                    <td>{{kit.camisa_id}}</td>
                        <td><a href="ManterKitController?acao=prepararEditar&numPeitoKit={{kit.numPeito}}"/>Editar</a></td>
                        <td><a href="ManterKitController?acao=prepararExcluir&numPeitoKit={{kit.numPeito}}"/>Excluir</a></td>
                </tr>
            
        </table>
        <form action="ManterKitController?acao=prepararIncluir" method="post">
            <input class="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
        <button onclick="location.href = '/RunManager';" class="botao" >Voltar</button>
        <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("KitApi")
                                    .then(function successCallback(response) {
                                        $scope.kits = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
