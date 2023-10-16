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
                    <label for="nome">Pesquise o filme: </label>
                    <input type="text" name="nome" id="nome" placeholder="nome do filme">
                    <input type="text" name="genero" id="genero" placeholder="genero do filme">
                    <input type="text" name="classificacao" id="classificacao" placeholder="classificacao do filme">
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
                    int duracaoMinutos = Integer.parseInt(rs.getString("duracao"));
                    int horas = duracaoMinutos / 60;
                    int minutos = duracaoMinutos % 60;
            %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("genero")%></td>
                <td><%= rs.getString("classificacao")%> anos</td>
                <td><%= rs.getString("lancamento")%></td>
                <td><%= horas%> horas <%= minutos%> minutos</td>
                <td>
                    <a href="excfilm.jsp?codigo=<%= rs.getString("codigo")%>" class="btn-excluir">
                        <img src="img/bin.png" alt="Excluir" width="22">
                    </a> 
                    <a href="carregafilm.jsp?codigo=<%= rs.getString("codigo")%>" class="btn-editar">
                        <img src="img/editar.png" alt="Editar" width="22">
                    </a>
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
