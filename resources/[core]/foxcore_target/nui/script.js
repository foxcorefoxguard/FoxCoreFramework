window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "showTarget") {
        document.getElementById("targetUI").style.display = data.active ? "block" : "none";
    }

    if (data.type === "updateTarget") {
        let targetIcon = "media/icons/default.png";

        if (data.entityType === "atm") targetIcon = "media/icons/atm.png";
        if (data.entityType === "cash_register") targetIcon = "media/icons/cash_register.png";
        if (data.entityType === "npc") targetIcon = "media/icons/npc.png";

        document.getElementById("targetIcon").src = targetIcon;
        document.getElementById("targetLabel").innerText = "Looking at " + data.entityType;
    }

    if (data.type === "clearTarget") {
        document.getElementById("targetIcon").src = "media/icons/default.png";
        document.getElementById("targetLabel").innerText = "Looking at...";
    }
});
