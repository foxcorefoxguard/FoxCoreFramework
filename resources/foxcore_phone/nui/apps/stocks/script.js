function loadStocks() {
    fetch(`https://foxcore_phone/getStockPrices`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("stocksList");
            list.innerHTML = "";
            data.stocks.forEach(stock => {
                let li = document.createElement("li");
                li.textContent = `${stock.name}: $${stock.price}`;
                list.appendChild(li);
            });
        });
}

function buyStock() {
    let amount = document.getElementById("stockAmount").value;
    fetch(`https://foxcore_phone/buyStock`, {
        method: "POST",
        body: JSON.stringify({ amount })
    });
}

function sellStock() {
    let amount = document.getElementById("stockAmount").value;
    fetch(`https://foxcore_phone/sellStock`, {
        method: "POST",
        body: JSON.stringify({ amount })
    });
}
