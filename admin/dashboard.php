<?php
require_once("includes/dbcon.rec.php");
$query = "SELECT * FROM `user`";
$stmt = $pdo->prepare($query);
$stmt->execute();
$users = $stmt->fetchAll();
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

          .userdetails__table {
               width: 100%;
               border-collapse: collapse;
               margin: 10px 0;
          }

          .userdetails__table th,
          .userdetails__table td {
               border: 1px solid black;
               padding: 10px;
          }

          .userdetails__table tr:nth-child(even) {
               background-color: #d4d4d4;
          }

          .userdetails__table tr:hover {
               background-color: #aaa;
          }

          .userdetails__table th {
               padding-top: 12px;
               padding-bottom: 12px;
               background-color: #4CAF50;
               color: white;
          }
     </style>
</head>

<body>
     <div class="container">
          <div>
               <h1>Admin Dashboard</h1>
          </div>
          <div class="dashboard__heading">
               <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <label for="choice">Select Option: </label>
                    <select name="choice" id="choice" style="border-radius: 3px; padding:5px;">
                         <option value="">Select...</option>
                         <option value="users">User Details</option>
                         <option value="books">Book Details</option>
                    </select>
                    <input class="btn-all" type="submit" value="Submit" name="submit">
               </form>

               <a class="btn-all" href="logout.php"> Logout </a>
               <a class="btn-all" href="#"> Add User </a>
          </div>

          <div style="overflow-x:auto;">
               <?php
               if (isset($_POST['submit'])) {
                    if ($_POST['choice'] === '') {
                         echo "<h1 style='text-align:center;margin-top:10px;'>Please Select One Option</h1>";
                    }
               }
               ?>

               <?php
               if (isset($_POST['submit'])) {
                    if ($_POST['choice'] === 'users') { ?>
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
                                   $q = "SELECT r.role FROM user u LEFT JOIN role r ON u.role = r.rid WHERE username = :username";
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
                                             <a class="btn-all" href="edit.php?id=<?php $user['uid']; ?>">Edit</a>
                                             <a class="btn-all" href="delete.php?id=<?php $user['uid']; ?>">Delete</a>
                                        </td>
                                   </tr>
                              <?php } ?>
                         </table>
               <?php
                    }
               }
               ?>

               <?php
               if (isset($_POST['submit'])) {
                    if ($_POST['choice'] === 'books') { ?>
                         <table class="userdetails__table">
                              <tr>
                                   <th>#</th>
                                   <th>Title</th>
                                   <th>Author</th>
                                   <th>Phone</th>
                                   <th>Role</th>
                                   <th>Uploaded At</th>
                                   <th>Updated At</th>
                                   <th>Action</th>
                              </tr>
                              <?php foreach ($users as $user) { ?>
                                   <?php
                                   $q = "SELECT r.role FROM user u LEFT JOIN role r ON u.role = r.rid WHERE username = :username";
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
                                             <a class="btn-all" href="edit.php?id=<?php $user['uid']; ?>">Edit</a>
                                             <a class="btn-all" href="delete.php?id=<?php $user['uid']; ?>">Delete</a>
                                        </td>
                                   </tr>
                              <?php } ?>
                         </table>
               <?php
                    }
               }
               ?>
          </div>
     </div>
     <?php require_once("includes/footer.inc.php"); ?>
</body>

</html>