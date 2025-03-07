window.addEventListener("message", function(event) {
    if (event.data.type === "openBlackMarket") {
        let itemList = document.getElementById("marketItems");
        itemList.innerHTML = "";

        event.data.items.forEach(item => {
            let li = document.createElement("li");
            li.innerHTML = `${item.label} - $${item.price} <button onclick="buyItem('${item.name}', ${item.price})">Buy</button>`;
            itemList.appendChild(li);
        });

        document.getElementById("blackMarketUI").style.display = "block";
    }
});

function buyItem(item, price) {
    fetch(`https://foxcore_blackmarket/buyItem`, {
        method: "POST",
        body: JSON.stringify({ item: item, price: price })
    });
}

function sellItem(item, price) {
    fetch(`https://foxcore_blackmarket/sellItem`, {
        method: "POST",
        body: JSON.stringify({ item: item, price: price })
    });
}

window.addEventListener("message", function(event) {
    if (event.data.type === "openBlackMarket") {
        let weaponList = document.getElementById("weaponList");
        let attachmentList = document.getElementById("attachmentList");

        weaponList.innerHTML = "";
        event.data.weapons.forEach(weapon => {
            let li = document.createElement("li");
            li.innerHTML = `${weapon.label} - $${weapon.price} <button onclick="buyWeapon('${weapon.name}', ${weapon.price})">Buy</button>`;
            weaponList.appendChild(li);
        });

        attachmentList.innerHTML = "";
        event.data.attachments.forEach(attachment => {
            let li = document.createElement("li");
            li.innerHTML = `${attachment.label} - $${attachment.price} <button onclick="buyAttachment('${attachment.name}', ${attachment.price})">Buy</button>`;
            attachmentList.appendChild(li);
        });

        document.getElementById("blackMarketUI").style.display = "block";
    }
});

function buyWeapon(weapon, price) {
    fetch(`https://foxcore_blackmarket/buyWeapon`, {
        method: "POST",
        body: JSON.stringify({ weapon: weapon, price: price })
    });
}

function buyAttachment(attachment, price) {
    fetch(`https://foxcore_blackmarket/buyAttachment`, {
        method: "POST",
        body: JSON.stringify({ attachment: attachment, price: price })
    });
}

window.addEventListener("message", function(event) {
    if (event.data.type === "openBlackMarket") {
        let itemList = document.getElementById("marketItems");
        itemList.innerHTML = "";

        event.data.items.forEach(item => {
            let li = document.createElement("li");
            li.innerHTML = `${item.label} - $${item.price} <button onclick="buyItem('${item.name}', ${item.price})">Buy</button>`;
            itemList.appendChild(li);
        });

        document.getElementById("blackMarketUI").style.display = "block";
    }
});

function buyItem(item, price) {
    fetch(`https://foxcore_blackmarket/buyItem`, {
        method: "POST",
        body: JSON.stringify({ item: item, price: price })
    });
}

