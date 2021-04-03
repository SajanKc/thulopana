<?php
     session_start();
     $host = 'localhost';
     $db   = 'thulopana'; 
     $user = 'root';
     $pass = '1234';

     $dsn = "mysql:host=$host;dbname=$db;";
     $pdo = new PDO($dsn, $user, $pass);
?>