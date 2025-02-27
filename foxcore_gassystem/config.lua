Config = {}

-- Framework detection (Choose between "standalone", "qbcore", "esx", "foxcore")
Config.Framework = "standalone"

-- Fuel settings
Config.FuelPrice = 3.0 -- Base price per fuel unit
Config.JerryCanPrice = 100 -- Cost of a jerry can
Config.JerryCanCapacity = 110 -- How much fuel a jerry can holds

-- Different fuel types
Config.FuelTypes = {
    [0] = "gasoline",   -- Compacts
    [1] = "gasoline",   -- Sedans
    [2] = "diesel",     -- SUVs
    [3] = "gasoline",   -- Coupes
    [4] = "gasoline",   -- Muscle
    [5] = "premium",    -- Sports Classics
    [6] = "premium",    -- Sports
    [7] = "premium",    -- Super
    [8] = "gasoline",   -- Motorcycles
    [9] = "diesel",     -- Off-road
    [10] = "diesel",    -- Industrial
    [11] = "diesel",    -- Utility
    [12] = "diesel",    -- Vans
    [13] = "electric",  -- Cycles
    [14] = "gasoline",  -- Boats
    [15] = "jet fuel",  -- Helicopters
    [16] = "jet fuel",  -- Planes
    [17] = "diesel",    -- Service
    [18] = "diesel",    -- Emergency
    [19] = "diesel",    -- Military
    [20] = "gasoline",  -- Commercial
    [21] = "electric"   -- Trains
}

-- Prices per fuel type
Config.FuelPrices = {
    ["gasoline"] = 2.0,
    ["diesel"] = 2.5,
    ["premium"] = 3.5,
    ["electric"] = 0.5, -- Charging stations
    ["jet fuel"] = 4.0
}

-- Gas stations (Complete list)
Config.GasStations = {
    { x = 49.4187, y = 2778.793, z = 58.043 },
    { x = 263.894, y = 2606.463, z = 44.983 },
    { x = 1039.958, y = 2671.134, z = 39.550 },
    { x = 1207.260, y = 2660.175, z = 37.899 },
    { x = 2539.685, y = 2594.192, z = 37.944 },
    { x = 2679.858, y = 3263.946, z = 55.240 },
    { x = 2005.055, y = 3773.887, z = 32.403 },
    { x = 1687.156, y = 4929.392, z = 42.078 },
    { x = 1701.314, y = 6416.028, z = 32.763 },
    { x = 179.857, y = 6602.839, z = 31.868 },
    { x = -94.4619, y = 6419.594, z = 31.489 },
    { x = -2554.996, y = 2334.40, z = 33.078 },
    { x = -1800.375, y = 803.661, z = 138.651 },
    { x = -1437.622, y = -276.747, z = 46.207 },
    { x = -2096.243, y = -320.286, z = 13.168 },
    { x = -724.619, y = -935.163, z = 19.213 },
    { x = -526.019, y = -1211.003, z = 18.184 },
    { x = -70.2148, y = -1761.792, z = 29.534 },
    { x = 265.648, y = -1261.309, z = 29.292 },
    { x = 819.653, y = -1028.846, z = 26.403 },
    { x = 1208.951, y = -1402.567, z = 35.224 },
    { x = 1181.381, y = -330.847, z = 69.316 },
    { x = 620.843, y = 269.100, z = 103.089 },
    { x = 2581.321, y = 362.039, z = 108.468 },
    { x = 176.631, y = -1562.025, z = 29.263 },
    { x = -319.292, y = -1471.715, z = 30.549 },
    { x = 1784.324, y = 3330.55, z = 41.253 }
}

-- Fuel Consumption Rates
Config.FuelConsumption = {
    ["gasoline"] = 0.15,
    ["diesel"] = 0.10,
    ["premium"] = 0.12,
    ["electric"] = 0.05,
    ["jet fuel"] = 0.20
}

-- Progress Bar Settings
Config.FuelingTime = 5 -- Time in seconds to refuel a vehicle
