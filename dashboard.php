<?php
require_once("includes/dbcon.rec.php");
session_start();
?>

<!DOCTYPE html>
<html>

<head>
     <?php include_once("includes/head.inc.php"); ?>
</head>

<body>
     <div class="container">
          <div>
               <h1 style="margin: 10px 0;">Seller Dashboard </h1>
               <h2>
                    <?php if (isset($_SESSION)) {
                         echo "Welcome " . $_SESSION['logged_user'];
                    }  ?>
               </h2>
          </div>
          <a class="btn-all" style="float: right;" href="logout.php"> Logout </a>
          <?php
          $query = "SELECT * FROM `book`";
          $stmt = $pdo->prepare($query);
          $stmt->execute();
          $books = $stmt->fetchAll();
          ?>
          <div class="dashboard__heading">
               <a class="btn-all" href="add-book.php"> Add Book </a>
          </div>
          <div style="overflow-x:auto;">
               <table class="userdetails__table">
                    <tr>
                         <th>#</th>
                         <th>Image</th>
                         <th>ISBN</th>
                         <th>Title</th>
                         <th>Author</th>
                         <th>Category</th>
                         <th>Published Year</th>
                         <th>Type</th>
                         <th>Pages</th>
                         <th>Price</th>
                         <th>Uploaded At</th>
                         <th>Updated At</th>
                         <th>Action</th>
                    </tr>
                    <?php foreach ($books as $book) { ?>
                         <?php
                         $q = "SELECT c.c_name FROM book b LEFT JOIN category c ON b.category = c.c_id WHERE b.b_id = :bookid";
                         $stmt = $pdo->prepare($q);
                         $stmt->bindParam(':bookid', $book['b_id']);
                         $stmt->execute();
                         $category = $stmt->fetch();
                         ?>
                         <tr>
                              <td><?php echo $book['b_id'] ?></td>
                              <td><?php echo '<img src="images/' . $book['image'] . '" />'; ?></td>
                              <td><?php echo $book['isbn'] ?></td>
                              <td><?php echo $book['title'] ?></td>
                              <td><?php echo $book['author'] ?></td>
                              <td><?php echo $category['c_name'] ?></td>
                              <td><?php echo $book['published_year'] ?></td>
                              <td><?php echo $book['type'] ?></td>
                              <td><?php echo $book['pages'] ?></td>
                              <td><?php echo "Rs. " . $book['price'] ?></td>
                              <td><?php echo $book['uploaded_at'] ?></td>
                              <td><?php echo $book['updated_at'] ?></td>
                              <td>
                                   <a class="btn-all" href="view-book.php?id=<?php echo $book['b_id']; ?>">View</a>
                                   <a class="btn-all" href="edit-book.php?id=<?php echo $book['b_id']; ?>">Edit</a>
                                   <?php echo "<a class='btn-all' onClick=\"javascript: return confirm('Are you sure you want to delete this user ?');\" href='delete-book.php?id=" . $book['b_id'] . "'>Delete</a>"; ?>
                              </td>
                         </tr>
                    <?php } ?>
               </table>
          </div>
     </div>
     <?php require_once("includes/footer.inc.php"); ?>
</body>

</html>