Config = {}

-- ⛽ Fuel Prices
Config.FuelTypes = {
    ["regular"] = { price = 3.5, label = "Regular" },    -- $3.5 per liter
    ["premium"] = { price = 4.5, label = "Premium" },    -- $4.5 per liter
    ["diesel"] = { price = 3.0, label = "Diesel" }       -- $3.0 per liter
}

-- 🏪 Gas Stations (Add locations here)
Config.GasStations = {
    -- Los Santos
    { x = -724.619, y = -935.163, z = 19.213 },  -- Little Seoul
    { x = -70.2148, y = -1761.792, z = 29.534 },  -- Grove Street
    { x = 265.648, y = -1261.309, z = 29.292 },  -- Davis
    { x = 819.653, y = -1028.846, z = 26.403 },  -- La Mesa
    { x = 1208.951, y = -1402.567, z = 35.224 },  -- El Burro Heights
    { x = 1181.381, y = -330.847, z = 69.316 },  -- Mirror Park
    { x = 620.843, y = 269.100, z = 103.089 },  -- Vinewood
    { x = 2581.321, y = 362.039, z = 108.468 },  -- Tataviam Mountains
    { x = 176.631, y = -1562.025, z = 29.264 },  -- Strawberry
    { x = -319.292, y = -1471.715, z = 30.549 },  -- La Puerta
    
    -- Blaine County
    { x = 1701.314, y = 6416.028, z = 32.763 },  -- Paleto Bay
    { x = 179.857, y = 6602.839, z = 31.868 },  -- Paleto Bay North
    { x = -94.460, y = 6419.594, z = 31.489 },  -- Paleto Bay West
    { x = 2680.890, y = 3264.860, z = 55.240 },  -- Grand Senora Desert
    { x = 2005.055, y = 3773.887, z = 32.403 },  -- Sandy Shores
    { x = 1687.156, y = 4929.392, z = 42.078 },  -- Grapeseed
    { x = 49.418, y = 2778.793, z = 58.043 },  -- Route 68
    { x = 263.894, y = 2606.463, z = 44.983 },  -- Route 68 East
    { x = 1039.958, y = 2671.134, z = 39.550 },  -- Route 68 Middle
    { x = -2096.243, y = -320.286, z = 13.168 },  -- Great Ocean Highway
    { x = -1800.375, y = 803.661, z = 138.651 },  -- North Chumash
    { x = -1437.622, y = -276.747, z = 46.207 },  -- Morningwood
    { x = -2555.429, y = 2334.618, z = 33.078 },  -- Route 68 West
    
    -- Highway Gas Stations
    { x = 2539.685, y = 2594.192, z = 37.944 },  -- Senora Freeway North
    { x = -1112.404, y = -2884.473, z = 13.946 }  -- LSIA
}

-- 📢 Fuel Consumption (Lower = slower consumption)
Config.FuelDrainRate = 0.02 -- Vehicles lose 0.02% fuel per second of driving

-- 🎯 Target System Settings
Config.Targeting = {
    distance = 1.5,        -- Maximum distance to interact with gas pumps
    pumpModels = {         -- Prop models of gas pumps
        "prop_gas_pump_1a",
        "prop_gas_pump_1b",
        "prop_gas_pump_1c",
        "prop_fuel_pump_01"
    }
}

-- 🏦 Banking & Payment Settings
Config.PaymentMethods = {
    "cash",      -- Allow cash payments
    "bank",      -- Allow payments via FoxCore Banking
    "phone"      -- Allow payments via FoxCore Phone App
}
