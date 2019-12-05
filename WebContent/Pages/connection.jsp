<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Connection</h1>

${a}
<form action="connection.aspx" method="post">
		<table border="1" width="30%">
			<tr>
				<td>Nom Utilisateur</td>
				<td><input type="text" name="nom" /></td>
			</tr>
			<tr>
				<td>Mot de Passe</td>
				<td><input type="password" name="motpasse" /></td>
			</tr>
			<tr>
				
				<td colspan="2">
				<a  type="submit" href="admin.aspx">Connecter</a>
				</td>
			</tr>
		</table>
		${con }


</body>
</html>