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
	<link rel="stylesheet" href="./CSS/style.css">
    <title>Aeroport AMS | Suivi</title>
</head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


<body ng-app="myApp">

	<div class="container">
		<div class="row">
			<div class="col-sm-9 containerListe">
			
				<div class="head">
					<div class="row">
					    <div class="col-sm-6">
					            <h1>Suivi Vol</h1>
					    </div>
					    <div class="col-sm-6"></div>
					    
					</div>
				</div>
			
				<div class="row">
					<div class="col-sm-12"><h2 >Suivre ce vol par SMS</h2> </div>

					<div class="col-sm-12">
						<div class="col-sm-6 float-left colorFontWhite">
							<h3>${vol[0].numVol} </h3>
							<p>${vol[0].idCompagnie}</p>
						</div>
						<div class="col-sm-6 float-right text-right">
							<div class="btn btn-solid">${vol[0].statutChange}</div>
						</div>
					</div>

					<div class=" col-sm-12 details ">
						<div class="col-sm-6 float-left">
							<h4>${vol[0].aeroportDestination}</h4>
							<p>Heure Planifié ${vol[0].heurePanifie}</p>
						</div>
						<div class="col-sm-6 float-right text-right">
							<h4>${vol[0].idVille}</h4>
							<p>Heure Estimé ${vol[0].heureEstime} </p>
						</div>

						<div class="col-sm-12">
							<hr class="line">
						</div>
					</div>
					
					<c:choose>
					   <c:when test="${mgs}">

						<div class="text-center notification">
								<h2 >${mgs}</h2>
						</div>
					
					</c:when> 
					   <c:otherwise>
					   
					   <div class="container row">
							<div class="col-sm-6">
									<form action="savesuivi.aspx" method="post" class="row">
										<div class="form-group col-sm-6">
											<label for="inputState" class="colorFontWhite"># VOL</label>
											<input type="text" class="form-control" id="inputCity" name="idVol" value="${vol[0].numVol}">
										</div>
		
										<div class="form-group col-sm-6">
											<label for="inputState" class="colorFontWhite">LANGUE</label>
											<select id="inputState" class="form-control">
												<option selected value="EN">EN</option>
												<option value="FR">FR</option>
											</select>
										</div>
		
										<div class="form-group col-sm-6">
											<label for="inputCity" class="colorFontWhite">Numéro Cel:</label>
											<input type="text" class="form-control" id="inputCity" name="telClient">
										</div>
										<div class="form-group col-sm-6 align-self-end">
											<button type="submit" class="btn btn-primary">SUIVRE CE VOL</button>
										</div>		
											
								</form>

							</div>

							<div class="col-sm-6 avis">
									<h5>AVIS IMPORTANT</h5>
									<p>Recevez instantanément par messagerie texte (SMS) le statut actuel de votre vol ou une alerte pour tout changement d'horaire de plus de 10 minutes. Vous pouvez vous inscrire à ce service pratique à l’aide du formulaire ci-dessous. Pour vous inscrire à partir de votre cellulaire, textez simplement votre numéro de vol au 23636. Exemple : Si vous voulez de l'information sur le vol AY123 en provenance de Calgary, envoyez «AY123» au numéro 23636. 
	
										<br>	Taux standard de messagerie texte applicables.</p>
							</div>
						</div>
					   
					   </c:otherwise>    
					</c:choose>



				</div>
				
					
				



			</div>	
			<div class="col-sm-3">

					<a href="index.aspx" class="logo" >
						<img src="./img/logo.gif " class="img-fluid mt-3" alt="Aeroport AMS "/>
					</a>
		
					<div class="date mt-5">
						<h2><span id="time"></span></h2>
						<h4><span id="day"></span>/<span id="year"></span></h4>
						
					</div>
					
					
					<div class="date mt-5">
					
						<h4 class="powered"><span> Powered by Meryem, Assia, Amelia, Michael et Sebastian </span></h4>
					</div>
					
			</div>	
		</div>
	</div>

</body>


<script>
  function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
	var year=today.getFullYear();
	var day=today.getDate();
	var month=today.getMonth();
	month++;
    // add a zero in front of numbers<10
    m = checkTime(m);
    s = checkTime(s);
   document.getElementById('time').innerHTML = h + ":" + m ;
   document.getElementById("year").innerHTML = year;
   document.getElementById("day").innerHTML=day+ "/" +month;
     // document.getElementById('time').innerHTML = h + ":" + m ;
    t = setTimeout(function () {
        startTime()
    }, 500);
}
startTime();
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>