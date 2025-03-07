window.addEventListener("message", function(event) {
    if (event.data.type === "openMenu") {
        document.body.style.display = "block";
        loadMenu(event.data.actions);
    }
});

function loadMenu(actions) {
    let container = document.getElementById("menu-container");
    container.innerHTML = "";

    actions.forEach(action => {
        let item = document.createElement("div");
        item.className = "menu-item";
        item.innerHTML = action.icon;
        item.onclick = function() {
            fetch(`https://foxcore_radialmenu/menuSelect`, {
                method: "POST",
                body: JSON.stringify({ action: action.event })
            });
        };
        container.appendChild(item);
    });
}

// ❌ Close Menu on ESC
document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") {
        document.body.style.display = "none";
        fetch(`https://foxcore_radialmenu/closeMenu`, { method: "POST" });
    }
});
