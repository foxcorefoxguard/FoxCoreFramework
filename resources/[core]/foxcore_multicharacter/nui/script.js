window.addEventListener("keydown", function(event) {
    if (event.key === "ArrowLeft") {
        fetch(`https://foxcore_multicharacter/rotateCharacter`, { method: "POST", body: JSON.stringify({ direction: "left" }) });
    } else if (event.key === "ArrowRight") {
        fetch(`https://foxcore_multicharacter/rotateCharacter`, { method: "POST", body: JSON.stringify({ direction: "right" }) });
    } else if (event.deltaY < 0) {
        fetch(`https://foxcore_multicharacter/zoomCamera`, { method: "POST", body: JSON.stringify({ direction: "in" }) });
    } else if (event.deltaY > 0) {
        fetch(`https://foxcore_multicharacter/zoomCamera`, { method: "POST", body: JSON.stringify({ direction: "out" }) });
    }
});
