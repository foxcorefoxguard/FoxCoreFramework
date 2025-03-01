RegisterNetEvent("foxcore_banking:createSharedAccount")
AddEventHandler("foxcore_banking:createSharedAccount", function(targetID)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local targetIdentifier = GetPlayerIdentifier(targetID, 0)
    local accountNumber = "ACCT-" .. math.random(10000, 99999)

    MySQL.execute("INSERT INTO shared_accounts (account_number, owner, shared_with, balance) VALUES (?, ?, ?, 0)", 
        {accountNumber, identifier, targetIdentifier})
    
    TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "✅ Shared account created with " .. GetPlayerName(targetID) } })
    TriggerClientEvent("chat:addMessage", targetID, { args = { "[Bank]", "✅ You have been added to a shared account!" } })
end)

RegisterNetEvent("foxcore_banking:depositShared")
AddEventHandler("foxcore_banking:depositShared", function(accountNumber, amount)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("UPDATE shared_accounts SET balance = balance + ? WHERE account_number = ? AND (owner = ? OR shared_with = ?)", 
        {amount, accountNumber, identifier, identifier})

    TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "✅ Deposited $" .. amount .. " into shared account!" } })
end)

RegisterNetEvent("foxcore_banking:withdrawShared")
AddEventHandler("foxcore_banking:withdrawShared", function(accountNumber, amount)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT balance FROM shared_accounts WHERE account_number = ? AND (owner = ? OR shared_with = ?)", 
        {accountNumber, identifier, identifier}, function(result)
        if result[1] and result[1].balance >= amount then
            MySQL.execute("UPDATE shared_accounts SET balance = balance - ? WHERE account_number = ?", {amount, accountNumber})
            TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "✅ Withdrew $" .. amount .. " from shared account!" } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "❌ Insufficient balance!" } })
        end
    end)
end)
