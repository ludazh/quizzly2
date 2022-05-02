<?php
session_start();
unset($_SESSION["id"]);
unset($_SESSION["username"]);
header("Location: homepage/public/index.html");
?>