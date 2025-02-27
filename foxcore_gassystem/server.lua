local QBCore, ESX, FoxCore = nil, nil, nil

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

-- Server event to process fuel payments
RegisterServerEvent("fivem_gas:payForFuel")
AddEventHandler("fivem_gas:payForFuel", function(vehicleNet, price, fuelType)
    local src = source
    local xPlayer

    if Config.Framework == "qbcore" then
        xPlayer = QBCore.Functions.GetPlayer(src)
    elseif Config.Framework == "esx" then
        xPlayer = ESX.GetPlayerFromId(src)
    elseif Config.Framework == "foxcore" then
        xPlayer = FoxCore:GetPlayer(src)
    end

    if xPlayer then
        if xPlayer.getMoney and xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            TriggerClientEvent("fivem_gas:refuelVehicle", src, vehicleNet)
            TriggerClientEvent("chat:addMessage", src, { args = { "^2[INFO] ^0Fuel purchased for $" .. price } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "^1[ERROR] ^0Not enough money!" } })
        end
    else
        TriggerClientEvent("fivem_gas:refuelVehicle", src, vehicleNet)
    end
end)

-- Server event to buy a jerry can
RegisterServerEvent("fivem_gas:buyJerryCan")
AddEventHandler("fivem_gas:buyJerryCan", function()
    local src = source
    local xPlayer

    if Config.Framework == "qbcore" then
        xPlayer = QBCore.Functions.GetPlayer(src)
    elseif Config.Framework == "esx" then
        xPlayer = ESX.GetPlayerFromId(src)
    elseif Config.Framework == "foxcore" then
        xPlayer = FoxCore:GetPlayer(src)
    end

    if xPlayer and xPlayer.getMoney() >= Config.JerryCanPrice then
        xPlayer.removeMoney(Config.JerryCanPrice)
        TriggerClientEvent("inventory:addItem", src, "jerrycan", 1)
    else
        TriggerClientEvent("chat:addMessage", src, { args = { "^1[ERROR] ^0Not enough money!" } })
    end
end)
