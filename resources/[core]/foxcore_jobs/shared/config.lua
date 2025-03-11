FoxCoreJobs = {}

FoxCoreJobs.List = {
    {
        id = "fruit_picker",
        label = "🍎 Fruit Picker",
        location = vector3(1234.56, -1234.56, 30.0),
        payout = { min = 150, max = 250 },
        ped = "a_m_m_farmer_01",
        requireHiring = false,
        job_grade = 0,
        blip = { sprite = 514, color = 2, scale = 0.8, name = "Fruit Picking Job" }
    },
    {
        id = "garbage_collector",
        label = "🗑️ Garbage Collector",
        location = vector3(800.0, -800.0, 30.0),
        payout = { min = 200, max = 400 },
        ped = "s_m_y_garbage",
        requireHiring = false,
        job_grade = 0,
        blip = { sprite = 318, color = 1, scale = 0.8, name = "Garbage Job" }
    },
    {
        id = "fisherman",
        label = "🎣 Fisherman",
        location = vector3(-1600.0, -1000.0, 0.0),
        payout = { min = 250, max = 500 },
        ped = "a_m_m_bevhills_01",
        requireHiring = false,
        job_grade = 0,
        blip = { sprite = 68, color = 3, scale = 0.8, name = "Fishing Job" }
    },
    {
        id = "taxi_driver",
        label = "🚕 Taxi Driver",
        location = vector3(900.0, -900.0, 30.0),
        payout = { min = 400, max = 600 },
        ped = "s_m_m_gentransport",
        requireHiring = true,
        job_grade = 0,
        blip = { sprite = 198, color = 5, scale = 0.8, name = "Taxi Job" }
    }
}
