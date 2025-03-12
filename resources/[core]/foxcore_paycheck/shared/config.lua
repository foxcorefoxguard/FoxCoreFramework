Config = {}

-- ⏰ Paycheck Timers (in minutes)
Config.PaycheckInterval = 30

-- 💼 Default Paycheck Amounts by Job
Config.Jobs = {
    ["police"] = 500,
    ["ambulance"] = 450,
    ["mechanic"] = 400,
    ["taxi"] = 350,
    ["farmer"] = 300,
    ["delivery"] = 280,
    ["unemployed"] = 150,
}

-- 🏦 Multiple Bank Locations for Paycheck Collection
Config.BankLocations = {
    {
        label = "Fleeca Bank (Downtown)",
        location = vector3(150.266, -1040.203, 29.374),
        heading = 340.0,
        pedModel = "s_m_m_highsec_01",
        accountType = "fleeca"
    },
    {
        label = "Pacific Standard Bank",
        location = vector3(243.13, 225.13, 106.29),
        heading = 160.0,
        pedModel = "s_m_m_highsec_02",
        accountType = "pacific"
    },
    {
        label = "Maze Bank",
        location = vector3(-1212.98, -330.84, 37.78),
        heading = 90.0,
        pedModel = "s_m_m_highsec_03",
        accountType = "maze"
    }
}
