window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "openPhone") {
        document.getElementById("phone").style.display = "block";
        loadSavedSettings(); // 🔄 Load User's Settings
        playRingtone(); // 🔔 Play Ringtone
    }

    if (data.type === "loadBlackMarket") {
        updateBlackMarket(data.items);
    }

    if (data.type === "loadTweets") {
        updateTwitterFeed(data.tweets);
    }

    if (data.type === "newLocation") {
        showNotification(`${data.sender} shared a location! 📍`);
    }
});

const debugMode = true; // 🔧 Set to true to enable debugging

function debugLog(message) {
    if (debugMode) {
        console.log(`[FoxCore Debug] ${message}`);
    }
}

// Example: Debug when opening an app
function openApp(app) {
    debugLog(`Opening app: ${app}`);
    if (app === "darkweb") {
        fetch(`https://foxcore_phone/openDarkWeb`, { method: "POST" });
        document.getElementById("darkWeb").style.display = "block";
    } else if (app === "twitter") {
        fetch(`https://foxcore_phone/loadTweets`, { method: "POST" });
        document.getElementById("twitter").style.display = "block";
    } else if (app === "gps") {
        document.getElementById("gpsApp").style.display = "block";
    } else if (app === "settings") {
        document.getElementById("settingsMenu").style.display = "block";
    }
}

function toggleDebug() {
    debugMode = !debugMode;
    showNotification(`Debug Mode: ${debugMode ? "ON" : "OFF"}`);
}


// 🔒 PIN Lock System
function unlockPhone() {
    let enteredPin = document.getElementById("pinInput").value;
    fetch(`https://foxcore_phone/checkPIN`, {
        method: "POST",
        body: JSON.stringify({ pin: enteredPin })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.getElementById("lockScreen").style.display = "none";
        } else {
            showNotification("❌ Incorrect PIN!");
        }
    });
}

// 📱 Open Apps
function openApp(app) {
    if (app === "darkweb") {
        fetch(`https://foxcore_phone/openDarkWeb`, { method: "POST" });
        document.getElementById("darkWeb").style.display = "block";
    } else if (app === "twitter") {
        fetch(`https://foxcore_phone/loadTweets`, { method: "POST" });
        document.getElementById("twitter").style.display = "block";
    } else if (app === "gps") {
        document.getElementById("gpsApp").style.display = "block";
    } else if (app === "settings") {
        document.getElementById("settingsMenu").style.display = "block";
    }
}

// 🎵 Play Ringtone When Phone Opens
function playRingtone() {
    let ringtone = localStorage.getItem("ringtone") || "default.mp3";
    let audio = new Audio(`media/ringtones/${ringtone}`);
    audio.play();
}

// 🔕 Play Notification Sound
function playNotificationSound() {
    let notificationSound = new Audio("media/sounds/notification.mp3");
    notificationSound.play();
}

// 🕵️‍♂️ Dark Web: Load Items
function updateBlackMarket(items) {
    let market = document.getElementById("blackMarketList");
    market.innerHTML = "";

    items.forEach(item => {
        let li = document.createElement("li");
        li.innerHTML = `${item.name} - $${item.price} <button onclick="buyItem('${item.name}')">Buy</button>`;
        market.appendChild(li);
    });
}

function openApp(app) {
    if (app === "banking") {
        fetch(`https://foxcore_phone/getBankData`, { method: "POST" });
        document.getElementById("bankingApp").style.display = "block";
    }
}


// 🐦 Twitter: Load Tweets
function updateTwitterFeed(tweets) {
    let feed = document.getElementById("twitterFeed");
    feed.innerHTML = "";

    tweets.forEach(tweet => {
        let div = document.createElement("div");
        div.classList.add("tweet");
        div.innerHTML = `<strong>${tweet.identifier}</strong>: ${tweet.message}`;
        feed.appendChild(div);
    });
}

// 🎨 Change Background
function changeBackground() {
    let selectedBackground = document.getElementById("backgroundSelect").value;
    document.getElementById("screen").style.backgroundImage = `url('media/backgrounds/${selectedBackground}')`;

    fetch(`https://foxcore_phone/saveBackground`, {
        method: "POST",
        body: JSON.stringify({ background: selectedBackground })
    });

    localStorage.setItem("background", selectedBackground);
}

// 🎨 Change Frame
function changeFrame() {
    let selectedFrame = document.getElementById("frameSelect").value;
    document.getElementById("phoneFrame").src = `media/frames/${selectedFrame}`;

    fetch(`https://foxcore_phone/saveFrame`, {
        method: "POST",
        body: JSON.stringify({ frame: selectedFrame })
    });

    localStorage.setItem("frame", selectedFrame);
}

// 🌙 Toggle Dark Mode
function toggleDarkMode() {
    let body = document.body;
    body.classList.toggle("dark-mode");

    let darkModeEnabled = body.classList.contains("dark-mode");
    fetch(`https://foxcore_phone/saveDarkMode`, {
        method: "POST",
        body: JSON.stringify({ darkMode: darkModeEnabled })
    });

    localStorage.setItem("darkMode", darkModeEnabled);
}

// 🔄 Load Saved Settings
function loadSavedSettings() {
    fetch(`https://foxcore_phone/getSavedSettings`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            if (data.background) {
                document.getElementById("screen").style.backgroundImage = `url('media/backgrounds/${data.background}')`;
                document.getElementById("backgroundSelect").value = data.background;
            }
            if (data.frame) {
                document.getElementById("phoneFrame").src = `media/frames/${data.frame}`;
                document.getElementById("frameSelect").value = data.frame;
            }
            if (data.darkMode) {
                document.body.classList.add("dark-mode");
            }
        });

    // Load settings from localStorage in case server data is unavailable
    let savedBackground = localStorage.getItem("background");
    if (savedBackground) {
        document.getElementById("screen").style.backgroundImage = `url('media/backgrounds/${savedBackground}')`;
        document.getElementById("backgroundSelect").value = savedBackground;
    }

    let savedFrame = localStorage.getItem("frame");
    if (savedFrame) {
        document.getElementById("phoneFrame").src = `media/frames/${savedFrame}`;
        document.getElementById("frameSelect").value = savedFrame;
    }

    let savedDarkMode = localStorage.getItem("darkMode") === "true";
    if (savedDarkMode) {
        document.body.classList.add("dark-mode");
    }
}

// 📢 Show Notification
function showNotification(message) {
    let notification = document.createElement("div");
    notification.classList.add("notification");
    notification.innerHTML = message;
    document.body.appendChild(notification);
    playNotificationSound(); // 🔔 Play Notification Sound
    setTimeout(() => notification.remove(), 3000);
}

// ❌ Close Apps
function closeApp(app) {
    document.getElementById(app).style.display = "none";
}

// ❌ Close Phone
function closePhone() {
    document.getElementById("phone").style.display = "none";
    fetch(`https://foxcore_phone/closePhone`, { method: "POST" });
}

// ❌ Close Settings
function closeSettings() {
    document.getElementById("settingsMenu").style.display = "none";
}
