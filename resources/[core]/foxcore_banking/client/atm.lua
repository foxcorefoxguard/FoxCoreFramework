RegisterCommand("atm", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    local nearbyATM = GetClosestObjectOfType(coords.x, coords.y, coords.z, 2.0, GetHashKey("prop_atm_01"), false, false, false)
    if nearbyATM then
        TriggerServerEvent("foxcore_banking:getBalance")
    else
        TriggerEvent("chatMessage", "[Bank]", {255, 0, 0}, "No ATM nearby!")
    end
end, false)

RegisterNetEvent("foxcore_banking:setupATMs")
AddEventHandler("foxcore_banking:setupATMs", function()
    exports['foxcore_target']:AddTargetModel({
        models = {
            "prop_atm_01", "prop_atm_02", "prop_atm_03", "prop_fleeca_atm"
        },
        options = {
            {
                event = "foxcore_banking:openATM",
                icon = "fas fa-credit-card",
                label = "Use ATM",
            }
        },
        distance = 1.5
    })
end)

RegisterNetEvent("foxcore_banking:openATM")
AddEventHandler("foxcore_banking:openATM", function()
    TriggerServerEvent("foxcore_banking:getBalance")
end)
