function loadCallLog() {
    fetch(`https://foxcore_phone/getCallLog`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let log = document.getElementById("callLog");
            log.innerHTML = "";
            data.calls.forEach(call => {
                let li = document.createElement("li");
                li.textContent = `${call.number} - ${call.time}`;
                log.appendChild(li);
            });
        });
}

function loadVoicemail() {
    fetch(`https://foxcore_phone/getVoicemail`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let voicemail = document.getElementById("voicemail");
            voicemail.innerHTML = "";
            data.messages.forEach(msg => {
                let li = document.createElement("li");
                li.textContent = `${msg.from}: ${msg.message}`;
                voicemail.appendChild(li);
            });
        });
}
