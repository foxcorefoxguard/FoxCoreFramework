Config = {}

-- 📍 Mechanic Shop Locations
Config.MechanicShops = {
    { name = "Benny's", location = { x = -211.55, y = -1324.55, z = 30.89 }, job = "mechanic" },
    { name = "Hayes", location = { x = -1423.0, y = -450.0, z = 35.0 }, job = "mechanic" },
    { name = "Ottos", location = { x = 835.0, y = -820.0, z = 26.3 }, job = "mechanic" }
}

-- 🔧 Repair System
Config.RepairTime = 10 -- Time in seconds for each repair step
Config.UseAdvancedRepairs = true -- Requires specific parts for different repairs

-- 🚗 Upgrade & Part Levels
Config.PartLevels = {
    ["turbo"] = {
        { level = 1, label = "Basic Turbo", price = 5000, effect = "5% Speed Boost" },
        { level = 2, label = "Sport Turbo", price = 10000, effect = "10% Speed Boost" },
        { level = 3, label = "Racing Turbo", price = 20000, effect = "15% Speed Boost" }
    },
    ["engine"] = {
        { level = 1, label = "Stock Engine", price = 8000, effect = "No Boost" },
        { level = 2, label = "Tuned Engine", price = 15000, effect = "10% Acceleration Boost" },
        { level = 3, label = "Racing Engine", price = 25000, effect = "25% Acceleration Boost" }
    },
    ["brakes"] = {
        { level = 1, label = "Standard Brakes", price = 3000, effect = "Normal Braking" },
        { level = 2, label = "Sport Brakes", price = 7000, effect = "10% Better Braking" },
        { level = 3, label = "Racing Brakes", price = 12000, effect = "20% Better Braking" }
    }
}

-- 🚗 Upgrades & Customization
Config.CustomUpgrades = true
Config.UpgradeParts = {
    ["turbo"] = { price = 5000, effect = "Boost Acceleration" },
    ["engine"] = { price = 8000, effect = "Increases Speed" },
    ["suspension"] = { price = 3000, effect = "Better Handling" }
}

-- 💰 Billing & Payments
Config.PaymentMethods = { "cash", "card", "company_funds" }

-- 🛠️ Impound System
Config.ImpoundPrice = 1000
Config.ImpoundLocations = {
    { name = "Mission Row", location = { x = 410.0, y = -1625.0, z = 29.3 } },
    { name = "Sandy Shores", location = { x = 1650.0, y = 3800.0, z = 38.0 } }
}

-- 🏪 Mechanic Inventory System
Config.MechanicStock = true -- If true, mechanics must stock parts

-- 🚗 Vehicle Durability System
Config.Durability = {
    EnableWearAndTear = true,
    MileageWearRate = 0.05,  -- % durability loss per mile
    CrashDamageMultiplier = 2.0, -- Durability loss from crashes
    WeatherEffect = true  -- Vehicles degrade faster in rain/snow
}

-- 🔧 Salvaging System
Config.Salvaging = {
    EnableSalvaging = true,
    SalvageParts = {
        ["engine"] = { materials = { "scrap_metal", "wiring" }, chance = 75 },
        ["turbo"] = { materials = { "scrap_metal", "rubber" }, chance = 50 },
        ["brakes"] = { materials = { "scrap_metal", "fluid" }, chance = 60 }
    }
}

-- 📱 Mechanic Tablet Settings
Config.Tablet = {
    EnableTablet = true,
    TabletJobOnly = true  -- Only mechanics can use the tablet
}

-- 🏪 Mechanic Supplier System
Config.Suppliers = {
    ["basic"] = { name = "Auto Parts Ltd.", deliveryTime = 5, markup = 10 },
    ["advanced"] = { name = "Performance Tuning Co.", deliveryTime = 10, markup = 20 }
}

-- 🔧 Repair Animations
Config.RepairAnimations = {
    engine = "WORLD_HUMAN_WELDING",
    tires = "WORLD_HUMAN_MECHANIC",
    oil = "PROP_HUMAN_BUM_BIN"
}

-- 🏆 Job Levels & Certifications
Config.JobLevels = {
    ["trainee"] = { name = "Trainee Mechanic", requiredXP = 0 },
    ["certified"] = { name = "Certified Mechanic", requiredXP = 500 },
    ["expert"] = { name = "Expert Tuner", requiredXP = 1500 }
}

