Config = {}

-- ⛽ Fuel Prices
Config.FuelTypes = {
    ["regular"] = { price = 2.5, label = "Regular" },    -- $2.5 per liter
    ["premium"] = { price = 4.5, label = "Premium" },    -- $4.5 per liter
    ["diesel"] = { price = 3.5, label = "Diesel" }       -- $3.5 per liter
}

-- 🏪 Gas Stations (Add locations here)
-- ⛽ Gas Station Brands
Config.GasStations = {
    -- Los Santos Gas Stations
    {
        location = { x = -724.619, y = -935.163, z = 19.213 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = -70.2148, y = -1761.792, z = 29.534 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = 265.648, y = -1261.309, z = 29.292 },
        brand = "LTD Gasoline",
        logo = "media/logos/ltd.png",
        themeColor = "#1e90ff"
    },
    {
        location = { x = 819.653, y = -1028.846, z = 26.403 },
        brand = "LTD Gasoline",
        logo = "media/logos/ltd.png",
        themeColor = "#1e90ff"
    },
    {
        location = { x = 1208.951, y = -1402.567, z = 35.224 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = 1181.381, y = -330.847, z = 69.316 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = 620.843, y = 269.100, z = 103.089 },
        brand = "LTD Gasoline",
        logo = "media/logos/ltd.png",
        themeColor = "#1e90ff"
    },
    {
        location = { x = 2581.321, y = 362.039, z = 108.468 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = 176.631, y = -1562.025, z = 29.264 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = -319.292, y = -1471.715, z = 30.549 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },

    -- Blaine County Gas Stations
    {
        location = { x = 1701.314, y = 6416.028, z = 32.763 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = 179.857, y = 6602.839, z = 31.868 },
        brand = "LTD Gasoline",
        logo = "media/logos/ltd.png",
        themeColor = "#1e90ff"
    },
    {
        location = { x = -94.460, y = 6419.594, z = 31.489 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = 2680.890, y = 3264.860, z = 55.240 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = 2005.055, y = 3773.887, z = 32.403 },
        brand = "LTD Gasoline",
        logo = "media/logos/ltd.png",
        themeColor = "#1e90ff"
    },
    {
        location = { x = 1687.156, y = 4929.392, z = 42.078 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = 49.418, y = 2778.793, z = 58.043 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = 263.894, y = 2606.463, z = 44.983 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = 1039.958, y = 2671.134, z = 39.550 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    },
    {
        location = { x = -2096.243, y = -320.286, z = 13.168 },
        brand = "LTD Gasoline",
        logo = "media/logos/ltd.png",
        themeColor = "#1e90ff"
    },

    -- Highway Gas Stations
    {
        location = { x = 2539.685, y = 2594.192, z = 37.944 },
        brand = "Xero Gas",
        logo = "media/logos/xero.png",
        themeColor = "#ff3838"
    },
    {
        location = { x = -1112.404, y = -2884.473, z = 13.946 },
        brand = "Ron Oil",
        logo = "media/logos/ron.png",
        themeColor = "#ffa502"
    }
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
