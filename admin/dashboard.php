<?php require_once("../includes/dbcon.rec.php"); ?>

<!DOCTYPE html>
<html>

<head>
     <?php include_once("includes/head.inc.php");
     ?>
</head>

<body>
     <div class="container">
          <div>
               <h1 style="margin: 10px 0;">Admin Dashboard
                    <?php if (isset($_POST['submit'])) {
                         if ($_POST['choice'] === 'users') {
                              echo " / Users Details";
                         }
                         if ($_POST['choice'] === 'books') {
                              echo " / Books Details";
                         }
                    }  ?></h1>
          </div>
          <form style="display: inline;" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
               <label for="choice">Select Option: </label>
               <select name="choice" id="choice" style="border-radius: 3px; padding:5px;">
                    <option value="">Select...</option>
                    <option value="users">User Details</option>
                    <option value="books">Book Details</option>
               </select>
               <input class="btn-all" type="submit" value="Submit" name="submit">
          </form>
          <a class="btn-all" style="float: right;" href="../logout.php"> Logout </a>

          <?php
          if (isset($_POST['submit'])) {
               if ($_POST['choice'] === '') {
                    echo "<h1 style='text-align:center;margin-top:10px;'>Please Select One Option</h1>";
               }
          }
          ?>

          <?php
          if (isset($_POST['submit'])) {
               if ($_POST['choice'] === 'users') {
                    $query = "SELECT * FROM `user`";
                    $stmt = $pdo->prepare($query);
                    $stmt->execute();
                    $users = $stmt->fetchAll();
          ?>
                    <div class="dashboard__heading">
                         <a class="btn-all" href="add-user.php"> Add User </a>
                    </div>
                    <div style="overflow-x:auto;">
                         <table class="userdetails__table">
                              <tr>
                                   <th>#</th>
                                   <th>Name</th>
                                   <th>Email</th>
                                   <th>Phone</th>
                                   <th>Role</th>
                                   <th>Registered At</th>
                                   <th>Updated At</th>
                                   <th>Action</th>
                              </tr>
                              <?php foreach ($users as $user) { ?>
                                   <?php
                                   $q = "SELECT r.role FROM user u LEFT JOIN role r ON u.role = r.rid WHERE u.username = :username";
                                   $stmt = $pdo->prepare($q);
                                   $stmt->bindParam(':username', $user['username']);
                                   $stmt->execute();
                                   $role = $stmt->fetch();
                                   ?>
                                   <tr>
                                        <td><?php echo $user['uid'] ?></td>
                                        <td><?php echo $user['username'] ?></td>
                                        <td><?php echo $user['email'] ?></td>
                                        <td><?php echo $user['phone'] ?></td>
                                        <td><?php echo $role['role'] ?></td>
                                        <td><?php echo $user['registered_at'] ?></td>
                                        <td><?php echo $user['updated_at'] ?></td>
                                        <td>
                                             <a class="btn-all" href="edit-user.php?id=<?php echo $user['uid']; ?>">Edit</a>
                                             <?php echo "<a class='btn-all' onClick=\"javascript: return confirm('Are you sure you want to delete this user ?');\" href='delete-user.php?id=" . $user['uid'] . "'>Delete</a>"; ?>
                                        </td>
                                   </tr>
                              <?php } ?>
                         </table>
                    </div>
          <?php
               }
          }
          ?>

          <?php
          if (isset($_POST['submit'])) {
               if ($_POST['choice'] === 'books') {
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
                                        <td><?php echo '<img src="../images/' . $book['image'] . '" />'; ?></td>
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
          <?php
               }
          }
          ?>
     </div>
     <?php require_once("includes/footer.inc.php"); ?>
</body>

</html>