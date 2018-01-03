<%-- 
    Document   : pesquisaRanking
    Created on : 24/10/2017, 09:41:50
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
        <title>Pesquisa Ranking</title>
        <script src="angular.min.js"></script>
    </head>
    <body id="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Ranking</h1>
        <table id="customers">
            <input ng-model="search.id" placeholder="Filtrar por ID: " id="caixatexto">
            <tr>
                <th>ID</th>
                <th>Corrida</th>
                <th>Categoria</th>
                <th colspan=2>Ação</th>
            </tr>
            
                <tr ng-repeat="ranking in rankings|filter:search:strict">
                    <td>{{ranking.id}}</td>
                    <td>{{ranking.corrida_id}}</td>
                    <td>{{ranking.categoria_id}}</td>
                        <td><a href="ManterRankingController?acao=prepararEditar&idRanking={{ranking.id}}"/>Editar</a></td>
                        <td><a href="ManterRankingController?acao=prepararExcluir&idRanking={{ranking.id}}"/>Excluir</a></td>
                </tr>
            
        </table>
        <form action="ManterRankingController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" id="botao" >Voltar</button>
        </form>
        <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("RankingApi")
                                    .then(function successCallback(response) {
                                        $scope.rankings = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
