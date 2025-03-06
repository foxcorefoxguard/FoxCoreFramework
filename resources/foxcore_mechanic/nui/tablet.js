window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.action === "openTablet") {
        document.getElementById("tablet").style.display = "block";
        loadWorkOrders();
        loadInventory();
    }
});

function closeTablet() {
    fetch(`https://foxcore_mechanic/closeTablet`, { method: "POST" });
    document.getElementById("tablet").style.display = "none";
}

// 📌 Load Work Orders
function loadWorkOrders() {
    fetch(`https://foxcore_mechanic/getWorkOrders`)
    .then(response => response.json())
    .then(data => {
        let workOrders = document.getElementById("workOrders");
        workOrders.innerHTML = "";
        data.forEach(order => {
            let div = document.createElement("div");
            div.innerText = `#${order.id} - ${order.description} - $${order.price}`;
            workOrders.appendChild(div);
        });
    });
}

// 📌 Load Inventory
function loadInventory() {
    fetch(`https://foxcore_mechanic/getInventory`)
    .then(response => response.json())
    .then(data => {
        let inventory = document.getElementById("inventory");
        inventory.innerHTML = "";
        data.forEach(item => {
            let div = document.createElement("div");
            div.innerText = `${item.name} x${item.quantity}`;
            inventory.appendChild(div);
        });
    });
}
