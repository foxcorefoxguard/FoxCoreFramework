function GetPlayerData(source)
    if Config.Framework == "qbcore" then
        local Player = QBCore.Functions.GetPlayer(source)
        return {
            job = Player.PlayerData.job.name,
            money = Player.PlayerData.money,
            inventory = Player.PlayerData.items
        }
    elseif Config.Framework == "foxcore" then
        local Player = FoxCore:GetPlayer(source)
        return {
            job = Player.job,
            money = Player.money,
            inventory = Player.inventory
        }
    end
end

function AddMoney(source, amount, account)
    if Config.Framework == "qbcore" then
        QBCore.Functions.GetPlayer(source).Functions.AddMoney(account, amount)
    elseif Config.Framework == "foxcore" then
        FoxCore:AddMoney(source, amount, account)
    end
end

function RemoveMoney(source, amount, account)
    if Config.Framework == "qbcore" then
        QBCore.Functions.GetPlayer(source).Functions.RemoveMoney(account, amount)
    elseif Config.Framework == "foxcore" then
        FoxCore:RemoveMoney(source, amount, account)
    end
end

function GetJob(source)
    if Config.Framework == "qbcore" then
        return QBCore.Functions.GetPlayer(source).PlayerData.job.name
    elseif Config.Framework == "foxcore" then
        return FoxCore:GetJob(source)
    end
end

function SetJob(source, job)
    if Config.Framework == "qbcore" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.SetJob(job)
    elseif Config.Framework == "foxcore" then
        FoxCore:SetPlayerJob(source, job)
    end
end
