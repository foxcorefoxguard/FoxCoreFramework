-- Target Entity for Heist Start
exports['foxcore_target']:AddTargetEntity(ped, {
    options = {
        {
            label = "Access Heist Tablet 💻",
            icon = "fas fa-tablet",
            action = function()
                TriggerEvent("heisttablet")
            end
        }
    },
    distance = 2.5
})
