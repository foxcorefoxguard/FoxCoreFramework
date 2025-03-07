window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "updateHUD") {
        document.getElementById("healthBar").style.width = data.health + "%";
        document.getElementById("armorBar").style.width = data.armor + "%";
        document.getElementById("hungerBar").style.width = data.hunger + "%";
        document.getElementById("thirstBar").style.width = data.thirst + "%";
        document.getElementById("stressBar").style.width = data.stress + "%";
        document.getElementById("fuelLevel").innerText = data.fuel + "%";
        document.getElementById("cashAmount").innerText = "$" + data.cash;
        document.getElementById("bankAmount").innerText = "$" + data.bank;
        document.getElementById("speed").innerText = data.speed + " km/h";

        // Toggle Stress Bar
        document.getElementById("stressBar").style.display = data.stress > 0 ? "block" : "none";

        // Toggle Speedometer
        document.getElementById("vehicleHUD").style.display = data.inVehicle ? "block" : "none";

        // Toggle Mini-Map
        document.getElementById("hudContainer").style.bottom = data.inVehicle ? "80px" : "20px";
    }
});
