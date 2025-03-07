window.addEventListener("message", function(event) {
    if (event.data.type === "openInventory") {
        document.getElementById("inventory").style.display = "block";
        let list = document.getElementById("inventoryList");
        list.innerHTML = "";
        Object.keys(event.data.inventory).forEach(item => {
            let li = document.createElement("li");
            li.textContent = `${event.data.inventory[item]}x ${item}`;
            li.onclick = () => fetch(`https://foxcore_inventory/useItem`, { method: "POST", body: JSON.stringify({ item }) });
            list.appendChild(li);
        });
    }
});

function closeInventory() {
    fetch(`https://foxcore_inventory/closeInventory`, { method: "POST" });
}
