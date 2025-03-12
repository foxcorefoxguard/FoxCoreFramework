window.addEventListener("message", function(event) {
    const data = event.data;

    if (data.action === "openInventory") {
        const inventory = document.getElementById("inventory");
        inventory.innerHTML = "";

        data.items.forEach(item => {
            const itemDiv = document.createElement("div");
            itemDiv.classList.add("item");

            const itemImage = document.createElement("img");
            itemImage.src = item.image;
            itemImage.alt = item.label;

            const itemLabel = document.createElement("span");
            itemLabel.textContent = item.label;

            itemDiv.appendChild(itemImage);
            itemDiv.appendChild(itemLabel);

            inventory.appendChild(itemDiv);
        });

        document.body.style.display = "block";
    }
});
