window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.action === "updateJailUI") {
        document.getElementById("jailTime").innerText = data.time;
        document.getElementById("jailLocation").innerText = data.location;
    }
});

// Request Parole
document.getElementById("requestParole").addEventListener("click", function() {
    fetch(`https://foxcore_jail/requestParole`, { method: "POST" });
});

// Start Prison Job
document.getElementById("startJob").addEventListener("click", function() {
    fetch(`https://foxcore_jail/startJob`, { method: "POST" });
});

// Buy Item from Prison Shop
document.getElementById("buyItem").addEventListener("click", function() {
    fetch(`https://foxcore_jail/buyItem`, { method: "POST" });
});
