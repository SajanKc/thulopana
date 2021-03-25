<?php
session_start();
$logged_user = "";
if (isset($_SESSION['logged_user'])) {
     $logged_user = $_SESSION['logged_user'];
}

require_once("includes/dbcon.rec.php");

$query = "SELECT * FROM `book` ORDER BY `uploaded_at` DESC limit 10";
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
     <!-- Home Section Started -->
     <div class="container">
          <ul class="navbar">
               <li class="logo">
                    <!-- <img src="images/brand-logo.png" alt="logo here" /> -->
                    <h2 style="font-size:4rem; color:white; text-shadow: 2px 2px 8px #FF0000;">ThuloPana</h2>
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
     <div class="main">
          <form class="main__area" method="GET" action="search.php?search=">
               <h2>Unlimited books, magazines <br />newspapers, and more.</h2>
               <div class="search">
                    <input type="search" name="q" class="search__box" value="<?php echo isset($_GET['q']) ? str_replace(' ', '%', strtolower(trim($_GET['q']))) : '' ?>" placeholder="i.e. Rich Dad Poor Dad" required />
                    <input class="btn-all" type="submit" value="Search" name="" style="padding: 18px; cursor:pointer; border:none">
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
                         echo '<a href="book-details.php?id=' . $book['b_id'] . '">';
                         echo '<img class="view-book" src="images/' . $book['image'] . '" />';
                         echo '</a>';
                    }
                    ?>
               </div>
          </div>
     </section>
     <?php require_once("includes/footer.inc.php") ?>
</body>

</html>