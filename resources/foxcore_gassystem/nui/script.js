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

function playFuelSound(soundType) {
    let soundPath = "";

    if (soundType === "pump") soundPath = "media/sounds/fuel_pump.mp3";
    if (soundType === "jerrycan") soundPath = "media/sounds/jerrycan.mp3";
    if (soundType === "siphoning") soundPath = "media/sounds/siphoning.mp3";

    let audio = new Audio(soundPath);
    audio.volume = 0.8;
    audio.play();
}
