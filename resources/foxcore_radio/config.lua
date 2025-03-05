Config = {}

Config.Dispatcher = {
    EnableAI = true, -- Enable or disable AI Dispatcher
    AI_Voice = "en-US-Wavenet-D", -- Google TTS voice model
    Departments = {
        police = { voice = "en-US-Wavenet-A", tone = "serious", keyword = "POLICE DISPATCH" },
        ems = { voice = "en-US-Wavenet-C", tone = "calm", keyword = "MEDICAL DISPATCH" },
        fire = { voice = "en-US-Wavenet-E", tone = "urgent", keyword = "FIRE DISPATCH" },
        tow = { voice = "en-US-Wavenet-G", tone = "neutral", keyword = "ROAD SERVICES" }
    }
}

-- 📡 Default Radio Settings
Config.Radio = {
    DefaultChannel = 1,
    MaxChannels = 100,
    DefaultVolume = 50,
    AllowChannelCustomization = true,
    SignalStrength = true, -- Enable realistic radio signal interference
    OverTalkPrevention = true -- Stops players from talking over each other
}

-- 📝 MDT Access for Specific Jobs
Config.MDTJobs = {
    "police",
    "fbi",
    "ems",
    "fire",
    "tow",
    "sheriff",
    "statepolice"
}

-- 🎙️ Default Keybinds (FiveM Native Keybinds)
Config.Keybinds = {
    OpenRadio = "F2",        -- Open/Close radio
    TalkOnRadio = "CAPSLOCK", -- Push-to-Talk for radio
    ChangeChannel = "LEFT"  -- Change radio channel
}

-- 🔧 Allow Players to Change Keybinds via FiveM Settings & Command
Config.AllowKeybindChanges = true

-- 🎙️ Mic Clicks & Sound Effects
Config.MicClicks = {
    Enable = true, -- Enable push-to-talk sound effects
    ClickOn = "radio_on.ogg",
    ClickOff = "radio_off.ogg"
}

-- 🎨 UI Customization Options
Config.UI = {
    DefaultColor = "black",
    AvailableColors = { "black", "blue", "red", "green", "yellow", "purple" }
}

-- 🔒 Encrypted Channels for Special Jobs
Config.EncryptedChannels = {
    police = { 1, 2, 3 },  -- Only police can access these channels
    ems = { 6, 7 },        -- EMS secure frequencies
    fbi = { 99, 100 }      -- FBI encrypted channels
    tow = { 11, 12 }       -- TOW encrypted channels
}

-- 🎭 Radio Animations
Config.RadioAnimations = {
    ["default"] = "cellphone_text_read_base",
    ["tactical"] = "radio_chatter",
    ["casual"] = "radio_talk"
}
