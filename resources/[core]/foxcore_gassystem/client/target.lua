RegisterNetEvent("foxcore_gassystem:setupTargets")
AddEventHandler("foxcore_gassystem:setupTargets", function()
    exports['foxcore_target']:AddTargetModel({
        models = Config.Targeting.pumpModels,
        options = {
            {
                event = "foxcore_gassystem:startRefueling",
                icon = "fas fa-gas-pump",
                label = "Refuel Vehicle",
            }
        },
        distance = Config.Targeting.distance
    })
end)

