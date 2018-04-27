<html>
<head>
 <script src="validate.js"></script> 
</head>
<body>  

 <form name="adminform" onsubmit="return validateAdminForm()" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >
  <div class="container">
    <h1>Admin Login</h1>
    <p>Fill Admin username and password</p>
    <hr>

    <label for="username"><b>Username</b></label> <br>
    <input type="text" placeholder="Enter admin Username" name="username" required>
    <br>

    <label for="psw"><b>Password</b></label> <br>
    <input type="password" placeholder="Enter admin Password" name="psw" required>
    <br>

    <div class="clearfix">
      <button type="submit" class="signupbtn">Sign Up</button>
      <br>
      <a href="action_page.php">Another Registration</a>
    </div>
  </div>
</form>

<?php
echo "<h2>Registered list:</h2>";

$db = new SQLite3('mysqlitedb.db');

$username = $psw = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $username = test_input($_POST["username"]);
  $psw = test_input($_POST["psw"]);
 
  $query1 = "select * from registered";
  $result = $db->query($query1);

 
  if($username!="Admin" || $psw!="Admin") {
    
    echo "Invalid Username/Password";
  }
  else{
    echo "<table style=\"width:100%\">";
    echo "<tr> <td>Name</td> <td>Address</td> <td>Email</td> <td>Mobile</td> <td>Account</td>"; 
    while($answer = $result->fetchArray()) {  
      echo "<tr> <td>$answer[0]</td> <td>$answer[1]</td> <td>$answer[2]</td> <td>$answer[4]</td> <td>$answer[5]</td>";
    }
    echo "</table>";
 }
}


  function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}


?>
</body>
</html>
