<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Add Records</title>
</head>
<body>
<?php
    // Database credentials
    $severname = "localhost:3308";
    $username = "root";
    $password = "";
    $dbname = "finalproject";
    $show = $_POST['show'];
    $episodes = $_POST['episodes'];
    $seasons = $_POST['seasons'];
    $yearst = $_POST['StartYear'];
    $yearend = $_POST['EndYear'];
    $genre = $_POST['Genre'];
    $producer = $_POST['producer'];
    $companyid = $_POST['companyid'];
        try {
            // Create a PDO connection
            $conn = new PDO("mysql:host=$severname;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // SQL query for inserting data

            $sql = "INSERT INTO `show` (`NAME`, `EPISODES`, `SEASONS`, `START YEAR`, `END YEAR`, `Company_ID`, `GENRE_ID`, `PRODUCER_ID`) 
            VALUES ('$show', '$episodes', '$seasons', '$yearst', $yearend, '$companyid', '$genre', '$producer')";

            // Execute the query
            $query = $conn->query($sql);
            $query->setFetchMode(PDO::FETCH_ASSOC);

            // Display the inserted data in a table
            echo "inserted succesfullly";
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
?>
</body>
</html>
