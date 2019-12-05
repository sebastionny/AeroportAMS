<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sw" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aeroport AMS</title>
</head>
<body>
	<h1>Aeroport AMS</h1>
	<p>Bienvenue a l'Aeroport AMS</p>
	<p>la liste des vols de l'Aeroport AMS</p>
	<table border="1" width="50%">
		<tr>
			<th>Numero de Vol</th>
			<th>Aeroport de Depart</th>
			<th>Aeroport de Destination</h>
			<th>Date du Vol</h>
			<th>Heure de Depart</th>
			<th>Nom de la Compagnie</th>
			<th>Ville</th>
			<th>Depart ou arrivé</h>
			
			
		</tr>
		
		<!--  listeProduit  -->
		<sw:forEach items="${listeVols}" var="o" >
			<tr>
				<td>${o.numVol }</td>
				<td>${o.codeAerDepart }</td>
				<td>${o.aeroportDestination }</td>
				<td>${o.dateVol }</td>
				<td>${o.heurePanifie }</td>
			
				<td>${o.idCompagnie }</td>
				<td>${o.idVille }</td>
				<td>${o.volDepart }</td>
			
			</tr>
		</sw:forEach>
	</table>
	<a href="connection.aspx"> Connection</a>
</body>
</html>