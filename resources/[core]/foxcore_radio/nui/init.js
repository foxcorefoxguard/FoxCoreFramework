function loadRadioLayout(radioModel) {
    const modelPath = `layouts/${radioModel}/model.png`;
    const configPath = `layouts/${radioModel}/config.json`;

    // Remove previous styles
    $('link[data-radio-style]').remove();

    // Load Config for layout
    $.getJSON(configPath, function (config) {
        // Load custom style
        if (config.customStyle) {
            $('head').append(
                `<link rel="stylesheet" href="layouts/${radioModel}/${config.customStyle}" data-radio-style />`
            );
        }

        // Load radio image
        $('.radio-model').attr('src', modelPath);

        // Store config globally for tone playback
        window.radioConfig = config;
    });
}

// Function to play tones dynamically
function playTone(type) {
    const tone = window.radioConfig[`${type}Tone`];
    if (tone) {
        const audio = new Audio(`nui/sounds/${tone}.mp3`);
        audio.play();
    }
}

// Example Usage: Trigger PTT Tone
function triggerPTTTone() {
    playTone('pttTone');
}

let currentConfig = {};

window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action === "openRadio") {
        loadRadioLayout(data.model);
        $('.radio-container').fadeIn();
    }

    if (data.action === "closeRadio") {
        $('.radio-container').fadeOut();
    }

    if (data.action === "playTone") {
        playTone(data.tone);
    }
});

function loadRadioLayout(model) {
    const layoutPath = `nui/layouts/${model}`;
    const configPath = `${layoutPath}/config.json`;

    // Remove previous styles
    $('link[data-radio-style]').remove();

    $.getJSON(configPath, function (config) {
        currentConfig = config;

        // Apply custom style
        $('head').append(
            `<link rel="stylesheet" href="${layoutPath}/${config.customStyle}" data-radio-style />`
        );

        // Set model image
        $('.radio-model').attr('src', `${layoutPath}/model.png`);
    });
}

function playTone(toneType) {
    const tone = currentConfig[toneType];
    if (tone) {
        const audio = new Audio(`nui/sounds/${tone}.mp3`);
        audio.play();
    }
}

// Close radio via button click
$('.close-button').click(function () {
    $.post('https://foxcore_radio/closeRadio', JSON.stringify({}));
});
