RegisterNetEvent('qb-core:server:SetJob')
AddEventHandler('qb-core:server:SetJob', function(source, job)
    if Config.Framework == "foxcore" then
        FoxCore:SetPlayerJob(source, job.name)
    end
end)

RegisterNetEvent('foxcore_framework:setJob')
AddEventHandler('foxcore_framework:setJob', function(source, job)
    if Config.Framework == "qbcore" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.SetJob(job)
    end
end)

RegisterNetEvent('qb-core:server:AddMoney')
AddEventHandler('qb-core:server:AddMoney', function(source, amount, account)
    if Config.Framework == "foxcore" then
        FoxCore:AddMoney(source, amount, account)
    end
end)

RegisterNetEvent('foxcore_banking:deposit')
AddEventHandler('foxcore_banking:deposit', function(source, amount, account)
    if Config.Framework == "qbcore" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddMoney(account, amount)
    end
end)

RegisterNetEvent('qb-core:server:PlayerLoaded')
AddEventHandler('qb-core:server:PlayerLoaded', function(playerData)
    local src = source
    local identifier = playerData.citizenid

    -- Sync QBCore Player Data to FoxCore
    MySQL.Async.execute("INSERT INTO foxcore_users (identifier, name, job, money, inventory) VALUES (@identifier, @name, @job, @money, @inventory) ON DUPLICATE KEY UPDATE job = @job, money = @money, inventory = @inventory", {
        ['@identifier'] = identifier,
        ['@name'] = playerData.charinfo.firstname .. " " .. playerData.charinfo.lastname,
        ['@job'] = playerData.job.name,
        ['@money'] = json.encode(playerData.money),
        ['@inventory'] = json.encode(playerData.inventory)
    })

    print("[🔥 FoxCore] Synced QBCore Player " .. playerData.charinfo.firstname .. " " .. playerData.charinfo.lastname)
end)
