-- 🚔 Issue an Arrest Warrant
RegisterNUICallback("issueWarrant", function(data, cb)
    TriggerServerEvent("foxcore_mdt:issueWarrant", data)
    cb("ok")
end)

-- 📡 Receive Warrant List from Server
RegisterNetEvent("foxcore_mdt:receiveWarrants")
AddEventHandler("foxcore_mdt:receiveWarrants", function(warrants)
    SendNUIMessage({
        type = "updateWarrantList",
        warrants = warrants
    })
end)
