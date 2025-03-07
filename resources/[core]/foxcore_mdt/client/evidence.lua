-- 🖥️ Upload Digital Evidence
RegisterNUICallback("uploadEvidence", function(data, cb)
    TriggerServerEvent("foxcore_mdt:saveEvidence", data)
    cb("ok")
end)

-- 📡 Receive Evidence List from Server
RegisterNetEvent("foxcore_mdt:receiveEvidence")
AddEventHandler("foxcore_mdt:receiveEvidence", function(evidence)
    SendNUIMessage({
        type = "updateEvidenceList",
        evidence = evidence
    })
end)
