Config = {}

-- 🏥 EMS Settings
Config.EMS = {
    ReviveCost = 1000,
    HealCost = 500,
    NPC_EMS_Calls = true,  -- Allow NPCs to call EMS
    AmbulanceLocations = {
        { x = 311.2, y = -593.0, z = 43.2 },
        { x = 1834.6, y = 3679.2, z = 34.3 }
    }
}

-- 🚑 EMS Equipment
Config.EMSItems = {
    { name = "defibrillator", label = "Defibrillator", revive = true },
    { name = "iv_bag", label = "IV Bag", healthRestore = 50 },
    { name = "blood_bag", label = "Blood Bag", healthRestore = 75 },
    { name = "morphine", label = "Morphine", painReduction = 100, addictionRisk = 0.2 },
    { name = "medkit", label = "Medkit", healthRestore = 100 }
}

-- 🏥 Hospital Beds
Config.HospitalBeds = {
    { x = 308.2, y = -595.3, z = 43.3, occupied = false },
    { x = 310.1, y = -592.8, z = 43.3, occupied = false }
}

-- 🏥 EMS Job Ranks & Permissions
Config.EMSRanks = {
    ["emt"] = { name = "Basic EMT", revive = false, heal = true, useHelicopter = false },
    ["medic"] = { name = "Advanced Medic", revive = true, heal = true, useHelicopter = false },
    ["surgeon"] = { name = "Surgeon", revive = true, heal = true, useHelicopter = true }
}

-- 🚁 EMS Helicopter Locations
Config.HelicopterPads = {
    { x = 313.2, y = -1465.3, z = 46.5, heliModel = "polmav" },
    { x = 1853.6, y = 3689.2, z = 33.9, heliModel = "polmav" }
}

-- 🩸 EMS Equipment & Items
Config.EMSItems = {
    { name = "defibrillator", label = "Defibrillator", revive = true },
    { name = "iv_bag", label = "IV Bag", healthRestore = 50 },
    { name = "blood_bag", label = "Blood Bag", healthRestore = 75 },
    { name = "morphine", label = "Morphine", painReduction = 100, addictionRisk = 0.2 },
    { name = "medkit", label = "Medkit", healthRestore = 100 },
    { name = "wheelchair", label = "Wheelchair", movementAid = true },
    { name = "stretcher", label = "Stretcher", movementAid = true }
}

