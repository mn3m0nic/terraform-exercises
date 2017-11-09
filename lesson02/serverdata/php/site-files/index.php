<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Hello world from Terraform+AWS+PHP+MySQL</title>
        <style> td, th { border: 1px solid #ddd;    padding: 8px; } </style>
</head>
<body>
<?php
require "config.php";
try 
{
  $connection = new PDO("mysql:host=$host", $username, $password, $options);
  $sql = "SELECT id, name FROM test.names;";
}
catch(PDOException $error)
{
  echo $sql . "<br>" . $error->getMessage();
}

$statement = $connection->prepare($sql);
$statement->execute();
$result = $statement->fetchAll();
if ($result && $statement->rowCount() > 0) 
{ 
        echo "<table><tbody>";
  foreach ($result as $row) 
  {
    echo "<tr><td>".$row["id"]."</td><td>".$row["name"]."</td></tr>";
  } 
  echo "</tbody>";
} 
else 
{ 
  echo "No data in database yet.";
}
?>
</pre>
</body>
</html>
