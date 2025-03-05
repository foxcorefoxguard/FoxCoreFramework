-- 🛑 Scan Fingerprint
RegisterCommand("fingerprint", function(source, args)
    local targetId = tonumber(args[1])

    if not targetId then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ Specify player ID!" } })
    end

    TriggerServerEvent("foxcore_police:scanFingerprint", targetId)
end, false)

-- 📡 Receive Fingerprint Data
RegisterNetEvent("foxcore_police:receiveFingerprint")
AddEventHandler("foxcore_police:receiveFingerprint", function(data)
    SendNUIMessage({
        type = "fingerprintData",
        name = data.name,
        dob = data.dob,
        criminalRecord = data.criminalRecord,
        fingerprintImage = data.fingerprintImage
    })
end)
