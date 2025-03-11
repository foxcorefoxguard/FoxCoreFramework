window.addEventListener("message", function(event) {
    if (event.data.action === "openMenu") {
        document.body.style.display = "flex";
    } else if (event.data.action === "closeMenu") {
        document.body.style.display = "none";
    }
});

function closeMenu() {
    document.body.style.display = "none";
    fetch(`https://${GetParentResourceName()}/closeMenu`, { method: "POST" });
}

function selectOption(option) {
    fetch(`https://${GetParentResourceName()}/menuOption`, {
        method: "POST",
        body: JSON.stringify({ option }),
        headers: { "Content-Type": "application/json" }
    });
}
