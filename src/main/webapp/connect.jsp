<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test di connessione</title>
</head>
<body>
<h1>Test di connessione MySQL</h1>
<p>
	<%
	
		try {
			// 1. Carico il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2. Effettuo la connessione al database
			Connection connection = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1:3306/bookshop",
				"root",
				""
			);
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