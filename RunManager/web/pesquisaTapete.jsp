<%-- 
    Document   : pesquisaTapete
    Created on : 16/10/2017, 17:26:10
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
        <title>Pesquisa de Tapetes</title>
        <script src="angular.min.js"></script>
    </head>
    <body id="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Tapetes</h1>
        <table id="customers">
            <input ng-model="search.id" placeholder="Filtrar por ID: " id="caixatexto">
            <tr>
                <th>ID</th>
                <th>CEP</th>
                <th>Rua</th>
                <th>Cidade</th>
                <th>UF</th>
                <th>Referência</th>
                <th colspan=3>Ação</th>
            </tr>
            
                <tr ng-repeat="tapete in tapetes|filter:search:strict">
                    <td>{{tapete.id}}</td>
                    <td>{{tapete.cep}}</td>
                    <td>{{tapete.rua}}</td>
                    <td>{{tapete.cidade}}</td>
                    <td>{{tapete.uf}}</td>
                    <td>{{tapete.referencia}}</td>  
                    <td><a href="ManterTapeteController?acao=prepararEditar&codTapete={{tapete.id}}"/>Editar</a></td>
                    <td><a href="ManterTapeteController?acao=prepararExcluir&codTapete={{tapete.id}}"/>Excluir</a></td>
                </tr>
            
        </table>
        <form action="ManterTapeteController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" id="botao" >Voltar</button>
        </form>
        <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("AdministradorApi")
                                    .then(function successCallback(response) {
                                        $scope.tapetes = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
