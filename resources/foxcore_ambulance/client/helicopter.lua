RegisterCommand("spawnemsheli", function()
    local playerPed = PlayerPedId()
    local playerJob = exports["foxcore_framework"]:GetPlayerJob()
    
    if not Config.EMSRanks[playerJob] or not Config.EMSRanks[playerJob].useHelicopter then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ You do not have permission to use a helicopter!" } })
        return
    end

    for _, pad in pairs(Config.HelicopterPads) do
        local distance = #(GetEntityCoords(playerPed) - vector3(pad.x, pad.y, pad.z))
        if distance < 10.0 then
            local heli = CreateVehicle(GetHashKey(pad.heliModel), pad.x, pad.y, pad.z, 0.0, true, false)
            SetPedIntoVehicle(playerPed, heli, -1)
            TriggerEvent("chat:addMessage", { args = { "[EMS]", "🚁 Helicopter deployed!" } })
            return
        end
    end

    TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ No helipad nearby!" } })
end, false)
