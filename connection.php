<?php

$host="localhost"; // Host name 
$db_username="root"; // Mysql username 
$db_password=""; // Mysql password 
$db_name="quizzly_db"; // Database name 


$username = "";
$user_password = "";


// Connect to server and select databse.
$conn = mysqli_connect($host, $db_username, $db_password, $db_name);


// username and password sent from form 
if((isset($_POST["username"])) && (isset($_POST["user_password"]))) {
    $username=$_POST['username']; 
    $user_password=$_POST['user_password']; 
}


// To protect MySQL injection 
$username = stripslashes($username);
$user_password = stripslashes($user_password);


$sql="SELECT * FROM users WHERE username='$username' and user_password='$user_password'";
$result=mysqli_query($conn, $sql);


// Mysql_num_row is counting table row
$count=mysqli_num_rows($result);
// If result matched $myusername and $mypassword, table row must be 1 row


if($count==1){
$result=mysqli_fetch_array($result);
$user_type = $result['user_type'];


//page link on the basis of user role you can add more  condition on the basis of ur roles in db
if($user_type =='1'){
 $link = '../superuser_dashboard/html/dashboard-superuser.php';

 }
elseif($user_type =='2'){
 $link = '../professor_dashboard/html/dashboard-professor.php';

 }
 elseif($user_type =='3'){
 $link = '../student_dashboard/html/dashboard-student.php';

 }
 else {
echo "Wrong Username or Password";
}


session_start();
// session Register username, password, type and id and then redirect to dashboard
$_SESSION["username"] = $username;
$_SESSION["user_password"] = $user_password;
$_SESSION["user_type"] = $user_type;
$_SESSION["id"] = $result['id'];
$_SESSION["first_name"] = $result['first_name'];
$_SESSION["surname"] = $result['surname'];
header("Location: ".$link."");
exit();
}







?>

