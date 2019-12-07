<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./CSS/app.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Montserrat+Alternates:600,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rajdhani:300,500,700&display=swap" rel="stylesheet">


<title>Connexion</title>
</head>

<body>
<div class="row">

  <div class="col-sm-4">
		<div class="containerAdmin">
            <div class="head">
                <h1>Administrateur</h1>

    <div class="h100">
    <form action="login.aspx" method="post">
            <h3>UTILISATEUR</h3>
             <div class="form-group input-group ">
            <div class="input-group-prepend">
                <input  class="form-control" name="user"/>
            </div>
        	</div>
            <h3>MOT DE PASSE</h3>
            <div class="form-group input-group ">
            <div class="input-group-prepend">
                <input  class="form-control " name="password"/>
            </div>
        	</div>        	
        	<div class="h30">
        	<input class="btn-solid" type="submit" value="SE CONNECTER"   />
        	   </div>
        </form>	        	
    </div>           
        </div>           
        </div>
</div>	
  <div class="col-sm-4">
		
		</div>
  <div class="col-sm-4">
    	<div>          
            <a href="#" class="logo" >
            <img src="./img/logo.gif" class="img-fluid mt-3" alt="Aeroport AMS "/>
            </a>
        </div>    	    
	</div>
    	</div>	
</body>
</html>