RegisterNetEvent("foxcore_gassystem:refuelFromJerrycan")
AddEventHandler("foxcore_gassystem:refuelFromJerrycan", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if DoesEntityExist(vehicle) then
        playFuelAnimation("jerrycan")
        playFuelSound("jerrycan")
        SetVehicleFuelLevel(vehicle, GetVehicleFuelLevel(vehicle) + 15.0)
        TriggerEvent("chat:addMessage", { args = { "[Fuel]", "✅ Vehicle refueled with Jerrycan!" } })
    end
end)

RegisterNetEvent("foxcore_gassystem:syphonFuel")
AddEventHandler("foxcore_gassystem:syphonFuel", function()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0, 0, 70)
    
    if DoesEntityExist(vehicle) then
        playFuelAnimation("siphoning")
        playFuelSound("siphoning")

        local stolenFuel = math.random(5, 15)
        SetVehicleFuelLevel(vehicle, GetVehicleFuelLevel(vehicle) - stolenFuel)
        TriggerEvent("chat:addMessage", { args = { "[Fuel]", "💀 Stole " .. stolenFuel .. "L of fuel!" } })
    else
        TriggerEvent("chat:addMessage", { args = { "[Fuel]", "❌ No vehicle nearby!" } })
    end
end)
