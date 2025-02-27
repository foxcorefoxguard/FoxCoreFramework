function loadCrypto() {
    fetch(`https://foxcore_phone/getCryptoPrices`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("cryptoList");
            list.innerHTML = "";
            data.prices.forEach(crypto => {
                let li = document.createElement("li");
                li.textContent = `${crypto.name}: $${crypto.price}`;
                list.appendChild(li);
            });
        });
}

function buyCrypto() {
    let amount = document.getElementById("cryptoAmount").value;
    fetch(`https://foxcore_phone/buyCrypto`, {
        method: "POST",
        body: JSON.stringify({ amount })
    });
}

function sellCrypto() {
    let amount = document.getElementById("cryptoAmount").value;
    fetch(`https://foxcore_phone/sellCrypto`, {
        method: "POST",
        body: JSON.stringify({ amount })
    });
}
