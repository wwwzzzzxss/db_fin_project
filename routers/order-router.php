<?php
include '../includes/connect.php';
include '../includes/wallet.php';
$total = 0;
$address = htmlspecialchars($_POST['address']);
$description =  'test';
$payment_type = $_POST['payment_type'];
$total = $_POST['total'];
$orderTime = $_POST['ordertime'];
$order_type = $_POST['order_type'];

	$sql = "INSERT INTO orders (customer_id, payment_type, address, total, description, date,status) VALUES ($user_id, '$payment_type', '$address', $total, '$description', '$orderTime','$order_type')";
	if ($con->query($sql) === TRUE){
		$order_id =  $con->insert_id;
		foreach ($_POST['items'] as $key => $value)
		{
			$quantity = $value['quantity'];
            $sweet = isset($value['sweet']) ? $value['sweet'] : '';
            $ice = isset($value['ice']) ? $value['ice'] : '';
		
			$result = mysqli_query($con, "SELECT * FROM items WHERE it_id = $key");
			while($row = mysqli_fetch_array($result))
			{
				$price = $row['price'];
			}
				$price = $quantity * $price;
			$sql = "INSERT INTO order_details (order_id, item_id, quantity, price) VALUES ($order_id, $key, $quantity, $price)";
			$con->query($sql) === TRUE;		
			
		}
		if($_POST['payment_type'] == 'Wallet'){
		$balance = $balance - $total;
		$sql = "UPDATE wallet_details SET balance = $balance WHERE customer_id = $user_id;";
		$con->query($sql) === TRUE;
		}
			header("location: ../orders.php");
	}

?>