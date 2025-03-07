window.addEventListener("message", function(event) {
    if (event.data.type === "toggleRadio") {
        document.getElementById("radioUI").style.display = event.data.active ? "block" : "none";
    } else if (event.data.type === "updateChannel") {
        document.getElementById("radioChannel").innerText = `Channel: ${event.data.channel}`;
    } else if (event.data.type === "updateColor") {
        document.getElementById("radioUI").style.backgroundColor = event.data.color;
    }
});

window.addEventListener("message", function(event) {
    if (event.data.type === "playSound") {
        let audio = new Audio(`sounds/${event.data.sound}`);
        audio.volume = 0.5;
        audio.play();
    }
});

window.addEventListener("message", function(event) {
    if (event.data.type === "playTTS") {
        let speech = new SpeechSynthesisUtterance(event.data.text);
        speech.voice = speechSynthesis.getVoices().find(v => v.name.includes(event.data.voice));
        speechSynthesis.speak(speech);
    }
});
