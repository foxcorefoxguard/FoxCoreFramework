local refueling = false

RegisterNetEvent("foxcore_gassystem:refuel")
AddEventHandler("foxcore_gassystem:refuel", function(pricePerLiter)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if not DoesEntityExist(vehicle) or IsPedOnFoot(playerPed) then
        TriggerEvent("chat:addMessage", { args = { "[Gas Station]", "❌ You need to be in a vehicle to refuel!" } })
        return
    end

    if refueling then return end
    refueling = true

    local fuelLevel = GetVehicleFuelLevel(vehicle)
    if fuelLevel >= 100.0 then
        TriggerEvent("chat:addMessage", { args = { "[Gas Station]", "✅ Your tank is already full!" } })
        refueling = false
        return
    end

    TriggerEvent("foxcore_phone:openPaymentUI", pricePerLiter, "Refuel Vehicle", function(success)
        if success then
            local newFuel = math.min(fuelLevel + 25.0, 100.0)
            SetVehicleFuelLevel(vehicle, newFuel)
            TriggerEvent("chat:addMessage", { args = { "[Gas Station]", "⛽ Refueled! New fuel level: " .. math.floor(newFuel) .. "%" } })
        else
            TriggerEvent("chat:addMessage", { args = { "[Gas Station]", "❌ Payment failed!" } })
        end
        refueling = false
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000) -- Every 10 seconds

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) and not IsPedOnFoot(playerPed) then
            local fuelLevel = GetVehicleFuelLevel(vehicle)
            local newFuel = math.max(fuelLevel - Config.FuelDrainRate, 0)

            SetVehicleFuelLevel(vehicle, newFuel)
        end
    end
end)

