// Data to be sent to the server
const data = { name: "John", age: 30 };

fetch('server.php', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
})
.then(response => {
    if (!response.ok) {
        // Handle HTTP errors
        throw new Error('Network response was not ok ' + response.statusText);
    }
    return response.json();
})
.then(data => {
    // Handle successful response
    console.log('Success:', data);
})
.catch(error => {
    // Handle errors
    console.error('Error:', error);
    document.getElementById('error').innerText = error.message;
});
