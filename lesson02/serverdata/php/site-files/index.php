<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Hello world from Terraform+AWS+PHP+MySQL</title>
</head>
<body>
<pre>
<?php
echo "If you see this PHP works OK.";
require "config.php";
try 
{
  $connection = new PDO("mysql:host=$host", $username, $password, $options);
  $sql = "SELECT id, name FROM names;";
  $connection->exec($sql);
  echo "SQL request OK";
}
catch(PDOException $error)
{
  echo $sql . "<br>" . $error->getMessage();
}
$result = $statement->fetchAll();
if ($result && $statement->rowCount() > 0) 
{ 
  // open table
  echo "---------------------------------------";
  foreach ($result as $row) 
  {
    echo "| ".$row["id"]." | ".$row["name"]." |";
  } 
  echo "---------------------------------------";
  // close table
} 
else 
{ 
  echo "No data in database yet.";
  // no results
}
?>
</pre>
</body>
</html>
