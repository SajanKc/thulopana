<?php
session_start();
session_destroy();
// $_SESSION['logged_user'] = 'guest';	
echo "<h1>Logging Out...</h1>";
header('Refresh: 1; URL = index.php');
