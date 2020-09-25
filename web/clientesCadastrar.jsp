<%-- 
    Document   : clientesCadastrar
    Created on : 23/09/2020, 21:35:03
    Author     : AGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>

        <h1 align="center">Sistema de Cadastro de Clientes</h1><br>
        <h2 align="center">
            <font style="color: dodgerblue">Cadastrar novo cliente</font>
        </h2>

        <form name="formCadastrar" method="post" action="clientes.jsp?acao=gravar">
            <p>
                Código:
                <input type="text" name="codigo" value="AUTOMATICO" disabled="true" /> - 
                Data de Cadastro: (dd-MM-aaaa)
                <input type="text" name="datatela" value="DataHoje" size="16" maxlength="16" />
            </p>
            <p>
                Nome:
                <input type="text" name="nome" size="40" maxlength="40" />
            </p>

            <p>
                Endereço:
                <select>
                    <option></option>
                </select>
            </p>

            <p>
                Número:<input type="text" name="numero" size="4" maxlength="4" /> - 
                Comlpemento:<input type="text" name="complemento" size="10" maxlength="10" />
            </p>

            <p>
                Bairro:
                <select><option></option></select> -
                Cidade:
                <select><option></option></select> -
                Estado:
                <select><option></option></select>
            </p>

            <p>
                RG: <input type="text" name="rg" size="18" maxlength="18" />
                CPF: <input type="text" name="cpf" size="18" maxlengt="18" />
            </p>

            <p>
                TelFixo: (xx-xxxx-xxxx) <input type="text" name="telfixo" size="16" maxlength="16" />
                TelCelular: (xx-Xxxxx-xxxx) <input type="text" name="telcel" size="16" maxlength="16" />
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
                <input type="text" name="datanasc" size="16" maxlength="16" />
            </p>

            <p>
                Obs.:<input type="text" name="obs" size="50" maxlength="50" />
            </p>

            <p>
                <input type="submit" name="btGravar" value="Gravar" />
                <input type="reset" name="btLimpar" value="Limpar" />
            </p>
        </form>

       

         <p align="center"><b>copyright&copy; 2020 - sisWebJee&reg;</b></p>
    </body>
</html>
