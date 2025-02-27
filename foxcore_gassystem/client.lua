local QBCore, ESX, FoxCore = nil, nil, nil
local fuelLevel = 100

-- Load framework based on Config
Citizen.CreateThread(function()
    if Config.Framework == "qbcore" then
        QBCore = exports['qb-core']:GetCoreObject()
    elseif Config.Framework == "esx" then
        ESX = exports['es_extended']:getSharedObject()
    elseif Config.Framework == "foxcore" then
        FoxCore = exports['fox-core']:GetCoreObject()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

        if vehicle and DoesEntityExist(vehicle) then
            local fuelLevel = GetVehicleFuelLevel(vehicle)
            SendNUIMessage({
                action = "updateFuel",
                fuel = fuelLevel
            })
        end
    end
end)


-- Fuel Consumption Logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle and GetPedInVehicleSeat(vehicle, -1) == ped then
            local class = GetVehicleClass(vehicle)
            local fuelType = Config.FuelTypes[class] or "gasoline"
            local consumptionRate = Config.FuelConsumption[fuelType] or 0.15

            local speed = GetEntitySpeed(vehicle) * 3.6 -- Convert m/s to km/h
            if speed > 10 then
                fuelLevel = fuelLevel - (consumptionRate * (speed / 100))
                SetVehicleFuelLevel(vehicle, fuelLevel)
            end
        end
    end
end)

-- Fueling logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for _, station in pairs(Config.GasStations) do
            local dist = #(pos - vector3(station.x, station.y, station.z))

            if dist < 5.0 then
                Draw3DText(station.x, station.y, station.z + 1.0, "[E] Refuel Vehicle")

                if IsControlJustReleased(0, 38) then -- Press E
                    local vehicle = GetVehiclePedIsIn(ped, false)

                    if vehicle then
                        local class = GetVehicleClass(vehicle)
                        local fuelType = Config.FuelTypes[class] or "gasoline"
                        local price = Config.FuelPrices[fuelType] * 50 -- Assume 50 units per refill
                        TriggerServerEvent("fivem_gas:payForFuel", VehToNet(vehicle), price, fuelType)
                    else
                        TriggerEvent("chat:addMessage", { args = { "^1[ERROR] ^0No vehicle detected!" } })
                    end
                end
            end
        end
    end
end)

-- Receive fuel update from server
RegisterNetEvent("fivem_gas:refuelVehicle")
AddEventHandler("fivem_gas:refuelVehicle", function(vehicleNet)
    local vehicle = NetToVeh(vehicleNet)
    if DoesEntityExist(vehicle) then
        local fuel = 0
        while fuel < 100 do
            fuel = fuel + 1
            SetVehicleFuelLevel(vehicle, fuel + 0.0)
            Citizen.Wait(Config.FuelingTime * 10)
        end
        TriggerEvent("chat:addMessage", { args = { "^2[INFO] ^0Your vehicle is now fully refueled!" } })
    end
end)
