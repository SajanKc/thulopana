<?php
     session_start();
     $host = '127.0.0.1';
     $db   = 'thulopana'; 
     $user = 'root';
     $pass = 'MySql@123';
     $charset = 'utf8';

     $dsn = "mysql:host=$host;dbname=$db;";
     $pdo = new PDO($dsn, $user, $pass);
?>