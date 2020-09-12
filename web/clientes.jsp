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
%>

<!DOCTYPE html>

<%
    try {
        Class.forName("org.postgresql.Driver");     //Inform which driver load
        conexao = DriverManager.getConnection("***REMOVED***");     //Path to connect with DB
        instrucao = conexao.createStatement();      //Initialize object to send SQL's code

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
            <a href="clientesCadastrar.jsp">[Cadastrar]</a> |
            <a href="clientesImprimir.jsp">[Imprimir]</a>
        </p>
        <div align="center">
            <table border="1">
                <tr>
                    <td>Código</td><td>Nome</td><td>CPF</td><td>E-mail</td>
                </tr>
                <%                    
                    int cont = 0;
                    while (resultado.next()) {
                %>
                <tr>
                    <td><%= resultado.getInt("codigo")%></td>
                    <td><%= resultado.getString("nome")%></td>
                    <td><%= resultado.getString("cpf")%></td>
                    <td><%= resultado.getString("email")%></td>
                </tr>
                <%
                        cont++;
                    }
                %>    
                <tr>
                    <td colspan="4">Quantidade de Clientes cadastrados é: <%= cont%> </td>
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