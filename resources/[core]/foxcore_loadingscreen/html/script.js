const loadingTips = [
    "Did you know? FoxCore offers advanced job progression!",
    "Tip: You can store outfits in your home wardrobe!",
    "Reminder: Follow the server rules for the best RP experience!",
    "Fact: Vehicle durability degrades over time. Visit a mechanic!"
];

let progress = 0;
const progressBar = document.querySelector('.progress');
const loadingTip = document.getElementById('loading-tip');

function updateLoading() {
    if (progress < 100) {
        progress += 5;
        progressBar.style.width = progress + '%';
    } else {
        progress = 0;
    }

    loadingTip.innerText = loadingTips[Math.floor(Math.random() * loadingTips.length)];
}

setInterval(updateLoading, 3000);
