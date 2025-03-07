window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.action === "openMechanicUI") {
        document.getElementById("mechanicUI").style.display = "block";
    }

    if (data.action === "closeMechanicUI") {
        document.getElementById("mechanicUI").style.display = "none";
    }
});

// 🚗 Start Vehicle Repair
function startRepair() {
    fetch(`https://foxcore_mechanic/startRepair`, { method: "POST" });
    showLoading("Repairing vehicle...");
}

// 🔧 Open Tuning Menu
function openTuning() {
    fetch(`https://foxcore_mechanic/openTuning`, { method: "POST" });
    showLoading("Tuning vehicle...");
}

// 💰 Open Billing System
function openBilling() {
    fetch(`https://foxcore_mechanic/openBilling`, { method: "POST" });
}

// 🔄 Show Loading Indicator
function showLoading(message) {
    let loading = document.createElement("div");
    loading.classList.add("loading");
    loading.innerText = message;
    document.getElementById("mechanicUI").appendChild(loading);

    setTimeout(() => {
        loading.remove();
    }, 5000);
}

// Send Upgrade Request
function upgradeVehicle() {
    let partType = document.getElementById("partType").value;
    let partLevel = document.getElementById("partLevel").value;

    fetch(`https://foxcore_mechanic/upgradePart`, {
        method: "POST",
        body: JSON.stringify({ part: partType, level: partLevel })
    });

    showLoading("Installing part...");
}

// Show Loading Indicator
function showLoading(message) {
    let loading = document.createElement("div");
    loading.classList.add("loading");
    loading.innerText = message;
    document.getElementById("mechanicUI").appendChild(loading);

    setTimeout(() => { loading.remove(); }, 5000);
}
