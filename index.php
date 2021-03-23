<?php
require_once("includes/dbcon.rec.php");
$query = "SELECT * FROM `book` limit 20";
$stmt = $pdo->prepare($query);
$stmt->execute();
$books = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html>

<head>
     <?php include_once("includes/head.inc.php");
     ?>
</head>

<body>
     <?php include_once("includes/theme-toggle.inc.php"); ?>

     <!-- Home Section Started -->
     <div class="container">
          <ul class="navbar">
               <li class="logo">
                    <!-- <img src="images/brand-logo.png" alt="logo here" /> -->
                    <h2 style="font-size:4rem; color:white; text-shadow: 2px 2px 8px #FF0000;">ThuloPana</h2>
               </li>
               <li><a class="btn-all" href="login.php"> Login </a></li>
          </ul>
     </div>
     <div class="main">
          <form class="main__area" method="GET" action="#">
               <h2>Unlimited books, magazines <br />newspapers, and more.</h2>
               <div class="search">
                    <input type="search" class="search__box" placeholder="i.e. Rich Dad Poor Dad" />
                    <input class="btn-all" type="submit" value="Submit" name="submit" style="padding: 18px; cursor:pointer; border:none">
               </div>
               <h4>Search Books by Title / Author / ISBN</h4>
          </form>
     </div>
     <!-- Home Section Ended -->
     <section class="main__container">
          <div class="container">
               <h2 class="heading__all">New Arrival</h2>
               <div class="hr__scroll">
                    <?php
                    foreach ($books as $book) {
                         // echo '<a href="book-details.php?id=' . $book['b_id'] . '">';
                         // echo '<img class="view__book" src="images/' . $book['b_img'] . '" />';
                         // echo '</a>';
                    }
                    ?>
                    <a href="#">
                         <img src="images/books/richdadpoordad.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/jaws.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/youcanwin.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/wheretheforest.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/thinkingofdrugs.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/jaws.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/youcanwin.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/wheretheforest.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/thinkingofdrugs.jpg" class="view-book" alt="">
                    </a>
                    <a href="#">
                         <img src="images/books/jaws.jpg" class="view-book" alt="">
                    </a>
               </div>
          </div>
     </section>
     <?php require_once("includes/footer.inc.php") ?>
</body>

</html>