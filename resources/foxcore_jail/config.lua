Config = {}

-- 📍 Jail Locations
Config.Jails = {
    ["bolingbroke"] = { x = 1845.0, y = 2585.8, z = 45.0 },
    ["mission_row"] = { x = 459.9, y = -994.3, z = 24.9 },
    ["gabz_prison"] = { x = 1760.0, y = 2569.0, z = 45.6 }
}

-- 🤖 AI Prisoners Settings
Config.AIPrisoners = {
    Enabled = true,
    MaxPrisoners = 10,
    SpawnLocations = {
        { x = 1780.0, y = 2590.0, z = 45.6, heading = 90.0 },
        { x = 1800.0, y = 2585.0, z = 45.6, heading = 180.0 },
        { x = 1765.0, y = 2575.0, z = 45.6, heading = 270.0 },
    },
    Animations = { "WORLD_HUMAN_MUSCLE_FLEX", "WORLD_HUMAN_SEAT_WALL", "WORLD_HUMAN_SMOKING" }
}

-- ⏳ Jail Time Settings
Config.MaxJailTime = 90 -- in minutes
Config.MinJailTime = 5  -- Minimum sentencing time

-- 🚔 TXDOC Guard System
Config.TXDOC = {
    JobName = "txdoc",
    SecurityCameras = true,
    Alarms = true,
    ArmoryLocation = { x = 1750.0, y = 2550.0, z = 45.6 }
    HQLocation = { x = 1770.0, y = 2560.0, z = 45.6 },
    WardensOffice = { x = 1780.0, y = 2565.0, z = 45.6 }
}

-- 🏚️ Prison Gang System
Config.Gangs = {
    EnableGangs = true,
    AvailableGangs = { "Ballas", "Vagos", "Mafia", "Aryan Brotherhood" },
    MaxGangMembers = 10
}

-- 📅 Visiting System
Config.Visiting = {
    EnableVisitingHours = true,
    VisitingLocation = { x = 1785.0, y = 2568.0, z = 45.6 },
    LawyerAccess = true,
    ContrabandRisk = true
}

-- 🔒 Escape Settings
Config.EscapeEnabled = true
Config.EscapeMethods = {
    ["sewer"] = { x = 1765.0, y = 2755.0, z = 41.5 },
    ["bribe_guard"] = true,
    ["team_breakout"] = true
}

-- 🛠 Prison Jobs
Config.PrisonJobs = {
    { name = "Laundry Duty", pay = 50, requiredTime = 10 },
    { name = "Kitchen Work", pay = 75, requiredTime = 15 },
    { name = "Janitor Work", pay = 50, requiredTime = 10 }
}

-- 💰 Prison Shop
Config.PrisonShop = {
    { item = "cigarettes", price = 10 },
    { item = "ramen", price = 5 },
    { item = "phone", price = 100, contraband = true },
    { item = "shank", price = 50, contraband = true }
}
