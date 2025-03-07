Config = {}

-- 🔫 Robbery Settings
Config.Robbery = {
    StoreCooldown = 600, -- Seconds before same store can be robbed again
    PoliceAlertChance = 80, -- % chance of police being alerted
    RequiredCops = 2, -- Minimum police required online
}

-- 🚗 Vehicle Theft
Config.CarTheft = {
    LockpickSuccessChance = 65, -- % chance of successful lockpick
    AlarmChance = 50, -- % chance of triggering an alarm
    ChopShopLocations = { -- Chop Shop locations for stolen vehicles
        { x = -556.91, y = -1697.82, z = 19.13 },
        { x = 480.47, y = -1316.72, z = 29.20 }
    }
}

-- 💊 Drug System
Config.Drugs = {
    DrugTypes = {
        { name = "weed", label = "Weed", price = 100 },
        { name = "cocaine", label = "Cocaine", price = 500 },
        { name = "meth", label = "Meth", price = 700 }
    },
    SellLocations = {
        { x = 129.72, y = -1284.38, z = 29.27 },
        { x = 88.29, y = -1922.10, z = 20.40 }
    }
}

-- 🕵️ Black Market
Config.BlackMarket = {
    Locations = {
        { x = -1306.78, y = -394.57, z = 36.70 },
        { x = 708.17, y = -960.13, z = 30.39 }
    }
}

-- 🔗 Kidnapping
Config.Kidnapping = {
    AllowedJobs = { "gangster", "criminal" }, -- Jobs that can kidnap
    Restraints = { "rope", "duct_tape", "handcuffs" }
}