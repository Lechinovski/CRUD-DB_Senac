<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Altera��o de Filmes</title>
        <link rel="stylesheet" href="altfilm.css"/>
    </head>
    <body>
        <%
            //Recebe o c�digo do produto a alterar
            int codigo;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            //Fazer a conex�o com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/filme", "root", "060705");
            //Buscar o produto pelo c�digo recebido
            st = conecta.prepareStatement("SELECT * FROM filmes WHERE codigo = ?");
            st.setInt(1, codigo);
            ResultSet resultado = st.executeQuery(); //Executa o SELECT
            //Verifica se o produto de c�digo informado foi encontrado
            if (!resultado.next()) { //se n�o encontrou o produto
                out.print("<p class='error-message'>Este Filme n�o foi encontrado");
            } else { //se encontrou o produto
%>
        <form method="post" action="altfilm.jsp">
            <p>
                <label for="codigo">C�digo do Filme</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo")%>" readonly>
            </p>
            <p>
                <label for="nome">Nome do Filme</label>
                <input type="text" name="nome" id="nome" size="70" value="<%= resultado.getString("nome")%>">
            </p>  
            <p>
                <label for="genero">G�nero do Filme</label>
                <input type="text" name="genero" id="genero" value="<%= resultado.getString("genero")%>">
            </p> 
            <p>
                <label for="class">Classifica��o Indicativa</label>
                <input type="number" name="classificacao" id="class" value="<%= resultado.getString("classificacao")%>">
            </p>
            <p>
                <label for="lan">Ano de lan�amento</label>
                <input type="number" name="lancamento" id="lan" value="<%= resultado.getString("lancamento")%>">
            </p>
            <p>
                <label for="duracao">DDura��o do Filme em Minutos</label>
                <input type="number" name="duracao" id="duracao" value="<%= resultado.getString("duracao")%>">
            </p>              
            <p>
                <input type="submit" value="Salvar Altera��es">   
            </p>
        </form>    
        <%
            }
        %>
    </body>
</html>
