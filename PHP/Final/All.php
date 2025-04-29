<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>title</title>
</head>
<style>
table {
      border-collapse: collapse; /* Ensure borders between cells merge */
      width: 100%; /* Makes the table fill the width of its container */
    }

    th, td {
      border: 1px solid black; /* Adds a border to the table headers and data cells */
      padding: 8px; /* Adds space around the text in cells */
      text-align: left; /* Aligns text to the left in table cells */
    }
    
    th {
      background-color: #f2f2f2; /* Adds a background color to the header row */
    }
</style>
<body>
<input class="btn btn-secondary" type="submit" name="myBtns" value="Form" onclick="location='Form.html'">
<?php
     $severname = "localhost:3308";
     $username = "root";
     $password = "";
     $dbname = "finalproject";
try {
          $conn = new PDO("mysql:host=$severname;dbname=$dbname", $username, $password, );
          $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
          $sql = "SELECT * FROM `show` WHERE 1";
          $query = $conn->query($sql);
          $query->setFetchMode(PDO::FETCH_ASSOC);
          echo "<table>";
          echo "<h3>Shows</h3>";
               echo "<tr>";
                    echo "<th>Show ID</th>";
                    echo "<th>Show Name</th>";
                    echo "<th>Episodes</th>";
                    echo "<th>Seasons</th>";
                    echo "<th>Start Year</th>";
                    echo "<th>End Year</th>";
                    echo "<th>Company ID</th>";
                    echo "<th>Genre ID</th>";
                    echo "<th>Producer ID</th>";
               echo "</tr>";
                    while ($row = $query->fetch()){
                         echo "<tr>"; echo "<td>"; echo $row['Show_ID']; echo "</td>";
                         echo "<td>"; echo $row['NAME']; echo "</td>";
                         echo "<td>"; echo $row['EPISODES']; echo "</td>";
                         echo "<td>"; echo $row['SEASONS']; echo "</td>";
                         echo "<td>"; echo $row['START YEAR']; echo "</td>";
                         echo "<td>"; echo $row['END YEAR']; echo "</td>";
                         echo "<td>"; echo $row['Company_ID']; echo "</td>";
                         echo "<td>"; echo $row['GENRE_ID']; echo "</td>";
                         echo "<td>"; echo $row['PRODUCER_ID']; echo "</td>";
                         echo "</tr>";
               }
          echo "</table>";
     } catch (PDOException $e) {
          echo "Connection failed: " . $e->getMessage();
     }
     ?>
</body>
</html>