Config = {}

-- 🚔 Core MDT Features
Config.Features = {
    Warrants = true,        
    Fingerprints = true,    
    Evidence = true,       
    CourtLogs = true,       
    PublicRecords = true,   
    DOJSystem = true        
}

-- 🎨 UI Customization
Config.UI = {
    Theme = "dark",
    PrimaryColor = "#1e90ff",
    SecondaryColor = "#ff3838"
}

-- ⚖️ Court System Settings
Config.Court = {
    AutoApproveWarrants = false,
    MaxCaseDuration = 45, -- Increased realism for trials
    AllowPublicCaseViewing = true
}

-- 🚨 Law Enforcement Access
Config.Police = {
    RequiredJob = { "police", "sheriff", "statepolice", "fbi", "usmarshal", "doj" }, 
    AllowCivilianAccess = false
}

-- 🔊 Notifications & Sounds
Config.Notifications = {
    UseFoxCorePhone = true,
    AlertSound = "mdt_alert.mp3"
}

-- 📜 Legal System (New)
Config.Laws = {
    AllowCustomCharges = true,  -- Enables LEOs to manually add new charges
    AutoFineCalculation = true, -- Automatically applies fines based on charges
    MaxJailTime = 90            -- Ensures jail times are realistic 90 minutes
}

-- 🔍 Evidence System
Config.Evidence = {
    EnableDNAAnalysis = true,
    EnableBallistics = true,
    EnableCrimeSceneReconstruction = true
}
