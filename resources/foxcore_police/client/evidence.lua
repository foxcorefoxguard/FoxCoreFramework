-- 🔬 Collect Evidence (DNA, Fingerprints, Bullets)
RegisterCommand("collectevidence", function(source, args)
    local evidenceType = args[1]

    if not evidenceType then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ Specify evidence type: dna, fingerprint, bullet" } })
    end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    TriggerServerEvent("foxcore_police:storeEvidence", evidenceType, coords)
end, false)

RegisterNetEvent("foxcore_inventory:useItem")
AddEventHandler("foxcore_inventory:useItem", function(item)
    if item == "dna_kit" then
        TriggerEvent("foxcore_police:collectDNA")
    elseif item == "fingerprint_scanner" then
        TriggerEvent("foxcore_police:scanFingerprint")
    elseif item == "evidence_bag" then
        TriggerEvent("foxcore_police:storeEvidence")
    elseif item == "crime_photo" then
        TriggerEvent("foxcore_police:viewCrimePhotos")
    end
end)
