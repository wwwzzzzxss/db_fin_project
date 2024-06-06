<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="test.css">
    <title>日期和時間選擇表單</title>
    
    <script>
        function updateDays() {
            var monthSelect = document.getElementById("month");
            var daySelect = document.getElementById("day");
            var month = monthSelect.value;
            var daysInMonth;

            // 根據月份設定天數
            if (month === "02") {
                var year = new Date().getFullYear();
                // 檢查是否為閏年
                daysInMonth = (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0) ? 29 : 28;
            } else if (["04", "06", "09", "11"].includes(month)) {
                daysInMonth = 30;
            } else {
                daysInMonth = 31;
            }

            // 清空現有的日期選項
            daySelect.innerHTML = "";
            // 根據天數生成新的日期選項
            for (var d = 1; d <= daysInMonth; d++) {
                var day = String(d).padStart(2, '0');
                var option = document.createElement("option");
                option.value = day;
                option.text = d;
                daySelect.add(option);
            }
        }

        // 初始化日期選項
        document.addEventListener("DOMContentLoaded", function() {
            updateDays(); // 初始載入根據當前月份設置天數
            document.getElementById("month").addEventListener("change", updateDays);
        });
    </script>
</head>
<body>
    <form>
        <div class="form-group">
            <!-- 月份選擇 -->
            <label for="month">選擇月份：</label>
            <select id="month" name="month">
                <?php
                    for ($m = 1; $m <= 12; $m++) {
                        $month = str_pad($m, 2, '0', STR_PAD_LEFT);
                        echo "<option value=\"$month\">{$m}月</option>";
                    }
                ?>
            </select>

            <!-- 日期選擇 -->
            <label for="day">選擇日期：</label>
            <select id="day" name="day">
                <!-- 日期選項將由JavaScript動態生成 -->
            </select>

            <!-- 小時選擇 -->
            <label for="hour">選擇小時：</label>
            <select id="hour" name="hour">
                <?php
                    for ($h = 0; $h <= 23; $h++) {
                        $hour = str_pad($h, 2, '0', STR_PAD_LEFT);
                        echo "<option value=\"$hour\">$hour</option>";
                    }
                ?>
            </select>

            <!-- 分鐘選擇，每15分鐘 -->
            <label for="minute">選擇分鐘：</label>
            <select id="minute" name="minute">
                <?php
                    for ($m = 0; $m < 60; $m += 15) {
                        $minute = str_pad($m, 2, '0', STR_PAD_LEFT);
                        echo "<option value=\"$minute\">$minute</option>";
                    }
                ?>
            </select>
        </div>

        <input type="submit" value="提交">
    </form>
</body>
</html>
