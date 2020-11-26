<%-- 
    Document   : conexaoIniciar
    Created on : 26/11/2020, 18:54:30
    Author     : AGT
--%>


<%
    try {
        Class.forName("org.postgresql.Driver");     //Inform which driver load
        conexao = DriverManager.getConnection("***REMOVED***");     //Path to connect with DB
        instrucao = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);      //Initialize object to send SQL's code
%>

                  