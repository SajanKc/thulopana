<?php
session_start();
$logged_user = "";
if (isset($_SESSION['logged_user'])) {
     $logged_user = $_SESSION['logged_user'];
}
?>
<div class="container">
     <ul class="navbar">
          <li class="logo">
               <!-- <img src="images/brand-logo.png" alt="logo here" /> -->
               <h2 style="font-size:4rem; color:white; text-shadow: 2px 2px 8px #FF0000;"><a href="index.php"> ThuloPana </a></h2>
          </li>
          <li>
               <?php if ($logged_user === 'guest' || $logged_user === "") {
                    echo '<a class="btn-all" href="login.php"> Login </a>';
               } else {
                    echo '<a class="btn-all" href="logout.php"> Logout </a>';
               }
               ?>
          </li>
     </ul>
</div>