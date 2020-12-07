<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat" %>
<%@include file="util/conexaoObjetos.jsp" %>
<%!    Date data;
    SimpleDateFormat dataFormatada = new SimpleDateFormat("dd-MM-yyyy");

    String ordem, acao, campos;
%>

<!DOCTYPE html>
<%@include file="util/conexaoIniciar.jsp" %>

<%    acao = request.getParameter("acao");
    ordem = request.getParameter("ordem");
    if (acao == null) {
        acao = "escolha";
    }
    if (ordem == null) {
        ordem = "codigo";
    }
%>
<html>
    <head>
        <script language="javascript" src="util/funcoes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <h1 align="center">Sistema de Cadastro de Clientes</h1>
        <%
            if (acao.equals("escolha")) {

        %>
        <div align="center">
            <h2><font style="color:dodgerblue">Selecione as opções de impressão</font></h2>
            <form name="formImprimir" method="post" action="clientesImprimir.jsp?acao=imprimir">
                <p>
                <table border="1">
                    <tr>
                        <td><center><b>Dados Pessoais</b></center></td>
                    <td><center><b>Correspondência</b></center></td>
                    <td><center><b>Documentação</b></center></td>
                    <td><center><b>Informações adicionais</b></center></td>
                    </tr>
                    <tr align="top">
                        <td>
                            <input type="checkbox" name="nome" checked="checked" />Nome<br>
                            <input type="checkbox" name="sexo" />Sexo<br>
                            <input type="checkbox" name="datanasc" />Data de nascimento<br>
                        </td>
                        <td> 
                            <input type="checkbox" name="endereco" />Endereço<br>
                            <input type="checkbox" name="numero" />Número<br>
                            <input type="checkbox" name="complemento" />Complemento<br>
                            <input type="checkbox" name="bairro" />Bairro<br>
                            <input type="checkbox" name="cidade" />Cidade<br>
                            <input type="checkbox" name="estado" />Estado<br>
                            <input type="checkbox" name="telfixo" />Tel fixo<br>
                            <input type="checkbox" name="telcel" />Tel celular<br>
                            <input type="checkbox" name="email" />E-mail<br>
                        </td>
                        <td>
                            <input type="checkbox" name="rg" />RG<br>
                            <input type="checkbox" name="cpf" checked="checked" />CPF<br>
                        </td>
                        <td>
                            <input type="checkbox" name="codigo" checked="checked" />Código<br>
                            <input type="checkbox" name="datacad" />Data de cadastro<br>
                            <input type="checkbox" name="obs" />Observações<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Ordem de classificação:
                            <input type="radio" name="ordem" value="codigo" checked="checked"/>
                            Código
                            <input type="radio" name="ordem" value="nome" />
                            Nome
                        </td>
                    </tr>
                </table>
                </p>
                <input type="submit" value="Exibir Relatório"/>
            </form>
        </div>
        <%        } else if (acao.equals("imprimir")) {
            List<String> listaCampos = new ArrayList<String>();
            if (request.getParameter("codigo") != null) {
                listaCampos.add("codigo");
            }
            if (request.getParameter("nome") != null) {
                listaCampos.add("nome");
            }
            if (request.getParameter("sexo") != null) {
                listaCampos.add("sexo");
            }
            if (request.getParameter("datanasc") != null) {
                listaCampos.add("datanasc");
            }
            if (request.getParameter("endereco") != null) {
                listaCampos.add("endereco");
            }
            if (request.getParameter("numero") != null) {
                listaCampos.add("numero");
            }
            if (request.getParameter("complento") != null) {
                listaCampos.add("complento");
            }
            if (request.getParameter("bairro") != null) {
                listaCampos.add("bairro");
            }
            if (request.getParameter("cidade") != null) {
                listaCampos.add("cidade");
            }
            if (request.getParameter("estado") != null) {
                listaCampos.add("estado");
            }
            if (request.getParameter("telfixo") != null) {
                listaCampos.add("telfixo");
            }
            if (request.getParameter("telcel") != null) {
                listaCampos.add("telcel");
            }
            if (request.getParameter("email") != null) {
                listaCampos.add("email");
            }
            if (request.getParameter("rg") != null) {
                listaCampos.add("rg");
            }
            if (request.getParameter("cpf") != null) {
                listaCampos.add("cpf");
            }
            if (request.getParameter("datacad") != null) {
                listaCampos.add("datacad");
            }
            if (request.getParameter("obs") != null) {
                listaCampos.add("obs");
            }
            for (int i = 0; i < listaCampos.size(); i++) {
                if (i == 0) {
                    campos = listaCampos.get(0);
                } else {
                    campos = campos + "," + listaCampos.get(i);
                }
            }
            resultado = instrucao.executeQuery("SELECT " + campos + " FROM cliente ORDER BY " + ordem);
        %>
        <div align="center">
            <h2><font style="color:dodgerblue">Relatório de Cadastro de Clientes</font></h2>

            <table border="2">
                <tr>
                    <% for (int i = 0; i < listaCampos.size(); i++) {
                    %>
                    <td> <%= listaCampos.get(i).substring(0, 1).toUpperCase() + listaCampos.get(i).substring(1)%></td>
                    <%
                        }
                    %>
                </tr>
                <% int cont = 0;
                    while (resultado.next()) {
                %>
                <tr>
                    <%
                        for (int i = 0; i < listaCampos.size(); i++) {
                            String extra = listaCampos.get(i);
                            if (extra.equals("endereco") || extra.equals("bairro") || extra.equals("cidade") || extra.equals("estado")) {
                                Statement instrucaoExtra = conexao.createStatement();
                                ResultSet resultadoExtra = instrucaoExtra.executeQuery("select nome from " + extra + " where codigo=" + resultado.getObject(listaCampos.get(i)));
                                resultadoExtra.next();
                                out.print("<td>" + resultadoExtra.getObject(1) + "</td>");
                                instrucaoExtra.close();
                                resultadoExtra.close();
                            } else if (extra.equals("datanasc") || extra.equals("datacad")) {
                                data = resultado.getDate(listaCampos.get(i));
                                out.print("<td>" + dataFormatada.format(data) + "</td>");
                            } else {
                    %>
                    <td><%= resultado.getObject(listaCampos.get(i))%></td>
                    <%
                            }
                        }
                    %>
                </tr>
                <%
                        cont++;
                    }
                %>
                <tr>
                    <td colspan="<%= listaCampos.size()%>">
                        Quantidade de Clientes cadastrados é:  <%= cont%>
                    </td>
                </tr>
            </table>
        </div>
        <form name="formImpressao" method="post">
            <div align="center">
                <br>
                <input type="button" name="imprimir" value="Imprimir" onclick="window.print()" />

            </div>
        </form>
        <%            }
        %>
        <p align="center"><a href="clientes.jsp">[Voltar]</a></p>
        <p align="center"><a href="index.html">[Menu Princial]</a></p>
        <p align="center">copyright&copy; 2020 - sisWebJee&reg;</b></p>
</body>
</html>

<%@include file="util/conexaoFinalizar.jsp"  %>
