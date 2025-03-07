RegisterCommand("cashregister", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    local nearbyRegister = GetClosestObjectOfType(coords.x, coords.y, coords.z, 2.0, GetHashKey("prop_till_01"), false, false, false)
    if nearbyRegister then
        TriggerServerEvent("foxcore_banking:openCashRegister")
    else
        TriggerEvent("chatMessage", "[Store]", {255, 0, 0}, "No cash register nearby!")
    end
end, false)

RegisterNetEvent("foxcore_banking:setupCashRegisters")
AddEventHandler("foxcore_banking:setupCashRegisters", function()
    exports['foxcore_target']:AddTargetModel({
        models = {
            "prop_till_01", "prop_till_02"
        },
        options = {
            {
                event = "foxcore_banking:openCashRegister",
                icon = "fas fa-cash-register",
                label = "Access Register",
            }
        },
        distance = 1.5
    })
end)

RegisterNetEvent("foxcore_banking:openCashRegister")
AddEventHandler("foxcore_banking:openCashRegister", function()
    TriggerServerEvent("foxcore_banking:getBusinessAccount")
end)
