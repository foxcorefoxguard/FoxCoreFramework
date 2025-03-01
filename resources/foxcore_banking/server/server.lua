local MySQL = exports['oxmysql']

RegisterNetEvent("foxcore_banking:getBalance")
AddEventHandler("foxcore_banking:getBalance", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM banking_accounts WHERE identifier = ?", {identifier}, function(accounts)
        if accounts[1] then
            TriggerClientEvent("foxcore_banking:openBankUI", src, accounts)
        else
            MySQL.execute("INSERT INTO banking_accounts (identifier, checking, savings, business) VALUES (?, 0, 0, 0)", {identifier})
            TriggerClientEvent("foxcore_banking:openBankUI", src, {checking = 0, savings = 0, business = 0})
        end
    end)
end)

RegisterNetEvent("foxcore_banking:deposit")
AddEventHandler("foxcore_banking:deposit", function(amount, account)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("UPDATE banking_accounts SET ?? = ?? + ? WHERE identifier = ?", {account, account, amount, identifier})
end)

RegisterNetEvent("foxcore_banking:withdraw")
AddEventHandler("foxcore_banking:withdraw", function(amount, account)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("UPDATE banking_accounts SET ?? = ?? - ? WHERE identifier = ?", {account, account, amount, identifier})
end)

RegisterNetEvent("foxcore_banking:getBusinessAccount")
AddEventHandler("foxcore_banking:getBusinessAccount", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT business FROM banking_accounts WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_banking:openCashRegisterUI", src, result[1].business)
        else
            TriggerClientEvent("foxcore_banking:openCashRegisterUI", src, 0)
        end
    end)
end)

RegisterNetEvent("foxcore_banking:requestLoan")
AddEventHandler("foxcore_banking:requestLoan", function(amount)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    -- Max loan limit check
    if amount > 50000 then
        TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "❌ Loan limit exceeded! Max loan: $50,000." } })
        return
    end

    -- Grant loan & increase loan balance
    MySQL.execute("UPDATE banking_accounts SET checking = checking + ?, loan_balance = loan_balance + ? WHERE identifier = ?", 
        {amount, amount, identifier})

    TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "✅ Loan Approved! You received $" .. amount } })
end)

RegisterNetEvent("foxcore_banking:repayLoan")
AddEventHandler("foxcore_banking:repayLoan", function(amount)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT loan_balance FROM banking_accounts WHERE identifier = ?", {identifier}, function(result)
        if result[1] and result[1].loan_balance >= amount then
            MySQL.execute("UPDATE banking_accounts SET checking = checking - ?, loan_balance = loan_balance - ? WHERE identifier = ?", 
                {amount, amount, identifier})
            TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "✅ Loan payment successful! Paid $" .. amount } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "❌ You do not owe this much!" } })
        end
    end)
end)

RegisterNetEvent("foxcore_phone:getBankData")
AddEventHandler("foxcore_phone:getBankData", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT checking, loan_balance FROM banking_accounts WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_phone:openBankingApp", src, result[1].checking, result[1].loan_balance)
        end
    end)
end)

RegisterNetEvent("foxcore_phone:sendMoney")
AddEventHandler("foxcore_phone:sendMoney", function(data)
    local src = source
    local sender = GetPlayerIdentifier(src, 0)
    local recipient = data.recipient
    local amount = tonumber(data.amount)

    -- Check if sender has enough balance
    MySQL.query("SELECT checking FROM banking_accounts WHERE identifier = ?", {sender}, function(result)
        if result[1] and result[1].checking >= amount then
            -- Deduct from sender
            MySQL.execute("UPDATE banking_accounts SET checking = checking - ? WHERE identifier = ?", {amount, sender})

            -- Add to recipient
            MySQL.execute("UPDATE banking_accounts SET checking = checking + ? WHERE identifier = ?", {amount, recipient})

            TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "✅ Sent $" .. amount .. " to " .. recipient } })
            TriggerClientEvent("chat:addMessage", recipient, { args = { "[Bank]", "💰 You received $" .. amount .. " from another player!" } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "❌ Insufficient funds!" } })
        end
    end)
end)
