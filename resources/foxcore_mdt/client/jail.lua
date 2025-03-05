local isArrested = false

-- 🚔 Arrest a Player
RegisterNetEvent("foxcore_mdt:arrestPlayer")
AddEventHandler("foxcore_mdt:arrestPlayer", function(time)
    isArrested = true
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, 459.918, -993.337, 24.914) -- Send to jail
    TriggerEvent("chat:addMessage", { args = { "[MDT]", "🚔 You have been arrested for " .. time .. " minutes!" } })
    Citizen.Wait(time * 60000)
    isArrested = false
end)
