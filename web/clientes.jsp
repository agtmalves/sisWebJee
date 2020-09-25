<%-- 
    Document   : clientes
    Created on : 07/09/2020, 22:28:02
    Author     : AGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
    Connection conexao = null;   //Variable for Connection with DB
    Statement instrucao = null;  //Variable for Send and process SQL instructions which are sent to DB
    ResultSet resultado = null;  //Variable for Store results
    String ordem, acao;
%>

<!DOCTYPE html>

<%
    try {
        Class.forName("org.postgresql.Driver");     //Inform which driver load
        conexao = DriverManager.getConnection("***REMOVED***");     //Path to connect with DB
        instrucao = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);      //Initialize object to send SQL's code
        
        acao = request.getParameter("acao");
        if(acao == null){
            acao = "listar";
        }
        if(acao.equals("excluir")) {
            instrucao.executeUpdate("DELETE FROM cliente WHERE codigo=" + request.getParameter("codigo"));
        }
        
        ordem = request.getParameter("ordem");
        if (ordem == null) {
            ordem = "codigo";
        }
        resultado = instrucao.executeQuery("SELECT * FROM cliente ORDER BY " + ordem);  //Initialize object to store DB's results
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <h1 align="center">Sistema de Cadastro de Clientes</h1>
        <p align="center">
            <% 
                resultado.last();
                %>
            <a href="clientesCadastrar.jsp?codigoNovo=<%=resultado.getRow()+1 %> ">[Cadastrar]</a> |
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
                                        <a href="clientes.jsp?acao=excluir&codigo=<%= resultado.getInt("codigo")%>">
                                        [Excluir]  
                                        </a>|
                                        <a href="clientesAlterar.jsp?codigo=<%= resultado.getInt("codigo")%>">
                                        [Alterar]
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
                                <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
                                </body>
                                </html>

                                <%
                                    } catch (ClassNotFoundException ce) {
                                        out.println("Não foi possível encontrar o driver PostgreSQL! " + ce);
                                    } catch (SQLException se) {
                                        out.println("Erro ao trabalhar com o banco de dados!" + se);
                                    } finally {
                                        if (resultado != null) {
                                            resultado.close();
                                        }
                                        if (instrucao != null) {
                                            instrucao.close();
                                        }
                                        if (conexao != null) {
                                            conexao.close();
                                        }
                                    }
                                %>