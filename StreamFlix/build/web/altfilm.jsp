<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Filme</title>
        <link rel="stylesheet" href="altfilm.css"/>
    </head>
    <body>
        <%
            //Receber os dados ALTERADOS no formulário carregafilm.jsp
            int l, cla, d, cod;
            String n, g;
            cod = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            g = request.getParameter("genero");
            cla = Integer.parseInt(request.getParameter("classificacao"));
            l = Integer.parseInt(request.getParameter("lancamento"));
            d = Integer.parseInt(request.getParameter("duracao"));
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/filme", "root", "060705");
                //Alterar o sdados na tabela produtos do BD
                st = conecta.prepareStatement("UPDATE filmes SET nome = ?, genero = ?, classificacao = ?, lancamento = ?, duracao = ? WHERE codigo = ?");
                st.setString(1, n);
                st.setString(2, g);
                st.setInt(3, cla);
                st.setInt(4, l);
                st.setInt(5, d);
                st.setInt(6, cod);
                st.executeUpdate(); //Executa o UPDATE
                out.print("<p class='success-message'>Os dados do Filme " + n + " foram alterados com sucesso");
            } catch (Exception erro) {
                out.print("<p class='error-message'>Entre em contato com o suporte e informe o erro " + erro.getMessage());
            }
        %> 
    </body>
</html>
