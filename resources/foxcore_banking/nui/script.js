window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "openBank") {
        document.getElementById("bankUI").style.display = "block";
        document.getElementById("balance").innerText = data.balance;
        populateDropdown("accountType", data.accounts);
        populateDropdown("cardType", data.cards);
    }

    if (data.type === "updateBalance") {
        document.getElementById("balance").innerText = data.balance;
    }
});

// 📑 Populate Dropdowns for Accounts & Cards
function populateDropdown(id, items) {
    let dropdown = document.getElementById(id);
    dropdown.innerHTML = "";
    items.forEach(item => {
        let option = document.createElement("option");
        option.value = item;
        option.textContent = item.charAt(0).toUpperCase() + item.slice(1);
        dropdown.appendChild(option);
    });
}

// 💰 Deposit Money
function depositMoney() {
    let amount = document.getElementById("amount").value;
    let account = document.getElementById("accountType").value;

    fetch(`https://foxcore_banking/depositMoney`, {
        method: "POST",
        body: JSON.stringify({ amount: amount, account: account })
    });
}

// 💸 Withdraw Money
function withdrawMoney() {
    let amount = document.getElementById("amount").value;
    let account = document.getElementById("accountType").value;

    fetch(`https://foxcore_banking/withdrawMoney`, {
        method: "POST",
        body: JSON.stringify({ amount: amount, account: account })
    });
}

// 💳 Request Loan
function requestLoan() {
    let amount = document.getElementById("loanAmount").value;
    fetch(`https://foxcore_banking/requestLoan`, {
        method: "POST",
        body: JSON.stringify({ amount: amount })
    });
}

// 💳 Repay Loan
function repayLoan() {
    let amount = document.getElementById("loanAmount").value;
    fetch(`https://foxcore_banking/repayLoan`, {
        method: "POST",
        body: JSON.stringify({ amount: amount })
    });
}

// 🏦 Create Shared Account
function createSharedAccount() {
    let sharedUser = document.getElementById("sharedUser").value;
    fetch(`https://foxcore_banking/createSharedAccount`, {
        method: "POST",
        body: JSON.stringify({ targetID: sharedUser })
    });
}

// 💰 Deposit into Shared Account
function depositShared() {
    let amount = document.getElementById("amount").value;
    let account = document.getElementById("accountType").value;

    fetch(`https://foxcore_banking/depositShared`, {
        method: "POST",
        body: JSON.stringify({ amount: amount, account: account })
    });
}

// 💸 Withdraw from Shared Account
function withdrawShared() {
    let amount = document.getElementById("amount").value;
    let account = document.getElementById("accountType").value;

    fetch(`https://foxcore_banking/withdrawShared`, {
        method: "POST",
        body: JSON.stringify({ amount: amount, account: account })
    });
}

// 🔔 Show Notifications
function showNotification(message) {
    let notification = document.createElement("div");
    notification.classList.add("notification");
    notification.innerHTML = message;
    document.body.appendChild(notification);
    setTimeout(() => notification.remove(), 3000);
}

// ❌ Close Banking UI
function closeBank() {
    document.getElementById("bankUI").style.display = "none";
    fetch(`https://foxcore_banking/closeBank`, { method: "POST" });
}
