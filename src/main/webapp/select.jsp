<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test di connessione</title>
</head>
<body>
<h1>Test SELECT</h1>
<p>
	<%
		ResultSet rs = null;
		try {
			// 1. Carico il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2. Effettuo la connessione al database
			Connection connection = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1:3306/bookshop",
				"root",
				""
			);
			// 3. Creo uno Statement
			Statement stmt = connection.createStatement();
			// 4. Eseguo una query
			rs = stmt.executeQuery("SELECT * FROM author");
			
			%>
			<ul>
	<% while(rs.next()) { %>
		<li><%= rs.getInt("id")  %> | <%= rs.getString("name")%> | <%= rs.getString("lastname") %> </li>
	<% } %>
</ul>
<% 
		}
		catch(ClassNotFoundException e){
			out.println("ERRORE CLASS FORNAME");
			out.println(e.getMessage());
		}
		catch(SQLException e){
			out.println("ERRORE DI CONNESSIONE");
			out.println(e.getMessage());
		}
	
	%>
</p>



</body>
</html>