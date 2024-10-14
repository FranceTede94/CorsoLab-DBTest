<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test di inserimento dati</title>
</head>
<body>
	<h1>Inserisci un autore</h1>
	<form action="insert-dinamica.jsp" method="post">
		<label>Nome</label>
		<input type="text" name="nome">
		<label>Cognome</label>
		<input type="text" name="cognome">
		<button type="submit">Inserisci</button>
	</form>
</body>
</html>