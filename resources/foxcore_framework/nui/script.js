window.addEventListener("message", function(event) {
    if (event.data.type === "openLogin") {
        document.getElementById("characterSelection").style.display = "block";
        document.getElementById("createCharacter").style.display = "none";
        let list = document.getElementById("characterList");
        list.innerHTML = "";
        event.data.characters.forEach(char => {
            let li = document.createElement("li");
            li.textContent = char.name;
            li.onclick = () => fetch(`https://foxcore/selectCharacter`, { method: "POST", body: JSON.stringify({ characterId: char.id }) });
            list.appendChild(li);
        });
    }
});

function createCharacter() {
    document.getElementById("characterSelection").style.display = "none";
    document.getElementById("createCharacter").style.display = "block";
}

function submitCharacter() {
    let firstName = document.getElementById("firstName").value;
    let lastName = document.getElementById("lastName").value;
    fetch(`https://foxcore/createCharacter`, { method: "POST", body: JSON.stringify({ firstName, lastName }) });
}
