<?php
header('Content-Type: application/json');

// Simulate an error condition for demonstration
$error = true;

if ($error) {
    // Return error response
    http_response_code(400); // Set HTTP status code
    echo json_encode(array('error' => 'An error occurred while processing your request.'));
    exit;
}

// Read the raw POST data
$data = json_decode(file_get_contents('php://input'), true);

// Process data
$name = $data['name'];
$age = $data['age'];

// Return success response as JSON
$response = array('status' => 'success', 'name' => $name, 'age' => $age);
echo json_encode($response);
?>
