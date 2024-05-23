<?php  
session_start(); 


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Change Form</title>
    <style>
        .container {
            width: 50%;
            margin: auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .btn-submit {
            background-color: #ffcc00;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        .btn-submit:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
        


<div class="container">
    <form action="routers/change_password.php" method="post">
        <div class="form-group">
            <label for="current-password">舊密碼</label>
            <input type="password" id="current-password" name="current_password" placeholder="請輸入原始密碼" required>
        </div>
        <div class="form-group">
            <label for="new-password">新密碼</label>
            <input type="password" id="new-password" name="new_password" placeholder="8-16字元，包含數字+大寫英文+小寫英文+特殊符號(不可含有空白、星號、單雙引號)" required>      
        </div>
        <div class="form-group">
            <label for="confirm-password">請再輸入一次新密碼</label>
            <input type="password" id="confirm-password" name="confirm_password" placeholder="請再輸入一次新密碼" required>
        </div>
        <button type="submit" class="btn-submit">確定修改</button>
    </form>
</div>

<?php if (isset($_SESSION['password_message'])): ?>
        <div style="color: red;">
            <?php echo htmlspecialchars($_SESSION['password_message']); ?>
            <?php unset($_SESSION['password_message']); // 清除錯誤訊息 ?>
        </div>
    <?php endif; ?>

</body>
</html>

