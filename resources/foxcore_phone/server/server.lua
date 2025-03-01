local MySQL = exports['oxmysql']

local debugMode = true -- 🔧 Set to true for debugging

function debugLog(message)
    if debugMode then
        print("^2[FoxCore Debug]^7 " .. message) -- Prints in console with color
    end
end

local discordWebhook = "YOUR_DISCORD_WEBHOOK_URL_HERE" -- 🔗 Replace with your webhook URL
local fiveManageWebhook = "https://api.fivemanage.com/logs" -- 🔗 FiveManage API Endpoint

-- 🌐 Send Logs to Discord
function sendDiscordLog(title, description, color)
    if discordWebhook == "YOUR_DISCORD_WEBHOOK_URL_HERE" then return end -- Prevent sending if no webhook

    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["footer"] = {["text"] = "FoxCore Phone Logs"}
        }
    }

    PerformHttpRequest(discordWebhook, function(err, text, headers) end, "POST", json.encode({embeds = embed}), {["Content-Type"] = "application/json"})
end

-- 🌐 Send Logs to FiveManage
function sendFiveManageLog(event, details)
    PerformHttpRequest(fiveManageWebhook, function(err, text, headers) end, "POST", json.encode({
        server = GetConvar("sv_hostname", "Unknown Server"),
        event = event,
        details = details
    }), {["Content-Type"] = "application/json"})
end

function errorLog(errorMessage)
    print("^1[FoxCore ERROR]^7 " .. errorMessage)

    sendDiscordLog("❗ ERROR", "**Message:** `" .. errorMessage .. "`", 15158332)
    sendFiveManageLog("Error", {message = errorMessage})
end


-- 🔒 PIN Verification
RegisterNetEvent("foxcore_phone:checkPIN")
AddEventHandler("foxcore_phone:checkPIN", function(pin)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.scalar("SELECT pin FROM phone_users WHERE identifier = ?", {identifier}, function(result)
        if result and tonumber(result) == tonumber(pin) then
            TriggerClientEvent("foxcore_phone:unlockPhone", src, true)
        else
            TriggerClientEvent("foxcore_phone:unlockPhone", src, false)
        end
    end)
end)

-- 📞 Call Logs & Voicemail
RegisterNetEvent("foxcore_phone:getCallLog")
AddEventHandler("foxcore_phone:getCallLog", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_calls WHERE identifier = ? ORDER BY time DESC LIMIT 10", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadCallLog", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:getVoicemail")
AddEventHandler("foxcore_phone:getVoicemail", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_voicemail WHERE identifier = ? ORDER BY time DESC LIMIT 5", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadVoicemail", src, results)
    end)
end)

-- 💬 Messaging System
RegisterNetEvent("foxcore_phone:getMessages")
AddEventHandler("foxcore_phone:getMessages", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_messages WHERE receiver = ? ORDER BY time DESC LIMIT 20", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadMessages", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:sendMessage")
AddEventHandler("foxcore_phone:sendMessage", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local receiver = data.number
    local message = data.message

    MySQL.execute("INSERT INTO phone_messages (sender, receiver, message) VALUES (?, ?, ?)", {identifier, receiver, message})
    TriggerClientEvent("foxcore_phone:newMessage", receiver, {from = identifier, message = message})
end)

-- 👥 Contacts System
RegisterNetEvent("foxcore_phone:getContacts")
AddEventHandler("foxcore_phone:getContacts", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_contacts WHERE owner = ?", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadContacts", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:addContact")
AddEventHandler("foxcore_phone:addContact", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO phone_contacts (owner, name, number) VALUES (?, ?, ?)", {identifier, data.name, data.number})
end)

-- ₿ Crypto Trading
RegisterNetEvent("foxcore_phone:getCryptoPrices")
AddEventHandler("foxcore_phone:getCryptoPrices", function()
    local src = source
    local cryptoPrices = {
        { name = "Bitcoin", price = math.random(30000, 40000) },
        { name = "Ethereum", price = math.random(2000, 3000) },
        { name = "Litecoin", price = math.random(100, 200) }
    }
    TriggerClientEvent("foxcore_phone:loadCryptoPrices", src, cryptoPrices)
end)

RegisterNetEvent("foxcore_phone:buyCrypto")
AddEventHandler("foxcore_phone:buyCrypto", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local amount = tonumber(data.amount)

    MySQL.execute("UPDATE phone_wallet SET crypto_balance = crypto_balance + ? WHERE identifier = ?", {amount, identifier})
end)

RegisterNetEvent("foxcore_phone:sellCrypto")
AddEventHandler("foxcore_phone:sellCrypto", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local amount = tonumber(data.amount)

    MySQL.execute("UPDATE phone_wallet SET crypto_balance = crypto_balance - ? WHERE identifier = ?", {amount, identifier})
end)

-- 🛒 Marketplace System
RegisterNetEvent("foxcore_phone:getMarketplace")
AddEventHandler("foxcore_phone:getMarketplace", function()
    local src = source

    MySQL.query("SELECT * FROM phone_marketplace ORDER BY time DESC LIMIT 20", {}, function(results)
        TriggerClientEvent("foxcore_phone:loadMarketplace", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:listMarketplaceItem")
AddEventHandler("foxcore_phone:listMarketplaceItem", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO phone_marketplace (seller, name, price) VALUES (?, ?, ?)", {identifier, data.name, data.price})
end)
