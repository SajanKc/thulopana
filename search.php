<?php
session_start();
require_once("includes/dbcon.rec.php");

$search = isset($_GET['q']) ? $_GET['q'] : '';
if ($search === "") {
     header('location: index.php');
}

$query = "SELECT * FROM `book` WHERE `title` LIKE '%$search%' OR `author` LIKE '%$search%' OR `isbn` LIKE '%$search%' LIMIT 10";

$stmt = $pdo->prepare($query);
$stmt->execute();
$books = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html>

<head>
     <?php include_once("includes/head.inc.php"); ?>
</head>

<body>
     <div style="overflow-x:auto;">
          <table class="userdetails__table">
               <tr>
                    <th>SN</th>
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
               <?php $i = 1;
               foreach ($books as $book) { ?>
                    <?php

                    $q = "SELECT c.c_name FROM book b LEFT JOIN category c ON b.category = c.c_id WHERE b.b_id = :bookid";
                    $stmt = $pdo->prepare($q);
                    $stmt->bindParam(':bookid', $book['b_id']);
                    $stmt->execute();
                    $category = $stmt->fetch();
                    ?>
                    <tr>
                         <td><?php echo $i++; ?></td>
                         <td><?php echo '<img src="images/' . $book['image'] . '" />'; ?></td>
                         <td><?php echo $book['isbn'] ?></td>
                         <td><?php echo ucwords(strtolower($book['title'])) ?></td>
                         <td><?php echo ucwords(strtolower($book['author'])) ?></td>
                         <td><?php echo ucwords(strtolower($category['c_name'])) ?></td>
                         <td><?php echo $book['published_year'] ?></td>
                         <td><?php echo ucwords(strtolower($book['type'])) ?></td>
                         <td><?php echo $book['pages'] ?></td>
                         <td><?php echo "Rs. " . $book['price'] ?></td>
                         <td><?php echo $book['uploaded_at'] ?></td>
                         <td><?php echo $book['updated_at'] ?></td>
                         <td>
                              <a class="btn-all" href="view-book.php?id=<?php echo $book['b_id']; ?>">View</a>
                         </td>
                    </tr>
               <?php } ?>
          </table>
     </div>
     <?php require_once("includes/footer.inc.php"); ?>
</body>

</html>