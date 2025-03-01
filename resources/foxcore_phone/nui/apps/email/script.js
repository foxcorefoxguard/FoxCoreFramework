function loadEmails() {
    fetch(`https://foxcore_phone/getEmails`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("emailList");
            list.innerHTML = "";
            data.emails.forEach(email => {
                let li = document.createElement("li");
                li.textContent = `${email.sender}: ${email.subject}`;
                list.appendChild(li);
            });
        });
}

function sendEmail() {
    let recipient = document.getElementById("emailRecipient").value;
    let subject = document.getElementById("emailSubject").value;
    let body = document.getElementById("emailBody").value;

    fetch(`https://foxcore_phone/sendEmail`, {
        method: "POST",
        body: JSON.stringify({ recipient, subject, body })
    });
}
