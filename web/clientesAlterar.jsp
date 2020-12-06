<%-- 
    Document   : clientesCadastrar
    Created on : 23/09/2020, 21:35:03
    Author     : AGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat, java.sql.*" %>

<%
    Connection conexao = null;   //Variable for Connection with DB
    Statement instrucao = null;  //Variable for Send and process SQL instructions which are sent to DB
    ResultSet resultado = null;  //Variable for Store results

    Date datanasc, datacad;
    SimpleDateFormat dataFormatada = new SimpleDateFormat("dd-MM-yyyy");

    int endereco, bairro, cidade, estado;
    String codigo, nome, numero, complemento, rg, cpf, telfixo, telcel, email, sexo, obs;
%>

<!DOCTYPE html>

<%
    try {
        Class.forName("org.postgresql.Driver");     //Inform which driver load
        conexao = DriverManager.getConnection("***REMOVED***");     //Path to connect with DB
        instrucao = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);      //Initialize object to send SQL's code

        codigo = request.getParameter("codigo");

        if (codigo == null) {
            codigo = "0";
        }
        resultado = instrucao.executeQuery("SELECT * FROM cliente WHERE codigo=" + codigo);
        if (resultado.next()) {
            nome = resultado.getString("nome");
            endereco = resultado.getInt("endereco");
            numero = resultado.getString("numero");
            complemento = resultado.getString("complemento");
            bairro = resultado.getInt("bairro");
            cidade = resultado.getInt("cidade");
            estado = resultado.getInt("estado");
            rg = resultado.getString("rg");
            cpf = resultado.getString("cpf");
            telfixo = resultado.getString("telfixo");
            telcel = resultado.getString("telcel");
            email = resultado.getString("email");
            sexo = resultado.getString("sexo");
            datanasc = resultado.getDate("datanasc");
            datacad = resultado.getDate("datacad");
            obs = resultado.getString("obs");

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
            <font style="color: dodgerblue">Alterar Cadastro de Cliente</font>
        </h2>

        <form name="formCadastrar" method="post" action="clientes.jsp?acao=alterar">
            <p>
                Código:
                <input type="text" name="codigo" value="<%= codigo%>" disabled="true" />-
                <input type="hidden" name="codigoAlterar" value="<%= codigo%>" />  
                Data de Cadastro: (dd-MM-aaaa)
                <input type="text" name="datatela" value="<%= dataFormatada.format(datacad)%>" disabled="true" size="10" maxlength="10" />
                <input type="hidden" name="datacad" value="<%= dataFormatada.format(datacad)%>" />
            </p>
            <p>
                Nome:
                <input type="text" name="nome" size="40" maxlength="40" value="<%=nome%>"/>
            </p>

            <p>
                Endereço:
                <select name="endereco">
                    <%
                        ResultSet resultadoEndereco = instrucao.executeQuery("SELECT * FROM endereco ORDER BY nome");
                        if (resultadoEndereco != null) {
                            while (resultadoEndereco.next()) {
                                int cod = resultadoEndereco.getInt("codigo");

                    %>
                    <option value="<%= cod%>" <%if (endereco == cod)
                            out.print("selected='selected'");%>>
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
                Número:<input type="text" name="numero" size="4" maxlength="4" value="<%=numero%>" /> - 
                Comlpemento:<input type="text" name="complemento" size="10" maxlength="10" value="<%=complemento%>" />
            </p>

            <p>
                Bairro:
                <select name="bairro">
                    <%
                        ResultSet resultadoBairro = instrucao.executeQuery("SELECT * FROM bairro ORDER BY nome");
                        if (resultadoBairro != null) {
                            while (resultadoBairro.next()) {
                                int cod = resultadoBairro.getInt("codigo");

                    %>
                    <option value="<%= cod%>" <%if (bairro == cod)
                            out.print("selected='selected'");%>>
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
                                int cod = resultadoCidade.getInt("codigo");

                    %>
                    <option value="<%= cod%>" <%if (cidade == cod)
                            out.print("selected='selected'");%>>
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
                                int cod = resultadoEstado.getInt("codigo");

                    %>
                    <option value="<%= cod%>" <%if (estado == cod)
                            out.print("selected= 'selected'");%>>
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
                RG: <input type="text" name="rg" size="18" maxlength="18" value="<%= rg%>"/>
                CPF: <input type="text" name="cpf" size="14" maxlength="14" value="<%=cpf%>"
                            onkeypress="mascaraCampo(this, '###.###.###-##');
                                    return somenteNumero(event);"
                            />
            </p>

            <p>
                TelFixo: (xx-xxxx-xxxx) <input type="text" name="telfixo" size="12" maxlength="12" value="<%=telfixo%>"
                                               onkeypress="mascaraCampo(this, '##-####-####');
                                                       return somenteNumero(event);"/>
                TelCelular: (xx-Xxxxx-xxxx) <input type="text" name="telcel" size="13" maxlength="13" value="<%=telcel%>"
                                                   onkeypress="mascaraCampo(this, '##-#####-####');
                                                           return somenteNumero(event);"/>
            </p>

            <p>
                E-mail:<input type="text" name="email" size="50" maxlength="50" value="<%=email%>" />
            </p>

            <p>
                Sexo:
                <input type="radio" name="sexo" id="sexo_M" value="M" <%if (sexo.equals("M"))
                        out.print("checked= 'checked'");%> />
                Masculino
                <input type="radio" name="sexo" id="sexo_F" value="F" <%if (sexo.equals("F"))
                        out.print("checked= 'checked'");%> />
                Feminino -
                Data de Nascimento: (dd-MM-aaaa)
                <input type="text" name="datanasc" size="10" maxlength="10" 
                       value="<%=dataFormatada.format(datanasc)%>"
                       onkeypress="mascaraCampo(this, '##-##-####');
                               return somenteNumero(event);"/>
            </p>

            <p>
                Obs.:<input type="text" name="obs" size="50" maxlength="50" value="<%=obs%>" />
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
</html>
