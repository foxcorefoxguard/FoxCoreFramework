window.addEventListener("message", function(event) {
    if (event.data.type === "openEMSUI") {
        document.getElementById("emsUI").style.display = "block";
    } else if (event.data.type === "closeEMSUI") {
        document.getElementById("emsUI").style.display = "none";
    }
});

function openMedicalRecords() {
    fetch(`https://foxcore_ambulance/getMedicalRecords`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("recordsList");
            list.innerHTML = "";

            data.forEach(record => {
                let li = document.createElement("li");
                li.innerHTML = `<b>Diagnosis:</b> ${record.diagnosis} | <b>Treatment:</b> ${record.treatment}`;
                list.appendChild(li);
            });

            document.getElementById("medicalRecords").style.display = "block";
        });
}

function closeMedicalRecords() {
    document.getElementById("medicalRecords").style.display = "none";
}

function openBilling() {
    document.getElementById("billingSystem").style.display = "block";
}

function closeBilling() {
    document.getElementById("billingSystem").style.display = "none";
}

function sendBill() {
    let patientID = document.getElementById("patientID").value;
    let amount = document.getElementById("billAmount").value;

    fetch(`https://foxcore_ambulance/sendBill`, {
        method: "POST",
        body: JSON.stringify({ patientID: patientID, amount: amount })
    });
}
