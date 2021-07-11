<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat, java.sql.*" %>
<%@include file="util/conexaoObjetos.jsp" %>
<%@include file="util/config.jsp" %>
<%
    String codigoNovo, hoje;
    Date data = new Date();
    SimpleDateFormat dataFormatada = new SimpleDateFormat("dd-MM-yyyy");
%>

<!DOCTYPE html>
<%@include file="util/conexaoIniciar.jsp" %>

<%    codigoNovo = request.getParameter("codigoNovo");
    if (codigoNovo == null) {
        codigoNovo = "0";
    }
    hoje = dataFormatada.format(data);
%>

<html>
    <head>
        <script language="javascript" src="util/funcoes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Bairro</title>
    </head>
    <body>

        <h1 align="center">Sistema de Cadastro de Clientes</h1>
        <h2 align="center">
            <font style="color: dodgerblue">Cadastrar Nova Cidade</font>
        </h2>

        <form name="formCadastrar" method="post" action="cidades.jsp?acao=gravar">
            <p>
                Código:
                <input type="text" name="codigo" value="<%= codigoNovo%>" disabled="true" /> - 
                Data de Cadastro: (dd-MM-aaaa)
                <input type="text" name="datatela" value="<%= hoje%>" disabled="true" size="10" maxlength="10" />
                <input type="hidden" name="datacad" value="<%= hoje%>" />
            </p>
            <p>
                Cidade:
                <input type="text" name="nome" size="20" maxlength="20" placeholder="Nome da cidade" />
            </p>


            <p>
                <input type="submit" name="btGravar" value="Gravar" />
                <input type="reset" name="btLimpar" value="Limpar" />
            </p>
        </form>
        <p align="center"><a href="cidades.jsp">[Voltar]</a></p>
        <p align="center"><a href="index.html">[Menu Principal]</a></p>

        <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
    </body>
</html>

<%@include file="util/conexaoFinalizar.jsp"  %>
