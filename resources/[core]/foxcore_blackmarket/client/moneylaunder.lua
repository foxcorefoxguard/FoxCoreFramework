RegisterCommand("launder", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    for _, location in pairs(Config.Laundering.Locations) do
        if #(coords - vector3(location.x, location.y, location.z)) < 5.0 then
            TriggerServerEvent("foxcore_blackmarket:launderMoney")
            return
        end
    end

    TriggerEvent("chat:addMessage", { args = { "[Money Launderer]", "❌ You are not in a laundering location!" } })
end, false)
