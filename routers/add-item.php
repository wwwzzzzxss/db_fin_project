<?php
include '../includes/connect.php';

$name = $_POST['name'];
$price = $_POST['price'];
$type = $_POST['type'];
$sql = "INSERT INTO items (name, price,type) VALUES ('$name', $price,'$type')";
$con->query($sql);
header("location: ../admin-page.php");
?>