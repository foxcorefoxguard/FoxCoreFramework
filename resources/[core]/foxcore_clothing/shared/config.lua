Config = {}

-- 🏬 Clothing Store Locations
Config.ClothingShops = {
    { x = 72.3, y = -1399.1, z = 29.4 },
    { x = -708.7, y = -152.1, z = 37.4 },
    { x = -165.1, y = -302.4, z = 39.7 }
}

-- 💇 Barber Shop Locations
Config.BarberShops = {
    { x = -814.3, y = -183.8, z = 37.6 },
    { x = 136.8, y = -1708.4, z = 29.3 }
}

-- 🎭 Tattoo & Piercing Shops
Config.TattooShops = {
    { x = 1322.6, y = -1651.9, z = 51.3 },
    { x = -1153.6, y = -1425.6, z = 4.9 }
}

-- 🏠 Wardrobes Linked to FoxCore Housing
Config.Wardrobes = {
    { house = "apartment1", x = 315.2, y = -205.6, z = 54.1 },
    { house = "luxury_villa", x = -1073.8, y = -2736.9, z = 20.2 }
}

-- 🎭 Dynamic Outfit Preview Animations
Config.PreviewAnimations = {
    "WORLD_HUMAN_ADJUST_HAT",
    "WORLD_HUMAN_TOURIST_MOBILE",
    "WORLD_HUMAN_HIKER_STANDING"
}


-- 🚔 Job-Specific Clothing
Config.JobClothing = {
    police = {
        { label = "Standard Uniform", outfit = "police_uniform" },
        { label = "SWAT Gear", outfit = "swat_gear" }
    },
    ems = {
        { label = "Medic Uniform", outfit = "ems_uniform" }
    },
    mechanic = {
        { label = "Mechanic Overalls", outfit = "mechanic_overalls" }
    }
}

-- 💰 Pricing
Config.ClothingPrices = {
    ["shirt"] = 100,
    ["pants"] = 80,
    ["shoes"] = 50
}

Config.HairPrices = {
    ["haircut"] = 250,
    ["beard"] = 100,
    ["haircolor"] = 50
}

Config.TattooPrices = {
    ["tattoo"] = 500,
    ["piercing"] = 200,
    ["tattoo_removal"] = 1000
}
