<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="util/conexaoObjetos.jsp" %>
<%!    String ordem, acao;
%>

<!DOCTYPE html>
<%@include file="util/conexaoIniciar.jsp" %>

<%    acao = request.getParameter("acao");
    ordem = request.getParameter("ordem");
    if (acao == null) {
        acao = "listar";
    }

    if (ordem == null) {
        ordem = "codigo";
    }
    resultado = instrucao.executeQuery("SELECT * FROM bairro ORDER BY " + ordem);  //Initialize object to store DB's results
%>

<html>
    <head>
        <script language="javascript" src="util/funcoes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <div align="center">
            <h1 align="center">Sistema de Cadastro de Clientes</h1>
            <h2><font style="color:dodgerblue">Relatório de Bairros Cadastrados</font></h2>

            <table border="1">
                <tr>
                    <td><a href="enderecos.jsp?ordem=codigo">Código</a></td>
                    <td><a href="enderecos.jsp?ordem=nome">Nome<a></td>
                                </tr>
                                <%
                                    int cont = 0;
                                    while (resultado.next()) {
                                %>
                                <tr>
                                    <td><%= resultado.getInt("codigo")%></td>
                                    <td><%= resultado.getString("nome")%></td>

                                </tr>
                                <%
                                        cont++;
                                    }
                                %>    
                                <tr>
                                    <td colspan="2">Quantidade de Endereços cadastrados é: <%= cont%> </td>
                                </tr>
                                </table>
                                </div>
                                <div align="center">
                                    <br>
                                    <input type="button" name="imprimir" value="Imprimir" onclick="window.print()" />

                                </div>
                                <p align="center"><a href="bairros.jsp">[Voltar]</a></p>
                                <p align="center"><a href="index.html">[Menu Principal]</a></p>
                                <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
                                </body>
                                </html>

                                <%@include file="util/conexaoFinalizar.jsp"  %>