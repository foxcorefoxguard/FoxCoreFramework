local characters = {}

RegisterNetEvent("foxcore:openCharacterSelection", function(charList)
    characters = charList
    -- Open NUI or any UI for character selection
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openCharacterSelection",
        characters = characters
    })
end)

RegisterNUICallback("selectCharacter", function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("foxcore:loadCharacter", data.characterId)
    cb("ok")
end)

RegisterNetEvent("foxcore:spawnCharacter", function(spawnCoords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, spawnCoords)
    SetEntityHeading(ped, 180.0)
    Framework.Debug("Spawned character at: " .. tostring(spawnCoords))
end)
