function loadMessages() {
    fetch(`https://foxcore_phone/getMessages`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("messageList");
            list.innerHTML = "";
            data.messages.forEach(msg => {
                let li = document.createElement("li");
                li.textContent = `${msg.from}: ${msg.message}`;
                list.appendChild(li);
            });
        });
}

function sendMessage() {
    let number = document.getElementById("smsNumber").value;
    let message = document.getElementById("smsMessage").value;

    fetch(`https://foxcore_phone/sendMessage`, {
        method: "POST",
        body: JSON.stringify({ number, message })
    });
}
