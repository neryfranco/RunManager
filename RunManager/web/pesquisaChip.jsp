<%-- 
    Document   : pesquisaChip
    Created on : 26/10/2017, 11:45:12
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
        <title>Pesquisa Chip</title>
        <script src="angular.min.js"></script>
    </head>
    <body id="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Chips</h1>
        <table id="customers">
            <input ng-model="search.numero" placeholder="Filtrar por Nome: " id="caixatexto">
            <tr>
                <th>Número</th>
                <th>Percurso</th>
                <th colspan=2>Ação</th>
            </tr>
            <tr ng-repeat="chip in chips|filter:search:strict">
                <td>{{chip.numero}}</td>
                <td>{{chip.percurso_id}}</td>
                <td><a href="ManterChipController?acao=prepararEditar&numPeitoChip=<c:out value="${chip.numero}"/>">Editar</a></td>
                <td><a href="ManterChipController?acao=prepararExcluir&numPeitoChip=<c:out value="${chip.numero}"/>">Excluir</a></td>
            </tr>

        </table>
        <form action="ManterChipController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" id="botao" >Voltar</button>
        </form>
            <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("ChipApi")
                                    .then(function successCallback(response) {
                                        $scope.chips = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>

    </body>
</html>

