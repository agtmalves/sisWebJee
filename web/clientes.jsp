<%-- 
    Document   : clientes
    Created on : 07/09/2020, 22:28:02
    Author     : AGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <h1 align="center">Sistema de Cadastro de Clientes</h1>
    <p align="center">
        <a href="clientesCadastrar.jsp">[Cadastrar]</a> |
        <a href="clientesImprimir.jsp">[Imprimir]</a>
    </p>
    <div align="center">
        <table border="1">
            <tr>
                <td>Código</td><td>Nome</td><td>CPF</td><td>E-mail</td>
            </tr>
            <tr>
                <td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td colspan="4">Quantidade de Clientes cadastrados é: 0</td>
            </tr>
        </table>
    </div>
    <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
    </body>
</html>
