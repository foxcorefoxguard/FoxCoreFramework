window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "loadCrimeScenes") {
        let list = document.getElementById("crimeSceneList");
        list.innerHTML = "";

        data.scenes.forEach(scene => {
            let li = document.createElement("li");
            li.innerHTML = `<b>${scene.type}</b> - <i>${scene.date_logged}</i> <br> <button onclick="viewCrimeScene('${scene.location}')">View</button>`;
            list.appendChild(li);
        });
    }
});

function viewCrimeScene(location) {
    fetch(`https://foxcore_police/viewCrimeScene`, {
        method: "POST",
        body: JSON.stringify({ location: location })
    });
}
