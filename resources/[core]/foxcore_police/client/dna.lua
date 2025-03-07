-- 🧬 Collect DNA Sample
RegisterCommand("collectdna", function(source, args)
    local targetId = tonumber(args[1])

    if not targetId then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ Specify player ID!" } })
    end

    TriggerServerEvent("foxcore_police:storeDNA", targetId)
end, false)

-- 📡 Receive DNA Match Results
RegisterNetEvent("foxcore_police:receiveDNA")
AddEventHandler("foxcore_police:receiveDNA", function(data)
    SendNUIMessage({
        type = "dnaData",
        suspect = data.suspect,
        match = data.match
    })
end)
