function loadContacts() {
    fetch(`https://foxcore_phone/getContacts`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("contactList");
            list.innerHTML = "";
            data.contacts.forEach(contact => {
                let li = document.createElement("li");
                li.textContent = `${contact.name} - ${contact.number}`;
                list.appendChild(li);
            });
        });
}

function addContact() {
    let name = document.getElementById("contactName").value;
    let number = document.getElementById("contactNumber").value;

    fetch(`https://foxcore_phone/addContact`, {
        method: "POST",
        body: JSON.stringify({ name, number })
    });
}
