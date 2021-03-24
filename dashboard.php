<?php
require_once("includes/dbcon.rec.php");
$query = "SELECT * FROM `book`";
$stmt = $pdo->prepare($query);
$stmt->execute();
$books = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html>

<head>
     <?php include_once("includes/head.inc.php");
     ?>
     <style>
          .dashboard__heading {
               display: flex;
               justify-content: space-between;
               margin-top: 10px;
          }

          .bookdetails__table {
               width: 100%;
               border-collapse: collapse;
               margin: 10px 0;
          }

          .bookdetails__table th,
          .bookdetails__table td {
               border: 1px solid black;
               padding: 10px;
          }

          .bookdetails__table tr:nth-child(even) {
               background-color: #d4d4d4;
          }

          .bookdetails__table tr:hover {
               background-color: #aaa;
          }

          .bookdetails__table th {
               padding-top: 12px;
               padding-bottom: 12px;
               background-color: #4CAF50;
               color: white;
          }
     </style>
</head>

<body>
     <div class="container">
          <div class="dashboard__heading">
               <h2>Book Details</h2>
               <a class="btn-all" href="#"> Add Book </a>
          </div>

          <div style="overflow-x:auto;">
               <table class="bookdetails__table">
                    <tr>
                         <th>#</th>
                         <th>Title</th>
                         <th>Author</th>
                         <th>price</th>
                         <th>Role</th>
                         <th>Uploaded At</th>
                         <th>Updated At</th>
                         <th>Action</th>
                    </tr>
                    <?php foreach ($books as $book) { ?>
                         <tr>
                              <td><?php echo $book['uid'] ?></td>
                              <td><?php echo $book['bookname'] ?></td>
                              <td><?php echo $book['email'] ?></td>
                              <td><?php echo $book['phone'] ?></td>
                              <td><?php echo $book['role'] ?></td>
                              <td><?php echo $book['registered_at'] ?></td>
                              <td><?php echo $book['updated_at'] ?></td>
                              <td>
                                   <a class="btn-all" href="#">Edit</a> <a class="btn-all" href="#">Delete</a>
                              </td>
                         </tr>
                    <?php } ?>
               </table>
          </div>
     </div>
     <?php require_once("includes/footer.inc.php") ?>
</body>

</html>