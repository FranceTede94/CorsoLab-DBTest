<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test INSERT</title>
</head>
<body>
<h1>Test di inserimento di un record MySQL</h1>
<p>
	<%
		int aggiornati = 0;
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
			// 4. Per tutte le query di scrittura si utilizza executeUpdate
			aggiornati = stmt.executeUpdate(
				"DELETE FROM author WHERE id = 10"
			);
		}
		catch(ClassNotFoundException e){
			out.println("ERRORE CLASS FORNAME");
			out.println(e.getMessage());
		}
		catch(SQLException e){
			out.println("ERRORE: Query non valida oppure violazione di un vincolo!");
			out.println(e.getMessage());
		}
	
	%>
</p>

<p><%= aggiornati %> record aggiornati

</body>
</html>