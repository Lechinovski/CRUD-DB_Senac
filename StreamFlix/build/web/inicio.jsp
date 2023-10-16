<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Home</title>
        <link rel="stylesheet" href="inicio.css"/>
    </head>
    <body>

        <header>
            <h1>Bem-vindo ao StreamFlix</h1>
            <p>Sua fonte definitiva para todo seus filmes favoritos.</p>
        </header>

        <main>
            <section>
                <h2>Últimos Filmes Adicionados</h2>
                <!-- Adicione informações sobre as séries aqui -->
            </section>
        </main>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/filme", "root", "060705");
                //Inserir os dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("Select * from filmes order by codigo DESC LIMIT 5");
                ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>Código</th><th>Nome do Filme</th><th>Gênero do Filme</th><th>Classificação Indicativa</th><th>Ano de lançamento</th><th>Duração do Filme</th>
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
