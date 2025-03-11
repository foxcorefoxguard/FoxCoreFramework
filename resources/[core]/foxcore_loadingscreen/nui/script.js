window.addEventListener('message', function(event) {
    const action = event.data.action;

    if (action === 'show') {
        document.body.style.display = 'flex';
    } else if (action === 'hide') {
        document.body.style.display = 'none';
    }
});
