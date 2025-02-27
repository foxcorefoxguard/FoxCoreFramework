window.addEventListener('message', function(event) {
    if (event.data.action === "updateFuel") {
        let fuelLevel = event.data.fuel;
        document.getElementById("fuel-percent").innerText = Math.round(fuelLevel) + "%";

        let fuelCircle = document.querySelector(".fuel-circle");
        if (fuelLevel > 60) {
            fuelCircle.style.borderColor = "#4caf50"; // Green
        } else if (fuelLevel > 30) {
            fuelCircle.style.borderColor = "#ffcc00"; // Yellow
        } else {
            fuelCircle.style.borderColor = "#ff3b3b"; // Red
        }
    }
});
