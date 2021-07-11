<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="util/conexaoObjetos.jsp" %>
<%@include file="util/config.jsp" %>
<%!    String ordem, acao;
%>

<!DOCTYPE html>
<%@include file="util/conexaoIniciar.jsp" %>

<%    acao = request.getParameter("acao");
    if (acao == null) {
        acao = "listar";
    }
    if (acao.equals("excluir")) {
        instrucao.executeUpdate("DELETE FROM cidade WHERE codigo=" + request.getParameter("codigo"));
    } else if (acao.equals("gravar")) {
        String sql = "INSERT INTO cidade ("
                + "nome)"
                + "VALUES ('"
                + request.getParameter("nome") + "')";
        instrucao.executeUpdate(sql);
    } else if (acao.equals("editar")) {
        String sql = "UPDATE cidade SET "
                + "nome='" + request.getParameter("nome") + "'"
                + "WHERE codigo=" + request.getParameter("codigoEditar");
        instrucao.executeUpdate(sql);
    }
    ordem = request.getParameter("ordem");
    if (ordem == null) {
        ordem = "codigo";
    }
    resultado = instrucao.executeQuery("SELECT * FROM cidade ORDER BY " + ordem);  //Initialize object to store DB's results
%>

<html>
    <head>
        <script language="javascript" src="util/funcoes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <h1 align="center">Sistema de Cadastro de Clientes</h1>
         <h2 align="center">
            <font style="color: dodgerblue">Lista de Cidades</font>
        </h2>
        <p align="center">
            <%
                resultado.last();
            %>
            <a href="cidadesCadastrar.jsp?codigoNovo=<%=resultado.getRow() + 1%> ">[Cadastrar]</a> |
            <% resultado.beforeFirst(); %>
            <a href="cidadesImprimir.jsp">[Imprimir]</a>
        </p>
        <div align="center">
            <table border="1">
                <tr>
                    <td><a href="cidades.jsp?ordem=codigo">Código</a></td>
                    <td><a href="cidades.jsp?ordem=nome">Nome<a></td>
                                <td>Opções</td>
                                </tr>
                                <%
                                    int cont = 0;
                                    while (resultado.next()) {
                                %>
                                <tr>
                                    <td><%= resultado.getInt("codigo")%></td>
                                    <td><%= resultado.getString("nome")%></td>

                                    <td>
                                        <a href="javascript:confirma('<%=resultado.getInt("codigo")%>', 'excluir','Confirmar Exclusão?','cidades.jsp')">
                                            [Excluir]  
                                        </a> |
                                        <a href="javascript:confirma('<%= resultado.getInt("codigo")%>','editar','Confirmar Edição?','cidadesEditar.jsp')">
                                            [Editar]
                                        </a>
                                    </td>
                                </tr>
                                <%
                                        cont++;
                                    }
                                %>    
                                <tr>
                                    <td colspan="5">Quantidade de Endereços cadastrados é: <%= cont%> </td>
                                </tr>
                                </table>
                                </div>
                                <p align="center"><a href="index.html">[Menu Principal]</a></p>
                                <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
                                </body>
                                </html>

                                <%@include file="util/conexaoFinalizar.jsp"  %>