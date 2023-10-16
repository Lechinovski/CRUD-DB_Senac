<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Filme</title>
        <link rel="stylesheet" href="cadfilm.css"/>
    </head>
    <body>
        <%
            //Receber os dados digitados no formulário cadfilm.html
            int c, l, i, d;
            String n, g;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            g = request.getParameter("genero");
            i = Integer.parseInt(request.getParameter("classificacao"));
            l = Integer.parseInt(request.getParameter("lancamento"));
            d = Integer.parseInt(request.getParameter("duracao"));
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/filme", "root", "060705");
                //Inserir os dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("INSERT INTO filmes VALUES(?,?,?,?,?,?)");
                st.setInt(1, c);
                st.setString(2, n);
                st.setString(3, g);
                st.setInt(4, i);
                st.setInt(5, l);
                st.setInt(6, d);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("<p class='success-message'>Filme cadastrado com sucesso</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p class='error-message'>Este Filme já está cadastrado</p>");
                } else {
                    out.print("<p class='error-message'>Mensagem de erro:" + erro + "</p>");
                }
            }
        %>
    </body>
</html> 
