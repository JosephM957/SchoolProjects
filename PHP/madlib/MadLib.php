<!DOCTYPE html>
<html lang="en">
<head>
  <title>PHP Forms Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
	h1	{
			text-align:center;
			margin-bottom: 1em;
			text-shadow: 0px 0px 5px #ffffff;
			color: darkgreen;
		}
    body {
		color: #000;
		display: block;
		background-image: url('Images/stadium.jpg');
		background-repeat: no-repeat;
		background-size: cover;
		text-align: justify;
	}

  </style>
</head>
<body>

  
<div class="container-fluid">
	<h1>The Sport Game</h1>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 displayArea">
		<!-- The display code goes here -->
			<?php 
			echo "The "; echo "<b>";  echo $_POST["sport"]; echo "</b>"; echo " game was underway. The "; echo "<b>";  echo $_POST["team1"]; echo "</b>";  echo " vs ";  echo "<b>";  echo $_POST["team2"]; echo "</b>";  echo " each team had ";  echo "<b>";  echo $_POST["num1"]; echo "</b>";  echo " players. "; 
			echo "Some of the star players include ";  echo "<b>";  echo $_POST["name1"]; echo "</b>";  echo ", ";  echo "<b>";  echo $_POST["name2"]; echo "</b>";  echo ", ";  echo "<b>";  echo $_POST["name3"]; echo "</b>";  echo ", ";  echo "<b>";  echo $_POST["name4"]; echo "</b>"; 
			echo ". The game takes place in the state of ";  echo "<b>";  echo $_POST["state"]; echo "</b>";  echo ". In the city of ";  echo "<b>";  echo $_POST["city"]; echo "</b>";  
			echo ". It started at ";  echo "<b>";  echo $_POST["time"]; echo "</b>";  echo ". On a ";  echo "<b>";  echo $_POST["day"]; echo "</b>";  echo " during "; echo "<b>"; echo $_POST["Month"]; echo "</b>"; echo "</b>"; echo  ". This game was extra special because it was being livestreamed to the ";  echo "<b>";  echo $_POST["event"]; echo "</b>";  echo " because of this the players were feeling "; echo $_POST["Feeling"]; echo "</b>"; echo ". Shortly after "; echo $_POST["fraction"]; echo "</b>"; 
			echo " of the game ";  echo "<b>";  echo $_POST["name5"]; echo "</b>";  echo " Severly hurt ";  echo "<b>";  echo $_POST["pronoun"]; echo "</b>";  echo " ";  echo "<b>";  echo $_POST["bodypart"]; echo "</b>"; echo " At the end of the game the "; echo "<b>";  echo $_POST["num2"]; echo "</b>";  echo " Team Won."
			?>
			
		</div>
		<div class="col-md-3"></div>    
	</div>
	
</div>

</body>
</html>