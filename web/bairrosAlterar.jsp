<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat, java.sql.*" %>
<%@include file="util/conexaoObjetos.jsp" %>

<%
    String codigo, nome;
%>

<!DOCTYPE html>
<%@include file="util/conexaoIniciar.jsp" %>

<%    codigo = request.getParameter("codigo");

    if (codigo == null) {
        codigo = "0";
    }
    resultado = instrucao.executeQuery("SELECT * FROM bairro WHERE codigo=" + codigo);
    if (resultado.next()) {
        nome = resultado.getString("nome");

%>

<html>
    <head>
        <script language="javascript" src="util/funcoes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>

        <h1 align="center">Sistema de Cadastro de Clientes</h1><br>
        <h2 align="center">
            <font style="color: dodgerblue">Alterar Cadastro de Bairro</font>
        </h2>

        <form name="formCadastrar" method="post" action="bairros.jsp?acao=alterar">
            <p>
                Código:
                <input type="text" name="codigo" value="<%= codigo%>" disabled="true" />
                <input type="hidden" name="codigoAlterar" value="<%= codigo%>" />  
            </p>
            <p>
                Bairro:
                <input type="text" name="nome" size="42" maxlength="40" value="<%=nome%>" />
            </p>

            <p>
                <input type="submit" name="btAlterar" value="Alterar" />
            </p>
        </form>
        <%
            } else {
                out.println("Registro não encontrado!");
            }
        %>



        <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
    </body>
</html>

<%@include file="util/conexaoFinalizar.jsp"  %>