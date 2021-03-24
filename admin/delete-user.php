<?php
require_once("../includes/dbcon.rec.php");
// require_once "includes/auth.php";
?>
<html>

<head>
     <?php include_once("includes/head.inc.php"); ?>
</head>

<body>
     <?php
     if (isset($_GET['id']) && !empty($_GET['id'])) {
          $id = $_GET['id'];
          $query = "DELETE FROM user WHERE `uid`=:id";
          $stmt = $pdo->prepare($query);
          $stmt->bindParam(':id', $id);
          $stmt->execute();
          echo '<h2>Deletinging user...</h2>';
          header('Refresh: 1; URL = dashboard.php');
     } else {
          echo '<h2>No record specified to delete.</h2>';
          header('Refresh: 1; URL = dashboard.php');
     }
     ?>
</body>

</html>