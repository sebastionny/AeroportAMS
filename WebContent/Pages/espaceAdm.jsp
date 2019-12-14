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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	
    <title>Aeroport AMS | Administrateur</title>
</head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


<body >

	<div class="container">
		<div class="row">
			<div class="col-sm-9 containerListe">
			
				<div class="head">
					<div class="row">
					    <div class="col-sm-6">
					            <h1>Administrateur</h1>
					    </div>
					    
					</div>
				</div>
			
				<div class="row">
						<div class="col-sm-12">
							<hr class="line">
						</div>
				</div>
					   
					   <div class="container row">
							<div class="col-sm-6">
									<form action="processus.aspx" method="post" >
										<div class="form-group h100 pbottom">
								
									<div class="card text-center cards">
      								<div class="card-header">DÉMARRER/ARRÊTER LE PROCESSUS
      								</div>
     								<div class="card-body">
     								<p>${mge}</p>
     									<div class="h30">
											<button type="submit" class="btn btn-primary">${Demarre}</button>
        							</div>
        							</div>      								
    								</div>
										</div>											
							
								</form>
								
							</div>
							<div class="col-sm-1"> </div>
							
						<div class="col-sm-5 ">
										<form action="chargerFichier.aspx" method="post" >
										<div class="form-group h100 pbottom">
								
									<div class="card text-center cards">
      								<div class="card-header">CHARGER CALENDRIER
      								</div>
     								<div class="card-body">
     								<p>Cliquez ici charge le calendrier</p>
               							<div class="h30">
               							<button type="submit" class="btn btn-primary">CHARGER</button>
               							</div>									
            						</div>
     				     			</div>		
     			        				<div class="colorFontWhite">${erreur} 		</div>	     								
    								</div>
																			
							
								</form>
								</div>
						
						
								

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

</html>