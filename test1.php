<?php
include 'includes/connect.php';
include 'includes/wallet.php';

if ($con == null) {
    die("数据库连接未成功建立");
}
?>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="test/menu.css">
    <style>
        .tab-menu {
            display: flex;
            justify-content: space-around;
            background-color: #f8f8f8;
            padding: 10px 0;
            border-bottom: 2px solid #ccc;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .tab-menu div {
            padding: 10px 20px;
            cursor: pointer;
        }
        .tab-menu div.active {
            border-bottom: 2px solid black;
            font-weight: bold;
        }
        .menu-section {
            padding: 20px;
        }
        .menu-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .item-info {
            flex: 1;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
        }
        .quantity-controls button {
            width: 30px;
            height: 30px;
        }
        .quantity-controls input {
            width: 50px;
            text-align: center;
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <div class="tab-menu">
        <div class="active" onclick="scrollToSection('section-noodle', this)">麵</div>
        <div onclick="scrollToSection('section-rice', this)">飯</div>
        <div onclick="scrollToSection('section-drink', this)">飲料</div>
    </div>

    <form action="place-order.php" method="post">
        <div id="section-noodle" class="menu-section">
            <h2>麵</h2>
            <?php
                $result = mysqli_query($con, "SELECT * FROM items WHERE NOT deleted AND type = 'N';");
                while($row = mysqli_fetch_array($result)) {
                    echo '<div class="menu-item">';
                    echo '<div class="item-info">'.$row["name"].' - $'.$row["price"].'</div>';
                    echo '<div class="quantity-controls">';
                    echo '<button type="button" onclick="decrementQuantity(\'item'.$row["it_id"].'\')">-</button>';
                    echo '<input type="number" name="items['.$row["it_id"].']" id="item'.$row["it_id"].'" value="1" min="1">';
                    echo '<button type="button" onclick="incrementQuantity(\'item'.$row["it_id"].'\')">+</button>';
                    echo '</div></div>';
                }
            ?>
        </div>

        <div id="section-rice" class="menu-section">
            <h2>飯</h2>
            <?php
                $result = mysqli_query($con, "SELECT * FROM items WHERE NOT deleted AND type = '';");
                while($row = mysqli_fetch_array($result)) {
                    echo '<div class="menu-item">';
                    echo '<div class="item-info">'.$row["name"].' - $'.$row["price"].'</div>';
                    echo '<div class="quantity-controls">';
                    echo '<button type="button" onclick="decrementQuantity(\'item'.$row["it_id"].'\')">-</button>';
                    echo '<input type="number" name="items['.$row["it_id"].']" id="item'.$row["it_id"].'" value="1" min="1">';
                    echo '<button type="button" onclick="incrementQuantity(\'item'.$row["it_id"].'\')">+</button>';
                    echo '</div></div>';
                }
            ?>
        </div>

        <div id="section-drink" class="menu-section">
            <h2>飲料</h2>
            <?php
                $result = mysqli_query($con, "SELECT * FROM items WHERE NOT deleted AND type = 'D';");
                while($row = mysqli_fetch_array($result)) {
                    echo '<div class="menu-item">';
                    echo '<div class="item-info">'.$row["name"].' - $'.$row["price"].'</div>';
                    echo '<div class="quantity-controls">';
                    echo '<button type="button" onclick="decrementQuantity(\'item'.$row["it_id"].'\')">-</button>';
                    echo '<input type="number" name="items['.$row["it_id"].']" id="item'.$row["it_id"].'" value="1" min="1">';
                    echo '<button type="button" onclick="incrementQuantity(\'item'.$row["it_id"].'\')">+</button>';
                    echo '</div></div>';
                }
            ?>
        </div>

        <div style="text-align: center;">
            <button type="submit">提交訂單</button>
        </div>
    </form>

    <script>
        function scrollToSection(sectionId, element) {
            var offset = 20; // 調整的距離值，可以根據需要修改
            document.querySelectorAll('.tab-menu div').forEach(function(tab) {
                tab.classList.remove('active');
            });
            element.classList.add('active');
            
            var section = document.getElementById(sectionId);
            var scrollPosition = section.offsetTop - document.querySelector('.tab-menu').offsetHeight - offset;
            window.scrollTo({
                top: scrollPosition,
                behavior: 'smooth'
            });
        }

        function incrementQuantity(id) {
            var input = document.getElementById(id);
            input.value = parseInt(input.value) + 1;
        }

        function decrementQuantity(id) {
            var input = document.getElementById(id);
            if (input.value > 1) {
                input.value = parseInt(input.value) - 1;
            }
        }
    </script>
</body>
</html>
