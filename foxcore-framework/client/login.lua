RegisterNetEvent("foxcore:openLoginUI", function(characters)
    SetNuiFocus(true, true) -- Enable UI
    SendNUIMessage({
        type = "openLogin",
        characters = characters
    })
end)

RegisterNUICallback("selectCharacter", function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("foxcore:loadCharacter", data.characterId)
    cb("ok")
end)

RegisterNUICallback("createCharacter", function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("foxcore:createCharacter", data.firstName, data.lastName)
    cb("ok")
end)
