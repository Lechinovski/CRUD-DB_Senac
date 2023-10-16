<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Filmes</title>
        <link rel="stylesheet" href="excfilm.css"/>
    </head>
    <body>
        <%
            // Recebe o código digitado no formulário
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            try {
                //Conecta ao banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/filme", "root", "060705");
                // Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("delete from filmes where codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); // Executa o comando DELETE
                //Verifica se o produto foi ou  não excluído
                if (resultado == 0) {
                    out.print("<p class='error-message'>Este Filme não está cadastrado");
                } else {
                    out.print("<p class='error-message'>O Filme de código " + cod + " foi excluído com sucesso");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("<p class='error-message'>Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
        %>
    </body>
</html> 
