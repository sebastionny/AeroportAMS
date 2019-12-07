<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sw" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script type="text/javascript" src="./js/angular.js"></script>
	<link rel="stylesheet" href="./css/style.css">
    <title>Aeroport AMS | Suivi</title>
</head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


<body ng-app="myApp">

	<div class="container">
		<div class="row">
			<div class="col-sm-9 containerListe">
			
				<div class="head">
					<div class="row">
					    <div class="col-sm-3">
					            <h1>Suivi ton vol</h1>
					    </div>
					    <div class="col-sm-6">
					        <p>DERNIÉR MISE À JOUR <span>IL Y A 10 MIN</span></p>
					    </div>
					    <div class="col-sm-3">
					            <a href="filtreD.aspx" class="col-sm-6">
					                <img src="./img/departBtn.png"  class="img-fluid" alt="Départ"/>
					            </a>
					            <a href="filtreA.aspx" class="">
					                <img src="./img/arriveBtn.png"  class="img-fluid" alt="Arrivée"/>
					            </a>
					    </div>
					</div>
				</div>
			
				<div class="row">
				<div class="col-sm-12"><h2>Recherche par:</h2> </div>
				
					
					<div class="col-sm-4">
						<form action="searchVol.aspx" method="post">
					<div class="form-group mb-2">
					    <select name="val" class="form-control">
						  <option value="num">Numéro</option>
						  <option value="date">Date</option>
						  <option value="ville">Ville</option>
						  <option value="comp">Compagnie</option>
						</select>
					  </div>
					</div>
					<div class="col-sm-4">
					
					<div class="form-group mx-sm-3 mb-2">
					    <input type="text" class="form-control" id="recherche" placeholder="recherche" name="id">
					  </div>
					  
					</div>
					<div class="col-sm-4">
						<button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
						</form>
					</div>
					  
					
					
		
					</div>
					<hr/>
					
					<table border="1" width="100%">
						<tr class="headTable">
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
							<tr>
								<td> <a href="#" class="btn btn-filtre-${o.volDepart } "></a>    </td>
								<td>${o.numVol }</td>
								<td>${o.idCompagnie }</td>
								<td>${o.codeAerDepart }</td>
								<td>${o.aeroportDestination }</td>
							
								<td>${o.heurePanifie }</td>
								<td>${o.heureEstime }</td>
								<td>${o.statutChange }</td>
								
								<td class="btn-suivre"><a  href="#"><img class="img-fluid" src="./img/btn.png" alt="Suivre un vol"></a></td>
							
							</tr>
						</sw:forEach> 
					</table>


			</div>	
			<div class="col-sm-3">

					<a href="#" class="logo" >
						<img src="./img/logo.gif " class="img-fluid mt-3" alt="Aeroport AMS "/>
					</a>
		
					<div class="date mt-5">
						<h2>21:20</h2>
						<h4>21 / NOV / 2019</h4>
					</div>
					
					<div class=" mt-3">
						
						<a href="filtreAuj.aspx" class="btn btn-solid">AUJOURD’HUI</a>
						<a href="filtreDemain.aspx" class="btn btn-line col-6">DEMAIN</a>
					</div>
			</div>	
		</div>
	</div>






	
	<a href="connection.aspx"> Connection</a>
	
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>