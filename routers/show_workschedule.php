<?php
include '../includes/connect.php';

$employeeSql = "SELECT E.Name, W.day, W.Shift FROM employees AS E, workschedules AS W
WHERE E.EmployeeID = W.employee_id;";
$scheduleResult = $con->query($employeeSql);


$_SESSION['workname'] = [];
if ($scheduleResult->num_rows > 0) {
    while ($row = $scheduleResult->fetch_assoc()) {
        $_SESSION['workname'][$row['day']][$row['Shift']][] = $row['Name'];
    }
}

echo '<pre>';
print_r($_SESSION['workname']);
echo '</pre>';

?>