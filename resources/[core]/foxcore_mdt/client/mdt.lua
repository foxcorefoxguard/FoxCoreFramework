local MDTOpen = false

-- 🚔 Open/Close MDT Command
RegisterCommand("mdt", function()
    MDTOpen = not MDTOpen
    SetNuiFocus(MDTOpen, MDTOpen)
    SendNUIMessage({ type = MDTOpen and "openMDT" or "closeMDT" })
end, false)

-- 🎯 Open MDT with Target System (Optional)
RegisterNetEvent("foxcore_mdt:openMDT")
AddEventHandler("foxcore_mdt:openMDT", function()
    MDTOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = "openMDT" })
end)

-- 🚔 Close MDT
RegisterNUICallback("closeMDT", function(data, cb)
    MDTOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ type = "closeMDT" })
    cb("ok")
end)

-- 🔍 Search for a Person, Plate, or Record
RegisterNUICallback("search", function(data, cb)
    TriggerServerEvent("foxcore_mdt:search", data.query)
    cb("ok")
end)

-- 📜 Submit a Report
RegisterNUICallback("submitReport", function(data, cb)
    TriggerServerEvent("foxcore_mdt:submitReport", data.text)
    cb("ok")
end)

-- 📡 Receive Search Results from Server
RegisterNetEvent("foxcore_mdt:searchResults")
AddEventHandler("foxcore_mdt:searchResults", function(results)
    SendNUIMessage({
        type = "searchResults",
        results = results
    })
end)

-- 🚔 Detect If Player Is a Police Officer (Framework Support)
function IsPolice()
    local playerJob = exports["foxcore_framework"]:GetPlayerJob()
    return playerJob == "police" or playerJob == "sheriff" or playerJob == "statepolice"
end

function captureMugshot()
    local playerPed = PlayerPedId()
    local mugshot = "nui://foxcore_mdt/nui/media/mugshots/" .. GetPlayerName(PlayerId()) .. ".png"
    TriggerServerEvent("foxcore_mdt:saveMugshot", mugshot)
end

-- 🔒 Restrict MDT to Police Officers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if MDTOpen and not IsPolice() then
            MDTOpen = false
            SetNuiFocus(false, false)
            SendNUIMessage({ type = "closeMDT" })
        end
    end
end)

RegisterNUICallback("setBOLO", function(data, cb)
    TriggerServerEvent("foxcore_mdt:setBOLO", data)
    cb("ok")
end)

