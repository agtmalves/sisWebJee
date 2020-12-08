<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat, java.sql.*" %>
<%@include file="util/conexaoObjetos.jsp" %>
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
        <title>Cadastro de Clientes</title>
    </head>
    <body>

        <h1 align="center">Sistema de Cadastro de Clientes</h1>
        <h2 align="center">
            <font style="color: dodgerblue">Cadastrar Novo Cliente</font>
        </h2>

        <form name="formCadastrar" method="post" action="clientes.jsp?acao=gravar">
            <p>
                Código:
                <input type="text" name="codigo" value="<%= codigoNovo%>" disabled="true" /> - 
                Data de Cadastro: (dd-MM-aaaa)
                <input type="text" name="datatela" value="<%= hoje%>" disabled="true" size="10" maxlength="10" />
                <input type="hidden" name="datacad" value="<%= hoje%>" />
            </p>
            <p>
                Nome:
                <input type="text" name="nome" size="40" maxlength="40" />
            </p>

            <p>
                Endereço:
                <select name="endereco">
                    <%
                        ResultSet resultadoEndereco = instrucao.executeQuery("SELECT * FROM endereco ORDER BY nome");
                        if (resultadoEndereco != null) {
                            while (resultadoEndereco.next()) {
                    %>
                    <option value="<%= resultadoEndereco.getInt("codigo")%>">
                        <%= resultadoEndereco.getString("nome")%>
                    </option>
                    <%
                            }
                        }
                        if (resultadoEndereco != null) {
                            resultadoEndereco.close();
                        }
                    %>
                </select>
            </p>

            <p>
                Número:<input type="text" name="numero" size="4" maxlength="4" /> - 
                Comlpemento:<input type="text" name="complemento" size="10" maxlength="10" />
            </p>

            <p>
                Bairro:
                <select name="bairro">
                    <%
                        ResultSet resultadoBairro = instrucao.executeQuery("SELECT * FROM bairro ORDER BY nome");
                        if (resultadoBairro != null) {
                            while (resultadoBairro.next()) {
                    %>
                    <option value="<%= resultadoBairro.getInt("codigo")%>">
                        <%= resultadoBairro.getString("nome")%>
                    </option>
                    <%
                            }
                        }
                        if (resultadoBairro != null) {
                            resultadoBairro.close();
                        }
                    %>
                </select> -
                Cidade:
                <select name="cidade">
                    <%
                        ResultSet resultadoCidade = instrucao.executeQuery("SELECT * FROM cidade ORDER BY nome");
                        if (resultadoCidade != null) {
                            while (resultadoCidade.next()) {
                    %>
                    <option value="<%= resultadoCidade.getInt("codigo")%>">
                        <%= resultadoCidade.getString("nome")%>
                    </option>
                    <%
                            }
                        }
                        if (resultadoCidade != null) {
                            resultadoCidade.close();
                        }
                    %>

                </select> -
                Estado:
                <select name="estado">
                    <%
                        ResultSet resultadoEstado = instrucao.executeQuery("SELECT * FROM estado ORDER BY nome");
                        if (resultadoEstado != null) {
                            while (resultadoEstado.next()) {
                    %>
                    <option value="<%= resultadoEstado.getInt("codigo")%>">
                        <%= resultadoEstado.getString("nome")%>
                    </option>
                    <%
                            }
                        }
                        if (resultadoEstado != null) {
                            resultadoEstado.close();
                        }
                    %>
                </select>
            </p>

            <p>
                RG: <input type="text" name="rg" size="18" maxlength="18" />
                CPF: <input type="text" name="cpf" size="14" maxlength="14"
                            onkeypress="mascaraCampo(this, '###.###.###-##');
                                    return somenteNumero(event);"
                            />
            </p>

            <p>
                TelFixo: (xx-xxxx-xxxx) <input type="text" name="telfixo" size="12" maxlength="12"
                                               onkeypress="mascaraCampo(this, '##-####-####');
                                                       return somenteNumero(event);"/>
                TelCelular: (xx-Xxxxx-xxxx) <input type="text" name="telcel" size="13" maxlength="13"
                                                   onkeypress="mascaraCampo(this, '##-#####-####');
                                                           return somenteNumero(event);"/>
            </p>

            <p>
                E-mail:<input type="text" name="email" size="50" maxlength="50" />
            </p>

            <p>
                Sexo:
                <input type="radio" name="sexo" id="sexo_M" value="M" checked="checked" />
                Masculino
                <input type="radio" name="sexo" id="sexo_F" value="F" />
                Feminino -
                Data de Nascimento: (dd-MM-aaaa)
                <input type="text" name="datanasc" size="10" maxlength="10" 
                       onkeypress="mascaraCampo(this, '##-##-####');
                               return somenteNumero(event);"/>
            </p>

            <p>
                Obs.:<input type="text" name="obs" size="50" maxlength="50" />
            </p>

            <p>
                <input type="submit" name="btGravar" value="Gravar" />
                <input type="reset" name="btLimpar" value="Limpar" />
            </p>
        </form>
        <p align="center"><a href="clientes.jsp">[Voltar]</a></p>
        <p align="center"><a href="index.html">[Menu Princial]</a></p>

        <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
    </body>

</html>

<%@include file="util/conexaoFinalizar.jsp"  %>