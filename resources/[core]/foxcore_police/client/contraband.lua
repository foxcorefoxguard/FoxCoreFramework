RegisterCommand("searchplayer", function(source, args)
    local targetId = tonumber(args[1])
    
    if not targetId then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ Specify player ID!" } })
    end

    TriggerServerEvent("foxcore_police:searchPlayerInventory", targetId)
end, false)

-- 📡 Receive Search Results
RegisterNetEvent("foxcore_police:receiveSearchResults")
AddEventHandler("foxcore_police:receiveSearchResults", function(items)
    local contrabandFound = false

    for _, item in pairs(items) do
        if item.illegal then
            contrabandFound = true
            TriggerEvent("chat:addMessage", { args = { "[PD]", "🚨 Illegal Item Found: " .. item.name } })
        end
    end

    if not contrabandFound then
        TriggerEvent("chat:addMessage", { args = { "[PD]", "✅ No illegal items found." } })
    end
end)
