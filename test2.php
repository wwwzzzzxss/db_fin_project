<?php
include 'includes/connect.php';
include 'includes/wallet.php';
$total = 0;
$result = mysqli_query($con, "SELECT * FROM users WHERE id = $user_id");

if ($result) {
    // 檢查結果集中行的數量
    if (mysqli_num_rows($result) > 0) {
        // 結果不為空，迭代結果集
        while ($row = mysqli_fetch_array($result)) {
            $name = $row['name'];
            $address = $row['address'];
            $contact = $row['contact'];
            $verified = $row['verified'];
            
            // 處理獲取到的數據
            echo "Name: $name, Address: $address, Contact: $contact, Verified: $verified";
        }
    } else {
        // 結果為空
        echo "No records found.";
    }
} else {
    // 查詢失敗
    echo "Query failed: " . mysqli_error($con);
}

		?>