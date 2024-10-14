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
		int inseriti = 0;
	    //recuperare i dati dalla request
	    String nomeAutore    = request.getParameter("nome");
	    String cognomeAutore = request.getParameter("cognome");
	    //collegarmi al db
	    //fare una insert con i dati recuperati
	
		
	
		try {
			// 1. Carico il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2. Effettuo la connessione al database
			Connection connection = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1:3306/bookshop",
				"root",
				""
			);
			// 3. Per tutte le query in cui i valori all'interno della query vengono concatenati
			// si utilizza un PREPARED STATEMENT che risolve 2 problemi
			// a - SQL injection
			// b - può essere più performante
			PreparedStatement stmt = connection.prepareStatement(
				"INSERT INTO author(name, lastname) VALUES (?, ?)"
			);
			
			
			// 4. Imposto i parametri del Prepared statement
			stmt.setString(1, nomeAutore);
			stmt.setString(2, cognomeAutore);
			
			// 5. Eseguo la query
			inseriti = stmt.executeUpdate();
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

<p><%= inseriti %> record inseriti/o nella tabella Attivita commerciali

</body>
</html>