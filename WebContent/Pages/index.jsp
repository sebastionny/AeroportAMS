<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sw" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aeroport AMS</title>
<script type="text/javascript" src="js/angular.js"></script>
</head>
<body ng-app="myApp">
<h1>Hello 1er essai</h1>
<h1>Hello 2 eme essai Mery</h1>
	<h1>Aeroport AMS</h1>
	<p>Bienvenue a l'Aeroport AMS</p>
	<p>la liste des vols de l'Aeroport AMS</p>
	<a href="filtreD.aspx"> Depart</a>
	<a href="filtreA.aspx"> Arrivé</a>
		<a href="filtreAuj.aspx"> Vol Aujourd'hui</a>
	<a href="filtreDemain.aspx"> Vol de Demain</a>
	Recherche par:
	
	<form action="searchVol.aspx" method="post">
	<select name="val">
  <option value="num">Numéro</option>
  <option value="date">Date</option>
  <option value="ville">Ville</option>
  <option value="comp">Compagnie</option>
	</select>
	Num Vol: <input type="text" name="id"/>
	<input type="submit" value="Afficher"/>
	</form>
	<hr/>
		<table border="1" width="100%">
		<tr>
		<th>Type</th>
			<th># Vol</th>
			<th>Compagnie</th>
			<th>Depart</th>
			<th>Destination</h>
			
			<th>Heure Planifié</th>
			<th>Heure Estimée</th>
			
			<th>Statut</th>
			<th>Suivre</h>
		</tr>
		
		<!--  listeVols  -->
		<sw:forEach items="${listeVols}" var="o" >
			<tr>{{gggg| filter}}
				<td>${o.volDepart }</td>
				<td>${o.numVol }</td>
				<td>${o.idCompagnie }</td>
				<td>${o.codeAerDepart }</td>
				<td>${o.aeroportDestination }</td>
			
				<td>${o.heurePanifie }</td>
				<td>${o.heureEstime }</td>
				<td>${o.statutChange }</td>
				
				<td><a  href="#"> Suivre</a></td>
			
			</tr>
		</sw:forEach>
	</table>
	<a href="connection.aspx"> Connection</a>
	
</body>
</html>