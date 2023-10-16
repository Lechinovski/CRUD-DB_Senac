<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="listprod.css"/>
    </head>
    <body>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "060705");
                //Inserir os dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("Select * from produto order by preco");
                ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>Código</th><th>Nome</th><th>Marca</th><th>Preço</th><th>Exclusão</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("marca")%></td>
                <td><%= rs.getString("preco")%></td>
                <td>
                    <a href="excprod.jsp?codigo=<%= rs.getString("codigo")%>">Excluir</a> 
                    <a href="carregaprod.jsp?codigo=<%= rs.getString("codigo")%>">Editar</a>
                </td>
            </tr>

            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.print("mensagem de erro:" + x.getMessage());
            }
        %>
    </body>
</html> 
