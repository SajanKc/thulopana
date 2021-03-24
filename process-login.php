<?php session_start();
require_once("includes/dbcon.rec.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
     $email = $_POST['username'];
     $username = $_POST['username'];
     $password = md5($_POST['password']);

     $query = "SELECT * FROM user WHERE email=:email OR username=:username AND password=:pwd";
     $stmt = $pdo->prepare($query);
     $stmt->bindParam(':username', $username);
     $stmt->bindParam(':email', $email);
     $stmt->bindParam(':pwd', $password);
     $stmt->execute();
     $user = $stmt->fetch();

     if (!empty($user)) {
          $username = $user['username'];
          $_SESSION['logged_user'] = $username;
          $q = "SELECT * FROM user u LEFT JOIN role r ON u.role = r.rid WHERE u.username = :username";
          $stmt = $pdo->prepare($q);
          $stmt->bindParam(':username', $username);
          $stmt->execute();
          $result = $stmt->fetch();

          if ($result['role'] === 'admin') {
               echo '<h2>Admin logged in successfully</h2>';
               header('Refresh: 1; URL = admin/dashboard.php');
          } else if ($result['role'] === "seller") {
               echo '<h2>Seller logged in successfully</h2>';
               header('Refresh: 1; URL = seller/dashboard.php');
          } else {
               echo '<h2>Buyer logged in successfully</h2>';
               header('Refresh: 1; URL = index.php');
          }
     } else {
          echo '<h2>Invalid Username or password !!! Try again !!!</h2>';
          header('Refresh: 1.5; URL = login.php');
     }
}
