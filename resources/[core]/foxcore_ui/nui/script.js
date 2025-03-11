window.addEventListener("message", function(event) {
    if (event.data.action === "openUI") {
        document.querySelector(".ui-container").style.display = "block";
    }
});

function closeUI() {
    document.querySelector(".ui-container").style.display = "none";
    fetch(`https://${GetParentResourceName()}/closeUI`, { method: "POST" });
}

function buttonClick(button) {
    fetch(`https://${GetParentResourceName()}/buttonClicked`, {
        method: "POST",
        body: JSON.stringify({ button }),
        headers: { "Content-Type": "application/json" }
    });
}
