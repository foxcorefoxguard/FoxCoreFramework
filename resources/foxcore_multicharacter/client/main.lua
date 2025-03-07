RegisterNUICallback("selectCharacter", function(data)
    local charId = data.characterId

    -- Send to Server to Load Character Data
    TriggerServerEvent("foxcore_multicharacter:loadCharacter", charId)
end)

RegisterNetEvent("foxcore_multicharacter:spawnCharacter")
AddEventHandler("foxcore_multicharacter:spawnCharacter", function(characterData)
    TriggerEvent("foxcore_multicharacter:startCutscene", characterData)
end)
