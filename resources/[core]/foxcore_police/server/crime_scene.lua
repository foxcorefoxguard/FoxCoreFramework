RegisterNetEvent("foxcore_police:logCrimeMarker")
AddEventHandler("foxcore_police:logCrimeMarker", function(markerType, coords)
    local src = source
    local officer = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO police_crime_markers (officer_id, marker_type, location) VALUES (?, ?, ?)",
        { officer, markerType, json.encode(coords) })

    TriggerClientEvent("chat:addMessage", src, { args = { "[PD]", "✅ Evidence marker placed!" } })
end)

RegisterNetEvent("foxcore_police:saveCrimePhoto")
AddEventHandler("foxcore_police:saveCrimePhoto", function(photoUrl, coords)
    local src = source
    local officer = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO police_crime_photos (officer_id, photo_url, location) VALUES (?, ?, ?)",
        { officer, photoUrl, json.encode(coords) })

    TriggerClientEvent("chat:addMessage", src, { args = { "[PD]", "✅ Crime scene photo saved!" } })
end)
