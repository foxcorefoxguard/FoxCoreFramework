local evidenceMarkers = {}

-- 🔍 Place Evidence Marker
RegisterCommand("placeevidence", function(source, args)
    local markerType = args[1]
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    if not markerType then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ Specify marker type: blood, bullet, weapon" } })
    end

    local markerId = #evidenceMarkers + 1
    evidenceMarkers[markerId] = { type = markerType, location = coords }

    TriggerServerEvent("foxcore_police:logCrimeMarker", markerType, coords)
end, false)

-- 🔍 Show Crime Scene Markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for _, marker in pairs(evidenceMarkers) do
            local color = marker.type == "blood" and {255, 0, 0} or marker.type == "bullet" and {255, 255, 0} or {0, 255, 255}
            DrawMarker(2, marker.location.x, marker.location.y, marker.location.z + 0.5, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.3, color[1], color[2], color[3], 200, false, false, 2, false, nil, nil, false)
        end
    end
end)

-- 📸 Take Crime Scene Photo
RegisterCommand("crimephoto", function()
    if not exports["foxcore_framework"]:IsPlayerOnDuty() then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ You must be on duty!" } })
    end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    exports["screenshot-basic"]:requestScreenshotUpload("http://your-server-url/upload", "files[]", function(data)
        local photoUrl = json.decode(data).files[1].url
        TriggerServerEvent("foxcore_police:saveCrimePhoto", photoUrl, coords)
    end)
end, false)
