<html>
<head>
 <script src="validate.js"></script> 
</head>
<body>  

<?php

$db = new SQLite3('mysqlitedb.db');
$db->query("create table registered(name varchar(20), address varchar(100), email varchar(100), psw varchar(20), mobile char(10), account char(5))");

$name = $address = $email = $mobile = $account = $psw = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = test_input($_POST["name"]);
  $address = test_input($_POST["address"]);
  $email = test_input($_POST["email"]);
  $mobile = test_input($_POST["mobile"]);
  $account = test_input($_POST["account"]);
  $psw = test_input($_POST["psw"]);
  $query1 = "insert into registered values ('$name', '$address', '$email', '$psw', '$mobile', '$account')";
  $check1 = "select * from registered where email like '$email'";
  $res1 = $db->query($check1);

  $check2 = "select account from balance where account like '$account'";
  $check3 = "select psw from balance where account like '$account'";
  $check4 = "select bal from balance where account like '$account'";
  $res2 = $db->query($check2);
  $res3 = $db->query($check3);
  $res4 = $db->query($check4);
  $ans2 = $res2->fetchArray();  
  $ans3 = $res3->fetchArray();  
  $ans4 = $res4->fetchArray();  
 
  if(!($ans2) || ($ans3[0]!=$psw)) {
    
    echo "Invalid Username/Password";
  }
  else{
    if(!($res1->fetchArray())) {
      if($ans4[0]<1000) {
        echo "Insufficient Balance";
      }
      else {
        echo "Registration Successful";
        $result1 = $db->query($query1);
        $newval = $ans4[0]-1000;
        $db->query("update balance set bal = $newval where account like '$account'");
      }  
    }
    else {
     echo "Already Registered";
    }  
  }
  
}

  function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}


?>
 <form name="myForm" onsubmit="return validateForm()" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="name"><b>Name</b></label> <br>
    <input type="text" placeholder="Enter Your name" name="name" required>
    <br>

    <label for="address"><b>Address</b></label> <br>
    <input type="text" placeholder="Enter Your address" name="address" required>    
    <br>
    
    <label for="email"><b>Email</b></label> <br>
    <input type="email" placeholder="Enter Your email address" name="email" required>    
    <br>
    
    <label for="mobile"><b>Mobile</b></label> <br>
    <input type="number" placeholder="Enter Your mobile address" name="mobile" required>    
    <br>
    
    <label for="account"><b>Account</b></label> <br>
    <input type="number" placeholder="Enter Your bank account number" name="account" required>    
    <br>

    <label for="psw"><b>Password</b></label> <br>
    <input type="password" placeholder="Enter Password" name="psw" required>
    <br>

    <a href="admin.php">List of registered candidates</a>

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>
</body>
</html>
