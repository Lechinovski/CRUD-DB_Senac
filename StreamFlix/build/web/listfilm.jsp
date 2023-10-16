<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Listagem de Filme</title>
        <link rel="stylesheet" href="listfilm.css"/>
    </head>
    <body>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/filme", "root", "060705");
                //Inserir os dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("Select * from filmes order by codigo");
                ResultSet rs = st.executeQuery();
        %>

        <main>
            <div class="container">
                <form method="get" action="confilm.jsp"> 
                    <label for="nome">Nome do filme: </label>
                    <input type="text" name="nome" id="nome" required>
                    <input type="submit" value="Consultar">
                </form>
            </div>
        </main>
        <table border="1">
            <tr>
                <th>Código</th><th>Nome do Filme</th><th>Gênero do Filme</th><th>Classificação Indicativa</th><th>Ano de lançamento</th><th>Duração do Filme</th><th>Exclusão/Edição</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("genero")%></td>
                <td><%= rs.getString("classificacao")%> anos</td>
                <td><%= rs.getString("lancamento")%></td>
                <td><%= rs.getString("duracao")%> minutos</td>
                <td>
                    <a href="excfilm.jsp?codigo=<%= rs.getString("codigo")%>" class="btn-excluir">Excluir</a> 
                    <a href="carregafilm.jsp?codigo=<%= rs.getString("codigo")%>" class="btn-editar">Editar</a>
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
