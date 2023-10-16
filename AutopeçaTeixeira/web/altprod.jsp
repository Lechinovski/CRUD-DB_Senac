<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALteração de produtos</title>
    </head>
    <body>
        <%
            //Receber os dados ALTERADOS no formulário carregaprod.jsp
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "060705");
                //Alterar o sdados na tabela produtos do BD
                st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, preco = ? WHERE codigo = ?");
                st.setString(1, n);
                st.setString(2, m);
                st.setDouble(3, p);
                st.setInt(4, c);
                st.executeUpdate(); //Executa o UPDATE
                out.print("<p class='success-message'>Os dados do produto " + c + " foram alterados com sucesso</p>");
            } catch (Exception erro) {
                out.print("<p class='error-message'>Entre em contato com o suporte e informe o erro </p>" + erro.getMessage());
            }
        %> 
    </body>
</html>
