<%-- 
    Document   : conexaoFInalizar
    Created on : 26/11/2020, 18:54:05
    Author     : AGT
--%>

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
