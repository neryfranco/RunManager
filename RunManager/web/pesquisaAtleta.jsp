<%-- 
    Document   : pesquisaAtleta
    Created on : 17/10/2017, 08:56:17
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
        <title>Pesquisa Atleta</title>
        <script src="angular.min.js"></script>        
    </head>
    <body id="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Atletas</h1>
        <table id="customers">
            <input ng-model="search.nome" placeholder="Filtrar por Nome: " id="caixatexto">
            <tr>
                <th>Email</th>                
                <th>CPF</th>
                <th>Nome</th>
                <th colspan=2>Ação</th>
            </tr>
            <tr ng-repeat="atleta in atletas|filter:search:strict">                
                <td>{{atleta.email}}</td>
                <td>{{atleta.cpf}}</td>
                <td>{{atleta.nome}}</td>
                <td><a href="ManterAtletaController?acao=prepararEditar&cpfAtleta={{atleta.cpf}}"/>Editar</a></td>
                <td><a href="ManterAtletaController?acao=prepararExcluir&cpfAtleta={{atleta.cpf}}"/>Excluir</a></td>
            </tr>
        </table>
        <form action="ManterAtletaController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" id="botao" >Voltar</button>
        </form>
        <script>
            var testApp = angular.module('testApp', []);
            testApp.controller('testController', function ($scope, $http) {
            $scope.getRequest = function () {
            console.log("I've been pressed!");
            $http.get("AtletaApi")
                    .then(function successCallback(response) {
                    $scope.atletas = response.data;
                    }, function errorCallback(response) {
                    console.log("Unable to perform get request");
                    });
            };
            });
        </script>
    </body>
</html>
