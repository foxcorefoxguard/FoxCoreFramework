RegisterCommand("blackmarket", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    for _, location in pairs(Config.BlackMarketLocations) do
        if #(coords - vector3(location.x, location.y, location.z)) < 5.0 then
            if location.requiresKeycard then
                TriggerServerEvent("foxcore_blackmarket:checkKeycard", location.requiresKeycard)
            else
                SendNUIMessage({ type = "openBlackMarket", items = Config.Items })
            end
            return
        end
    end

    TriggerEvent("chat:addMessage", { args = { "[Black Market]", "❌ You are not in a valid location!" } })
end, false)

-- 📡 Open Market if Keycard is Verified
RegisterNetEvent("foxcore_blackmarket:accessGranted")
AddEventHandler("foxcore_blackmarket:accessGranted", function()
    SendNUIMessage({ type = "openBlackMarket", items = Config.Items })
end)

-- ❌ Deny Access if Keycard is Missing
RegisterNetEvent("foxcore_blackmarket:accessDenied")
AddEventHandler("foxcore_blackmarket:accessDenied", function()
    TriggerEvent("chat:addMessage", { args = { "[Black Market]", "❌ Access Denied: You need the correct keycard!" } })
end)
