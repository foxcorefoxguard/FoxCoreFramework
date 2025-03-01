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
