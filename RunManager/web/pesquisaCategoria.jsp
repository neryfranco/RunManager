<%-- 
    Document   : pesquisaCategoria
    Created on : 16/10/2017, 18:28:23
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
        <title>Pesquisa de Categorias</title>
        <script src="angular.min.js"></script>
    </head>
    <body id="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Categorias</h1>
        <table id="customers">
            <input ng-model="search.idadeIni" placeholder="Filtrar por Idade Inicial: " id="caixatexto">
            <tr>
                <th>ID</th>
                <th>Sexo</th>
                <th colspan=2>Faixa Etária</th>
                <th colspan=2>Ação</th>
            </tr>
            <tr  ng-repeat="categoria in categorias|filter:search:strict">
                <td>{{categoria.id}}</td>
                <td>{{categoria.sexo}}</td>
                <td>{{categoria.idadeIni}}</td>
                <td>{{categoria.idadeFim}}</td>  
                <td><a href="ManterCategoriaController?acao=prepararEditar&codCategoria={{categoria.id}}"/>Editar</a></td>
                <td><a href="ManterCategoriaController?acao=prepararExcluir&codCategoria={{categoria.id}}"/>Excluir</a></td>
            </tr>

        </table>
        <form action="ManterCategoriaController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" id="botao" >Voltar</button>
        </form>
        <script>
            var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("CategoriaApi")
                                    .then(function successCallback(response) {
                                        $scope.categorias = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
