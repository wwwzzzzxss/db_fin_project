<?php
include '../includes/connect.php';

if(isset($_GET['status'])){
    $status = $_GET['status'];
}
else{
    $status = '%';
}
$sql = mysqli_query($con, "SELECT * FROM orders WHERE status LIKE '$status';");

$orders = array();

while($row = mysqli_fetch_array($sql))
{
    $order = array();
    
    $order['id'] = $row['id'];
    $order['date'] = $row['date'];
    $order['payment_type'] = $row['payment_type'];
    $order['status'] = $row['status'];
    $order['deleted'] = $row['deleted'];
    $order['address'] = $row['address'];
    $order['total'] = $row['total'];
    
    $order['details'] = array();
    
    $order_id = $row['id'];
    $customer_id = $row['customer_id'];
    $sql1 = mysqli_query($con, "SELECT * FROM order_details WHERE order_id = $order_id;");
    $sql3 = mysqli_query($con, "SELECT * FROM users WHERE id = $customer_id;");
    
    while($row3 = mysqli_fetch_array($sql3))
    {
        $order['customer_name'] = $row3['name'];
        $order['customer_contact'] = $row3['contact'];
        $order['customer_email'] = $row3['email'];
    }
    
    while($row1 = mysqli_fetch_array($sql1))
    {
        $item = array();
        
        $item_id = $row1['item_id'];
        $sql2 = mysqli_query($con, "SELECT * FROM items WHERE it_id = $item_id;");
        while($row2 = mysqli_fetch_array($sql2))
            $item_name = $row2['name'];
        
        $item['id'] = $row1['item_id'];
        $item['name'] = $item_name;
        $item['quantity'] = $row1['quantity'];
        $item['price'] = $row1['price'];
        
        $order['details'][] = $item;
    }
    
    $orders[] = $order;
}

echo json_encode($orders);
?>
