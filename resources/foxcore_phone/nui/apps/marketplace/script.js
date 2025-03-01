function loadMarketplace() {
    fetch(`https://foxcore_phone/getMarketplace`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("marketList");
            list.innerHTML = "";
            data.items.forEach(item => {
                let li = document.createElement("li");
                li.textContent = `${item.name} - $${item.price}`;
                list.appendChild(li);
            });
        });
}

function listItem() {
    let name = document.getElementById("marketItem").value;
    let price = document.getElementById("marketPrice").value;

    fetch(`https://foxcore_phone/listMarketplaceItem`, {
        method: "POST",
        body: JSON.stringify({ name, price })
    });
}
