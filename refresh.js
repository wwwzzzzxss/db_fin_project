document.addEventListener('DOMContentLoaded', function() {
    let loadedOrderIds = new Set();

    function loadOrders() {
        fetch('./routers/get_orders.php')
            .then(response => response.json())
            .then(data => {
                console.log(data); // Debug code, check the returned data
                const orders = data;
                let html = '';

                orders.forEach(order => {
                    if (!loadedOrderIds.has(order.id)) {
                        loadedOrderIds.add(order.id);
                        html += `
                            <div class="order" id="order-${order.id}">
                                <h4>Order No. ${order.id}</h4>
                                <p><strong>Date:</strong> ${order.date}</p>
                                <p><strong>Payment Type:</strong> ${order.payment_type}</p>
                                <p><strong>Status:</strong> ${order.status}</p>
                                <p><strong>Address:</strong> ${order.address}</p>
                                <p><strong>Total:</strong> ${order.total}</p>
                                <p><strong>Customer Name:</strong> ${order.customer_name}</p>
                                <p><strong>Contact:</strong> ${order.customer_contact}</p>
                                <p><strong>Email:</strong> ${order.customer_email}</p>
                                <ul><strong>Items:</strong>
                        `;
                        order.details.forEach(item => {
                            html += `
                                <li>${item.name} - Quantity: ${item.quantity}, Price: ${item.price}</li>
                            `;
                        });
                        html += `</ul></div>`;
                    }
                });

                // Append only new orders
                if (html) {
                    document.getElementById('orders-container').innerHTML += html;
                }
            });
    }

    // Load orders when the page loads
    loadOrders();

    // Set interval to reload orders every 30 seconds
    setInterval(loadOrders, 30000);
});
