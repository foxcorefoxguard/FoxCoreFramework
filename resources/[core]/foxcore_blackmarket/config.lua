Config = {}

-- 🔥 Black Market Locations
Config.BlackMarketLocations = {
    { x = -1523.4, y = -408.8, z = 35.6, requiresKeycard = false }, -- Open Market (No Keycard Required)
    { x = 2387.1, y = 3305.6, z = 48.0, requiresKeycard = "keycard_level_1" }, -- Tier 1 Market (Basic Weapons)
    { x = -431.2, y = 6219.8, z = 29.3, requiresKeycard = "keycard_level_2" }, -- Tier 2 Market (Advanced Weapons)
    { x = 904.1, y = -1717.2, z = 29.4, requiresKeycard = "keycard_level_3" }  -- Tier 3 Market (Drugs & Heavy Guns)
}

-- 🛒 Black Market Items
Config.Items = {
    -- 🔑 Keycards for Black Markets
    { name = "keycard_level_1", label = "Level 1 Keycard", price = 2500 },
    { name = "keycard_level_2", label = "Level 2 Keycard", price = 5000 },
    { name = "keycard_level_3", label = "Level 3 Keycard", price = 10000 },
    -- 💰 Stolen Goods & Drugs
    { name = "stolen_gun", label = "Stolen Gun", price = 5000 },
    { name = "silencer", label = "Silencer", price = 2500 },
    { name = "stolen_watch", label = "Stolen Watch", price = 2000 },
    { name = "stolen_jewelry", label = "Stolen Jewelry", price = 3500 },
    { name = "weed", label = "Weed", price = 500 },
    { name = "cocaine", label = "Cocaine", price = 1200 },
    { name = "meth", label = "Meth", price = 1500 }
}

-- 🔫 Weapon List
Config.Weapons = {
    { name = "weapon_knife", label = "Knife", price = 500 },
    { name = "weapon_bat", label = "Baseball Bat", price = 800 },
    { name = "weapon_pistol", label = "Pistol", price = 2500 },
    { name = "weapon_combatpistol", label = "Combat Pistol", price = 3500 },
    { name = "weapon_pistol50", label = "Pistol .50", price = 4500 },
    { name = "weapon_revolver", label = "Revolver", price = 6000 },
    { name = "weapon_smg", label = "SMG", price = 8000 },
    { name = "weapon_microsmg", label = "Micro SMG", price = 7500 },
    { name = "weapon_assaultsmg", label = "Assault SMG", price = 10000 },
    { name = "weapon_assaultrifle", label = "Assault Rifle", price = 15000 },
    { name = "weapon_carbinerifle", label = "Carbine Rifle", price = 18000 },
    { name = "weapon_specialcarbine", label = "Special Carbine", price = 20000 },
    { name = "weapon_pumpshotgun", label = "Pump Shotgun", price = 10000 },
    { name = "weapon_sawnoffshotgun", label = "Sawed-Off Shotgun", price = 8000 },
    { name = "weapon_bullpupshotgun", label = "Bullpup Shotgun", price = 12000 },
    { name = "weapon_sniperrifle", label = "Sniper Rifle", price = 25000 },
    { name = "weapon_heavysniper", label = "Heavy Sniper", price = 35000 },
    { name = "weapon_minigun", label = "Minigun", price = 50000 },
    { name = "weapon_rpg", label = "RPG", price = 60000 }
}

-- 🛠️ Weapon Attachments
Config.Attachments = {
    { name = "flashlight", label = "Flashlight", price = 500 },
    { name = "suppressor", label = "Suppressor", price = 2000 },
    { name = "extended_mag", label = "Extended Mag", price = 1500 },
    { name = "grip", label = "Grip", price = 1000 },
    { name = "scope", label = "Scope", price = 2500 }
}

Config.Laundering = {
    Enabled = true,
    Locations = {
        { x = -1195.3, y = -892.1, z = 13.9 }, -- Jewelry Store
        { x = 1135.6, y = -982.2, z = 46.4 } -- Nightclub
    },
    Rate = 0.75 -- Players receive 75% clean money per laundered dirty money
}

