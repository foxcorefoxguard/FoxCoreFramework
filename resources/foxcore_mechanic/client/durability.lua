local vehicleHealth = {}

-- 📌 Track Vehicle Usage & Damage
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)

        if vehicle and Config.Durability.EnableWearAndTear then
            local plate = GetVehicleNumberPlateText(vehicle)
            local mileage = GetVehicleMileage(vehicle)
            local engineHealth = GetVehicleEngineHealth(vehicle)

            -- 📉 Reduce durability over time
            local durabilityLoss = mileage * Config.Durability.MileageWearRate
            if engineHealth < 700 then
                durabilityLoss = durabilityLoss + ((700 - engineHealth) * 0.01)
            end

            -- ☔ Weather Effect
            if Config.Durability.WeatherEffect and IsPedInRain(player) then
                durabilityLoss = durabilityLoss + 0.1
            end

            vehicleHealth[plate] = (vehicleHealth[plate] or 100) - durabilityLoss
            if vehicleHealth[plate] < 20 then
                TriggerEvent("chat:addMessage", { args = { "Your vehicle is in critical condition!" } })
            end
        end
    end
end)

-- 📌 Check & Repair Vehicles
RegisterNetEvent('foxcore_mechanic:checkDurability')
AddEventHandler('foxcore_mechanic:checkDurability', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
        local plate = GetVehicleNumberPlateText(vehicle)
        local durability = vehicleHealth[plate] or 100
        TriggerEvent("chat:addMessage", { args = { "Vehicle Durability: " .. durability .. "%" } })
    end
end)
