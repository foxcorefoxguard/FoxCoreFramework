local MDTOpen = false

-- Open MDT UI
RegisterCommand('mdt', function()
    if MDTOpen then
        SetNuiFocus(false, false)
        SendNUIMessage({ action = "closeMDT" })
        MDTOpen = false
    else
        SetNuiFocus(true, true)
        SendNUIMessage({ action = "openMDT" })
        MDTOpen = true
    end
end, false)

-- Handle Incoming Charges Data
RegisterNetEvent('foxcore_mdt:sendCharges')
AddEventHandler('foxcore_mdt:sendCharges', function(charges)
    SendNUIMessage({ action = "updateCharges", data = charges })
end)

-- Handle Evidence Collection
RegisterNetEvent('foxcore_mdt:collectEvidence')
AddEventHandler('foxcore_mdt:collectEvidence', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    -- Capture Crime Scene Photo
    TriggerServerEvent('foxcore_mdt:saveEvidence', {
        officer = GetPlayerName(PlayerId()),
        suspect = "Unknown",
        details = {
            location = coords,
            photo = "screenshot_url_here"
        }
    })
end)
