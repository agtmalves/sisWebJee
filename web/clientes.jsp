<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="util/conexaoObjetos.jsp"%>
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
        instrucao.executeUpdate("DELETE FROM cliente WHERE codigo=" + request.getParameter("codigo"));
    } else if (acao.equals("gravar")) {
        String sql = "INSERT INTO cliente ("
                + "nome,endereco,numero,complemento,bairro,cidade,estado,"
                + "rg,cpf,telfixo,telcel,email,sexo,datanasc,datacad,obs)"
                + "VALUES ('"
                + request.getParameter("nome").toUpperCase() + "',"
                + request.getParameter("endereco") + ",'"
                + request.getParameter("numero") + "','"
                + request.getParameter("complemento") + "',"
                + request.getParameter("bairro") + ","
                + request.getParameter("cidade") + ","
                + request.getParameter("estado") + ",'"
                + request.getParameter("rg") + "','"
                + request.getParameter("cpf") + "','"
                + request.getParameter("telfixo") + "','"
                + request.getParameter("telcel") + "','"
                + request.getParameter("email") + "','"
                + request.getParameter("sexo") + "','"
                + request.getParameter("datanasc") + "','"
                + request.getParameter("datacad") + "','"
                + request.getParameter("obs").trim() + "')";
        instrucao.executeUpdate(sql);
    } else if (acao.equals("editar")) {
        String sql = "UPDATE cliente SET "
                + "nome='" + request.getParameter("nome").toUpperCase() + "',"
                + "endereco=" + request.getParameter("endereco") + ","
                + "numero='" + request.getParameter("numero") + "',"
                + "complemento='" + request.getParameter("complemento") + "',"
                + "bairro=" + request.getParameter("bairro") + ","
                + "cidade=" + request.getParameter("cidade") + ","
                + "estado=" + request.getParameter("estado") + ","
                + "rg='" + request.getParameter("rg") + "',"
                + "cpf='" + request.getParameter("cpf") + "',"
                + "telfixo='" + request.getParameter("telfixo") + "',"
                + "telcel='" + request.getParameter("telcel") + "',"
                + "email='" + request.getParameter("email") + "',"
                + "sexo='" + request.getParameter("sexo") + "',"
                + "datanasc='" + request.getParameter("datanasc") + "',"
                + "datacad='" + request.getParameter("datacad") + "',"
                + "obs='" + request.getParameter("obs").trim() + "'"
                + "WHERE codigo=" + request.getParameter("codigoEditar");
        instrucao.executeUpdate(sql);
    }
    ordem = request.getParameter("ordem");
    if (ordem == null) {
        ordem = "codigo";
    }
    resultado = instrucao.executeQuery("SELECT * FROM cliente ORDER BY " + ordem);  //Initialize object to store DB's results
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
            <font style="color: dodgerblue">Lista de Clientes</font>
        </h2>
        <p align="center">
            <%
                resultado.last();
            %>
            <a href="clientesCadastrar.jsp?codigoNovo=<%=resultado.getRow() + 1%> ">[Cadastrar]</a> |
            <% resultado.beforeFirst(); %>
            <a href="clientesImprimir.jsp">[Imprimir]</a>
        </p>
        <div align="center">
            <table border="1">
                <tr>
                    <td><a href="clientes.jsp?ordem=codigo">Código</a></td>
                    <td><a href="clientes.jsp?ordem=nome">Nome<a></td>
                                <td>CPF</td>
                                <td>E-mail</td>
                                <td>Opções</td>
                                </tr>
                                <%
                                    int cont = 0;
                                    while (resultado.next()) {
                                %>
                                <tr>
                                    <td><%= resultado.getInt("codigo")%></td>
                                    <td><%= resultado.getString("nome")%></td>
                                    <td><%= resultado.getString("cpf")%></td>
                                    <td>
                                        <a href="mailto:<%= resultado.getString("email")%>">
                                            <%= resultado.getString("email")%>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="javascript:confirma('<%=resultado.getInt("codigo")%>', 'excluir','Confirmar Exclusão?','clientes.jsp')">
                                            [Excluir]  
                                        </a> |
                                        <a href="javascript:confirma('<%= resultado.getInt("codigo")%>','editar','Confirmar Edição?','clientesEditar.jsp')">
                                            [Editar]
                                        </a>
                                    </td>
                                </tr>
                                <%
                                        cont++;
                                    }
                                %>    
                                <tr>
                                    <td colspan="5">Quantidade de Clientes cadastrados é: <%= cont%> </td>
                                </tr>
                                </table>
                                </div>
                                <p align="center"><a href="index.html">[Menu Principal]</a></p>
                                <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
                                </body>
                                </html>

                                <%@include file="util/conexaoFinalizar.jsp"  %>