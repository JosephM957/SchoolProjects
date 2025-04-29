<!DOCTYPE html>
<html lang="en">
<head>
<title>PHP Forms Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
h1	{
	text-align:center;
}
.displayArea {
	display: block;
    background-image: linear-gradient(to bottom, aqua, lime);
}
body {
	background-color: orange;
}

</style>
</head>
<body>

	<div class="container-fluid">
		<h1>Forms Handling</h1>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 displayArea">
			<!-- Add the code for the form -->
			<form action="MadLib.php" method="post">
			Sport: <input type="text" name="sport" required><br>
			Team Name: <input type="text" name="team1" required><br>
			Team Name: <input type="text" name="team2" required><br>
			Number: <input type="number" name="num1"required><br>
			Name: <input type="text" name="name1" required><br>	
			Name: <input type="text" name="name2" required><br>
			Name: <input type="text" name="name3" required><br>
			Name: <input type="text" name="name4" required><br>
			United States State: <input type="text" name="state" required><br>
			City: <input type="text" name="city" required><br>
			Time: <input type="text" name="time"required><br>
			Day of the week: <input type="text" name="day"required><br>
			Month: <input type="text" name="Month" required><br>
			Event: <input type="text" name="event" required><br>
			Feeling: <input type="text" name="Feeling" required><br>
			Fraction: <input type="text" name="fraction" required><br>
			Name: <input type="text" name="name5" required><br>
			Possessive Pronoun: <input type="text" name="pronoun" required><br>
			Body Part: <input type="text" name="bodypart" required><br>
			First or Second: <input type="text" name="num2"required><br>
			<input type="submit">
			</form>				
			<!-- don't forget the submit button -->
			</div>
			<div class="col-md-3"></div>
		</div>

	</div>

</body>
</html>