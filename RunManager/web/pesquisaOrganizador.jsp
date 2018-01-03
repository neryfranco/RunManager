<%-- 
    Document   : pesquisaOrganizador
    Created on : 16/10/2017, 22:28:21
    Author     : Victor Domingos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html ng-app="testApp">
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Organizador</title>
        <script src="angular.min.js"></script>
    </head>
    <body id="principal" ng-controller="testController" ng-init="getRequest()">
        <h1>Pesquisa de Organizadores</h1>
        <table id="customers">
            <input ng-model="search.nome" placeholder="Filtrar por Nome: " id="caixatexto">
            <tr>
                <th>Email</th>
                <th>Telefone</th>
                <th>Nome</th>
                <th colspan=2>Ação</th>
            </tr>
            
                <tr ng-repeat="organizador in organizadores|filter:search:strict">
                    <td>{{organizador.cpf}}</td>
                    <td>{{organizador.email}}</td>
                    <td>{{organizador.nome}}</td>
                        <td><a href="ManterOrganizadorController?acao=prepararEditar&cpfOrganizador={{organizador.cpf}}"/>Editar</a></td>
                        <td><a href="ManterOrganizadorController?acao=prepararExcluir&cpfOrganizador={{organizador.cpf}}"/>Excluir</a></td>
                </tr>
            
        </table>
        <form action="ManterOrganizadorController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
            <button onclick="location.href = '/RunManager';" id="botao" >Voltar</button>
        </form>
        <script>
                    var testApp = angular.module('testApp', []);
                    testApp.controller('testController', function ($scope, $http) {
                        $scope.getRequest = function () {
                            console.log("I've been pressed!");
                            $http.get("OrganizadorApi")
                                    .then(function successCallback(response) {
                                        $scope.organizadores = response.data;
                                    }, function errorCallback(response) {
                                        console.log("Unable to perform get request");
                                    });
                        };
                    });
        </script>
    </body>
</html>
