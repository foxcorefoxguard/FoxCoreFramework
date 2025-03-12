window.addEventListener('message', function(event) {
    const action = event.data.action;

    if (action === 'show') {
        document.body.style.display = 'flex';
    } else if (action === 'hide') {
        document.body.style.display = 'none';
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const music = document.getElementById('loadingMusic');
    music.volume = 0.5; // Set default volume
});
  