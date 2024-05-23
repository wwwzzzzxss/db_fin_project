document.addEventListener('DOMContentLoaded', function() {
    function loadOrders() {
        fetch('./router/get_orders.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data); // 調試代碼，檢查返回的數據
                let html = '';

                data.forEach(order => {
                    html += `
                        <div class="order">
                            <h4>Order No. ${order.id}</h4>
                            <p><strong>Date:</strong> ${order.date}</p>
                            <p><strong>Payment Type:</strong> ${order.payment_type}</p>
                            <p><strong>Status:</strong> ${order.status}</p>
                        </div>
                    `;
                });

                document.getElementById('orders-container').innerHTML = html;
            })
            .catch(error => {
                console.error('Fetch Error: ', error); // 調試代碼，檢查錯誤
            });
    }

    loadOrders();
});
