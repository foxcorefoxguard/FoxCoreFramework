function startRefueling() {
    let fuelType = document.getElementById("fuelType").value;
    let paymentMethod = document.getElementById("paymentMethod").value;
    let liters = document.getElementById("liters").value;

    fetch(`https://foxcore_gassystem/startRefueling`, {
        method: "POST",
        body: JSON.stringify({ fuelType: fuelType, liters: liters, paymentMethod: paymentMethod })
    });

    closeFuelUI();
}

function closeFuelUI() {
    document.getElementById("fuelUI").style.display = "none";
}
