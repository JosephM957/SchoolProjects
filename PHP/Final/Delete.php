<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Delete Record</title>
</head>
<body>
<?php
    $severname = "localhost:3308";
    $username = "root";
    $password = "";
    $dbname = "finalproject";
    $show = $_POST['dshow'];
        try {
            
            $conn = new PDO("mysql:host=$severname;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "DELETE FROM `show` WHERE Show_ID=$show";

            // Execute the query
            $query = $conn->query($sql);
            $query->setFetchMode(PDO::FETCH_ASSOC);

            // Display the inserted data in a table
            echo "Deleted successfully";
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
?>
</body>
</html>