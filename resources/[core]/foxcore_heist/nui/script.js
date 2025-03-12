// Start Heist Event
function startHeist(heistType) {
    fetch(`https://${GetParentResourceName()}/startHeist`, {
        method: "POST",
        body: JSON.stringify({ heist: heistType })
    });
}

// Close Tablet Event
function closeTablet() {
    fetch(`https://${GetParentResourceName()}/closeTablet`, {
        method: "POST"
    });
}
