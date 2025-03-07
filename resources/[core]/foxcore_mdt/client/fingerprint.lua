-- 📌 Scan a Player’s Fingerprint
RegisterNetEvent("foxcore_mdt:scanFingerprint")
AddEventHandler("foxcore_mdt:scanFingerprint", function(targetId)
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)

    TriggerServerEvent("foxcore_mdt:getFingerprint", targetId)
end)

-- 📡 Receive Fingerprint Data from Server
RegisterNetEvent("foxcore_mdt:receiveFingerprintData")
AddEventHandler("foxcore_mdt:receiveFingerprintData", function(data)
    SendNUIMessage({
        type = "fingerprintData",
        name = data.name,
        dob = data.dob,
        criminalRecord = data.criminalRecord,
        fingerprintImage = data.fingerprintImage
    })
end)
