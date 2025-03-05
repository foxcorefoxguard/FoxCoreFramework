Config = {}

-- 👮 Officer Management Settings
Config.Police = {
    Departments = { "LSPD", "BCSO", "SASP", "SAHP" },
    Ranks = { "Cadet", "Officer", "Sergeant", "Lieutenant", "Captain", "Chief" },
    RequireDutyCheck = true -- Officers must clock in to use police functions
}

-- 🚔 Vehicle & Equipment System
Config.Vehicles = {
    GarageLocations = { 
        { x = 450.1, y = -973.5, z = 25.7 },
        { x = 1850.2, y = 3680.5, z = 33.3 }
    },
    Loadouts = { "Taser", "Glock", "Shotgun", "AR15", "Flashlight", "Handcuffs" }
}

-- 📡 Radio & Dispatch Settings
Config.Radio = {
    EnableRadio = true,
    DispatchKey = "F5",
    Auto911Call = true -- Automatically notify dispatch when an officer marks a suspect
}

-- 🔬 Evidence System
Config.Evidence = {
    EnableDNA = true,
    EnableBallistics = true,
    StorageLocations = { 
        { x = 459.0, y = -992.5, z = 25.0 }, -- LSPD Evidence Locker
        { x = 1849.2, y = 3679.3, z = 33.3 } -- BCSO Evidence Room
    }
}

-- ⚖️ Legal System Integration
Config.Legal = {
    EnableFines = true,
    EnableProbationTracking = true
}

-- 🔒 Permissions & Logging
Config.Security = {
    RankPermissions = {
        ["Cadet"] = { "radio", "basic_mdt", "detain" },
        ["Officer"] = { "radio", "mdt", "detain", "fines" },
        ["Sergeant"] = { "radio", "mdt", "arrest", "fines", "warrants" },
        ["Chief"] = { "all" }
    },
    EnableLogging = true
}
