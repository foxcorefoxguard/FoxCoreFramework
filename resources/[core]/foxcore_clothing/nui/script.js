// 📌 Listen for NUI Messages from the Server
window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "openUI") {
        document.getElementById("shop-ui").style.display = "block";
    }

    if (data.type === "updatePreview") {
        updateCharacterPreview(data.category, data.value);
    }
});

// 📌 Close UI
function closeUI() {
    document.getElementById("shop-ui").style.display = "none";
    fetch(`https://foxcore_clothing/closeUI`, { method: "POST" });
}

// 📌 Purchase Clothing Item
function purchaseItem(itemType) {
    fetch(`https://foxcore_clothing/purchaseClothing`, {
        method: "POST",
        body: JSON.stringify({ type: itemType })
    }).then(() => {
        closeUI();
    });
}

// 📌 Purchase Hair Service
function purchaseHaircut(hairType) {
    fetch(`https://foxcore_hairshop/purchaseHaircut`, {
        method: "POST",
        body: JSON.stringify({ type: hairType })
    }).then(() => {
        closeUI();
    });
}

// 📌 Save Outfit
function saveOutfit() {
    fetch(`https://foxcore_clothing/saveOutfit`, { method: "POST" });
}

// 📌 Load Outfit
function loadOutfit() {
    fetch(`https://foxcore_clothing/loadOutfit`, { method: "POST" });
}

// 📌 Rotate Character
function rotateCharacter(direction) {
    fetch(`https://foxcore_clothing/rotateCharacter`, {
        method: "POST",
        body: JSON.stringify({ direction: direction })
    });
}

// 📌 Zoom Camera
function zoomCamera(direction) {
    fetch(`https://foxcore_clothing/zoomCamera`, {
        method: "POST",
        body: JSON.stringify({ direction: direction })
    });
}

// 📌 Update Character Preview
function updateCharacterPreview(category, value) {
    fetch(`https://foxcore_clothing/updatePreview`, {
        method: "POST",
        body: JSON.stringify({ category: category, value: value })
    });
}

// 📌 Keybind for Closing UI (Escape Key)
document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") {
        closeUI();
    }
});
