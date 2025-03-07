window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "openBankingApp") {
        document.getElementById("bankingApp").style.display = "block";
        document.getElementById("bankBalance").innerText = data.balance;
        document.getElementById("loanBalance").innerText = data.loan;
    }

    if (data.type === "updateBankBalance") {
        document.getElementById("bankBalance").innerText = data.balance;
    }

    if (data.type === "updateLoanBalance") {
        document.getElementById("loanBalance").innerText = data.loan;
    }
});

// 💰 Deposit Money
function depositMoney() {
    let amount = document.getElementById("bankAmount").value;
    fetch(`https://foxcore_banking/depositMoney`, {
        method: "POST",
        body: JSON.stringify({ amount: amount })
    });
}

// 💸 Withdraw Money
function withdrawMoney() {
    let amount = document.getElementById("bankAmount").value;
    fetch(`https://foxcore_banking/withdrawMoney`, {
        method: "POST",
        body: JSON.stringify({ amount: amount })
    });
}

// 📤 Send Money to Player
function sendMoney() {
    let amount = document.getElementById("bankAmount").value;
    let recipient = document.getElementById("recipientID").value;

    fetch(`https://foxcore_banking/sendMoney`, {
        method: "POST",
        body: JSON.stringify({ amount: amount, recipient: recipient })
    });
}

// 💳 Repay Loan
function repayLoan() {
    let amount = document.getElementById("loanPayment").value;
    fetch(`https://foxcore_banking/repayLoan`, {
        method: "POST",
        body: JSON.stringify({ amount: amount })
    });
}

// ❌ Close Banking App
function closeApp(app) {
    document.getElementById(app).style.display = "none";
    fetch(`https://foxcore_phone/closeApp`, { method: "POST" });
}

// Gas System
window.addEventListener("message", function(event) {
    let data = event.data;
    if (data.type === "openPaymentUI") {
        document.getElementById("paymentUI").style.display = "block";
        document.getElementById("paymentAmount").innerText = data.amount;
        document.getElementById("paymentReason").innerText = data.reason;
    }
});

function confirmPayment() {
    fetch(`https://foxcore_gassystem/processPayment`, { method: "POST" })
        .then(() => {
            document.getElementById("paymentUI").style.display = "none";
            fetch(`https://foxcore_gassystem/refuelVehicle`, { method: "POST" });
        });
}

function cancelPayment() {
    document.getElementById("paymentUI").style.display = "none";
}
